
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
			
		/*SearchDto dto =new SearchDto();
		List<SearchDto> list=searchDao.getList(dto);
		
		request.setAttribute("list", list);*/
	
	}

	@Override
	public List<SearchDto> searchList(HttpServletRequest request) {
		
		
		String value2=request.getParameter("keyword2");
		
		String value=request.getParameter("keyword");
		System.out.print(value2);
		List<SearchDto> list = null;
		if(value2.equals("pop")) {
			list = searchDao.getList(value);
		}else if(value2.equals("tag")) {
			list = searchDao.getListTag(value);
		}else {
			list = searchDao.getListHuman(value);
		}
		return list;
	}



}

