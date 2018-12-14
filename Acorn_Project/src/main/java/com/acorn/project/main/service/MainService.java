package com.acorn.project.main.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface MainService {
	public void getBoardList(ModelAndView mView, String id, HttpServletRequest request);
}
