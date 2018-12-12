package com.acorn.project.users.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.project.users.dto.UsersDto;
import com.acorn.project.users.service.UsersService;

@Controller
public class UsersController {
	@Autowired
	private UsersService service;
	
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
}
