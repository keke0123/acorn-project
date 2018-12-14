package com.acorn.project.users.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
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
	
	/* GoogleLogin */
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;
	
	
	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/users/login_form", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {

		/* 구글code 발행 */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

		System.out.println("구글:" + url);

		model.addAttribute("google_url", url);

		/* 생성한 인증 URL을 View로 전달 */
		return "users/login_form";
	}

	// 구글 Callback호출 메소드
	@RequestMapping(value = "/oauth2callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleCallback(Model model, @RequestParam String code) throws IOException {
		System.out.println("여기는 googleCallback");
		System.out.println(code);
		System.out.println(model);
		//로그인 처리 할 부분.. 일단 가입부터 되게 하고...
		
		return "redirect:/";
	}
	
	//회원가입폼 요청
	@RequestMapping("/users/signup_form")
	public String signupForm() {
		return "users/signup_form";
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
	
	
	
}
