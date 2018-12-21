package com.acorn.project.profile.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.project.profile.dto.ProfileDto;
import com.acorn.project.profile.service.ProfileService;

@Controller
public class ProfileController {
	@Autowired
	private ProfileService service;

	@RequestMapping("/getuserprofile")
	@ResponseBody
	public ProfileDto getUserdata(HttpSession session) {
		session.setAttribute("id", "user1");
		return service.getUser(session);	
	}
	@RequestMapping("/update")
	public ModelAndView authUpdate(@ModelAttribute ProfileDto dto, HttpServletRequest request, HttpSession session) {
		String id=(String)session.getAttribute("id");
		dto.setId(id);
		service.updateUser(dto);
		// new ModelAndView("view 페이지 정보")
		return new ModelAndView("redirect:/test/testProfile.jsp");
	}	

	//비밀번호 수정반영 요청처리
	@RequestMapping("/updatepwd")
	public ModelAndView authUpdatePwd(HttpServletRequest request) {
		//비밀번호를 수정하는 비즈니스로직을 서비스로 수행하고
		service.updatepwd(request);
		//view 페이지로 forward 이동해서 응답
		return new ModelAndView("redirect:/test/testProfile.jsp");
	}
}
