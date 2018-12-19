package com.acorn.project.search.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.project.search.dto.SearchDto;
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
	public ModelAndView getList(HttpServletRequest request ) {
		
		return new ModelAndView("search/list");  
	}
	
	@RequestMapping("/search/Search_like")
	@ResponseBody
	public List<SearchDto> getListLike(HttpServletRequest request) {
		
		return service.searchList(request);
		 
	}
	
	@RequestMapping("/search/userpage")
	public ModelAndView userPage(ModelAndView mView, HttpServletRequest request) {
		mView.setViewName("search/userpage");
		return mView;
	}
	@RequestMapping("/search/userpageData")
	@ResponseBody
	public SearchDto getUserData(HttpServletRequest request) {	
		 return service.getUserOwnList(request);
	}
	@RequestMapping("/search/userboardlist")
	@ResponseBody
	public List<SearchDto> getBoard(HttpServletRequest request){
		return service.getBoardList(request);
	}

	
}
