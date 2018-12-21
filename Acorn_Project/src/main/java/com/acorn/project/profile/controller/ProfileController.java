package com.acorn.project.profile.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.project.profile.dto.ProfileDto;
import com.acorn.project.profile.dto.PwdDto;
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
		session.setAttribute("id", "user1");
		String id=(String)session.getAttribute("id");
		dto.setId(id);
		System.out.println(dto.getFile());
		service.updateUser(dto,request);
		// new ModelAndView("view 페이지 정보")
		return new ModelAndView("redirect:/test/testProfile.jsp");
	}	

	@RequestMapping("/selectpwd")
	@ResponseBody
	public boolean authSelectPwd(@ModelAttribute PwdDto dto, HttpSession session) {
		System.out.println(dto.getPrev_pwd());
		session.setAttribute("id", "user1");
		String id=(String)session.getAttribute("id");
		dto.setId(id);
		return service.updatePwd(dto);
	}
	@RequestMapping("/updatepwd")
	public ModelAndView authUpdatePwd(@ModelAttribute PwdDto dto, HttpServletRequest request, HttpSession session) {
		session.setAttribute("id", "user1");
		String id=(String)session.getAttribute("id");
		dto.setId(id);
		service.updatePwd2(dto);
		return new ModelAndView("redirect:/test/testProfile.jsp");
	}	
}
