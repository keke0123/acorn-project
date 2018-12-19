package com.acorn.project.profile.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
