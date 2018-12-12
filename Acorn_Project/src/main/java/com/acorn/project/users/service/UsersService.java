package com.acorn.project.users.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.acorn.project.users.dto.UsersDto;

public interface UsersService {
	//회원 정보를 추가하는 비즈니스 로직을 수행하는 메소드의 형태 정의
	public void addUser(ModelAndView mView, UsersDto dto);
	//로그인 처리를 하는 메소드
	public void validUser(HttpSession session, ModelAndView mView, UsersDto dto);
	//아이디 사용가능 여부를 Map에 담아서 리턴하는 로직
	public Map<String, Object> canUseId(String inputId);
	//닉네임 사용가능 여부를 Map에 담아서 리턴하는 로직
	public Map<String, Object> canUseNick(String inputNick);
}
