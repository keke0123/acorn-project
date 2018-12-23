package com.acorn.project.search.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.acorn.project.search.dto.SearchDto;

public interface SearchService {
	public void getList(HttpServletRequest request);
	public List<SearchDto> searchList(HttpServletRequest request);
	
	public SearchDto getUserOwnList(HttpServletRequest request);
	public List<SearchDto> getBoardList(HttpServletRequest request);
	
	public int checkFollowed(String id_follower, String id_follow);
	public void getFollow(String id_follower, String id_follow);
	public void notFollow(String id_follower, String id_follow);
}
