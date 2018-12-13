
package com.acorn.project.search.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.project.search.dao.SearchDao;
import com.acorn.project.search.dto.SearchDto;

@Service
public class SearchServiceImpl implements SearchService{
	@Autowired
	private SearchDao searchDao;
	
	@Override
	public void getList(String value) {
			
		SearchDto dto =new SearchDto();
		List<SearchDto> list=searchDao.getList(dto);
		
		request.setAttribute("list", list);
	
	}



}

