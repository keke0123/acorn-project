package com.acorn.project.search.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.project.search.service.SearchService;
/*
 * 2018 12 11 17:00 송현철 생성
 * 
 * USE : 게시물 광범위 검색을 위한 Controller 생성
 */



@Controller
public class Search {
	
	@Autowired
	private SearchService service;
	
	/*인기 검색*/
	@RequestMapping("/search/list")
	public ModelAndView getList(HttpServletRequest request , @RequestParam String value) {
		service.getList(value);
		return new ModelAndView("search/list");  
	}
	

	
}
