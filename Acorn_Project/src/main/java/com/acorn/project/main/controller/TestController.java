package com.acorn.project.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.project.main.service.TestService;

@Controller
public class TestController {
	@Autowired
	private TestService service;
	
	@RequestMapping("/main/test")
	public ModelAndView testPage(ModelAndView mView) {
		return new ModelAndView("main/test");
	}
	
	@RequestMapping("/main/getTest")
	public ModelAndView getTestPage(ModelAndView mView, @RequestParam String id) {
		service.getUserData(mView, id);
		mView.setViewName("main/getTest");
		return mView;
	}
}
