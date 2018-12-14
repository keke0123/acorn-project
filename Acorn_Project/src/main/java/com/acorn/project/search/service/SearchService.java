package com.acorn.project.search.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.acorn.project.search.dto.SearchDto;

public interface SearchService {
	public void getList(String value);
	public List<SearchDto> searchList(HttpServletRequest request);
	
}
