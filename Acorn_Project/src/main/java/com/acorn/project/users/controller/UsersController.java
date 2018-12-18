package com.acorn.project.users.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
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
	private OAuth2Operations oauthOperations;
	
	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/users/signup_form", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpServletResponse response) {

		//구글code 발행 
		oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
	
		System.out.println("구글:" + url);
	
		model.addAttribute("google_url", url);
		// 생성한 인증 URL을 View로 전달 
		return "users/signup_form";
	}

	/*// 구글 Callback호출 메소드
	@RequestMapping(value = "/oauth2callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleCallback(Model model, @RequestParam String code) throws IOException {
		System.out.println("여기는 googleCallback");
		System.out.println(code);
		System.out.println(model);
		//로그인 처리 할 부분.. 일단 가입부터 되게 하고...
		
		return "redirect:/";
	} */

	
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
		System.out.println(connection);
		
		PlusOperations plusOperations = google.plusOperations();
		Person profile = plusOperations.getGoogleProfile();
		
		System.out.println("User Uid : " + profile.getId());
		System.out.println("User Name : " + profile.getDisplayName());
		System.out.println("User Email:" +profile.getAccountEmail());
		System.out.println("User Profile : " + profile.getImageUrl());
		
		HttpSession session = request.getSession();
		session.setAttribute("gEmail", profile.getAccountEmail());
		session.setAttribute("gName", profile.getGivenName()+profile.getFamilyName());
		session.setAttribute("gNick", profile.getDisplayName());
		
		return "redirect:/users/signup_form.do";
    }
	
	
	//회원가입 처리
	@RequestMapping("/users/signup")
	public ModelAndView signup(ModelAndView mView, @ModelAttribute UsersDto dto) {
		service.addUser(mView, dto);
		//나중에 메인페이지로 연결되도록 수정
		mView.setViewName("users/greeting");
		return mView;
	}
	
	@RequestMapping("/users/login_form")
	public String loginForm() {
		return "users/login_form";
	}
	
	@RequestMapping("/users/login")
	public ModelAndView login(HttpSession session, ModelAndView mView, @ModelAttribute UsersDto dto) {
		//로그인 관련 처리
		service.validUser(session, mView, dto);
		//view 페이지 정보 담기
		
		//나중에 메인 페이지로 연결되게 바꾸기
		mView.setViewName("users/login");
		//ModelAndView 객체 리턴
		return mView;
	}
	
	@RequestMapping("/users/checkid")
	@ResponseBody
	public Map<String, Object> checkid(@RequestParam String inputId){
		Map<String, Object> map=service.canUseId(inputId);
		//canUse 가 true or false
		return map;
	}
	
	@RequestMapping("/users/checkNick")
	@ResponseBody
	public Map<String, Object> checkNick(@RequestParam String inputNick){
		Map<String, Object> map=service.canUseNick(inputNick);
		//canUseNick 도  true or false
		return map;
	}
	
	@RequestMapping("/users/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
}
