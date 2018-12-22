package com.acorn.project.users.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.locks.Condition;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.google.connect.GoogleServiceProvider;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.project.users.dto.UsersDto;
import com.acorn.project.users.service.UsersService;

@Controller
public class UsersController {
	@Autowired
	private UsersService service;
	
	//GoogleLogin 
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters2;
	private OAuth2Operations oauthOperations;
	
	// 회원 가입 폼 요청
	@RequestMapping("/users/signup_form")
	public String login(Model model, HttpServletResponse response, HttpSession session) {
		//구글code 발행 
		oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		model.addAttribute("google_url", url);
		// 생성한 인증 URL을 View로 전달 
		return "users/signup_form";
	}
	
	//일반 회원가입 처리
	@RequestMapping("/users/signup")
	public ModelAndView signup(ModelAndView mView, @ModelAttribute UsersDto dto, HttpSession session) {
		//dto에 세션에 있는 구글 Uid 담기
		dto.setGoogle_id((String)session.getAttribute("gUid"));
		service.addUser(mView, dto);
		//나중에 메인페이지로 연결되도록 수정
		mView.setViewName("users/greeting");
		session.setAttribute("gUid", "");
		session.setAttribute("gEmail", "");
		session.setAttribute("gName", "");
		session.setAttribute("gNick", "");
		return mView;
	}
	
	// 구글 회원가입 처리
	@RequestMapping("/oauth2callback")
	public String doSessionAssignActionPage(HttpServletRequest request) {
		String code = request.getParameter("code");
		
		oauthOperations = googleConnectionFactory.getOAuthOperations();
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, 
				googleOAuth2Parameters.getRedirectUri(), null);
		
		String accessToken = accessGrant.getAccessToken();
		Long expireTime = accessGrant.getExpireTime();
		
		if(expireTime != null && expireTime < System.currentTimeMillis()) {
			accessToken = accessGrant.getRefreshToken();
			System.out.printf("accessToken is expired. refresh token = {}", accessToken);
		}
		
		Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
		Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
		//System.out.println(connection);
		
		PlusOperations plusOperations = google.plusOperations();
		Person profile = plusOperations.getGoogleProfile();
		
		HttpSession session = request.getSession();
		session.setAttribute("gEmail", profile.getAccountEmail());
		session.setAttribute("gName", profile.getGivenName()+profile.getFamilyName());
		session.setAttribute("gNick", profile.getDisplayName());
		session.setAttribute("gUid", profile.getId());
		 try {
           //System.out.println("Closing Token....");
            String revokeUrl = "https://accounts.google.com/o/oauth2/revoke?token=" + accessToken + "";
            URL url = new URL(revokeUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setDoOutput(true);
 
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
          
        } catch (Exception e) {	
 
            e.printStackTrace();
        }
	
			return "redirect:/users/signup_form.do";
		
    }
	
	//로그인 폼 요청
	@RequestMapping("/users/login_form")	
	public String loginForm(Model model, HttpServletResponse response, HttpSession session) {		
		//구글code 발행 
		oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters2);	
		model.addAttribute("google_url", url);
		
		return "users/login_form";
	}
	
	//일반 로그인 처리
	@RequestMapping("/users/loginCheck")
	@ResponseBody
	public Map<String,Object> loginCheck(HttpSession session, ModelAndView mView, @ModelAttribute UsersDto dto) {
		
		//로그인 관련 처리
		Map<String,Object> map=service.validUser(session, mView, dto);
		//view 페이지 정보 담기
		//나중에 메인 페이지로 연결되게 바꾸기
		//mView.setViewName("users/login");
		//ModelAndView 객체 리턴
		return map;
	}
	
	
	//일반 로그인 처리
	@RequestMapping("/users/login")
	public String login(HttpSession session, ModelAndView mView, @ModelAttribute UsersDto dto) {
		//로그인 관련 처리
		//service.validUser(session, mView, dto);
		//view 페이지 정보 담기
		//나중에 메인 페이지로 연결되게 바꾸기
		//mView.setViewName("users/login");
		//ModelAndView 객체 리턴
		// 로그인 성공시 main 페이지로 이동시켜주기 위해 만든 땜빵 session
		boolean isLogined=(boolean)session.getAttribute("isLogined");
		System.out.println("isLogined : "+isLogined);
		if(isLogined) {
			System.out.println("test success");
			return "main/mainpage";
		}else {
			return "users/login";
		}
	}
	
	//구글 로그인 처리
	@RequestMapping("/oauth2callback2")
	public ModelAndView doSessionAssignActionPage2(HttpServletRequest request, ModelAndView mView) {
		String code = request.getParameter("code");
		
		oauthOperations = googleConnectionFactory.getOAuthOperations();
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, 
				googleOAuth2Parameters2.getRedirectUri(), null);
		
		String accessToken = accessGrant.getAccessToken();
		Long expireTime = accessGrant.getExpireTime();
		
		if(expireTime != null && expireTime < System.currentTimeMillis()) {
			accessToken = accessGrant.getRefreshToken();     
			//System.out.printf("accessToken is expired. refresh token = {}", accessToken);
		}
		
		Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
		Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
		//System.out.println(connection);
		
		PlusOperations plusOperations = google.plusOperations();
		Person profile = plusOperations.getGoogleProfile();
	
		HttpSession session = request.getSession();
		session.setAttribute("gEmail", profile.getAccountEmail());
		session.setAttribute("gUid", profile.getId());
		
		 try {
            //System.out.println("Closing Token....");
            String revokeUrl = "https://accounts.google.com/o/oauth2/revoke?token=" + accessToken + "";
            URL url = new URL(revokeUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setDoOutput(true);
 
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
          
        } catch (Exception e) {
 
            e.printStackTrace();
        }
		 
		 service.validGoogle(session, mView);	
		
		 boolean isLogined=(boolean)session.getAttribute("isLogined");
		 System.out.println("isLogined : "+isLogined);
		 // 이부분 조금 이상하다? 왜 login_form 으로만 가야되지?
		 if(isLogined) {
			 System.out.println("test success in google_login");
			 mView.setViewName("redirect:/main/mainpage.do");
			 //mView.setViewName("users/login_form");
		 }else {
			 mView.setViewName("users/login_form");
		 }
		 session.setAttribute("gEmail", "");
		 session.setAttribute("gUid", "");
		 return mView;
	
    }
	
	//아이디 중복확인
	@RequestMapping("/users/checkid")
	@ResponseBody
	public Map<String, Object> checkid(@RequestParam String inputId){
		Map<String, Object> map=service.canUseId(inputId);
		//canUse 가 true or false
		return map;
	}
	
	//닉네임 중복확인
	@RequestMapping("/users/checkNick")
	@ResponseBody
	public Map<String, Object> checkNick(@RequestParam String inputNick){
		Map<String, Object> map=service.canUseNick(inputNick);
		//canUseNick 도  true or false
		return map;
	}
	
	//로그아웃 (임시)
	@RequestMapping("/users/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
}
