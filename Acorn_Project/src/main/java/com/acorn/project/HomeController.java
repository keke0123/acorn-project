package com.acorn.project;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

@Controller
public class HomeController {
	
	@RequestMapping("/home")
	public String home(HttpSession session ) {
		// login 상태 초기화 테스트를 위해
		// 로그인 성공되면 분기를 주어 main 페이지로 전송시켜주기 위해 만듬
		session.setAttribute("isLogined", false);
		return "home";
	}
}
