
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
	public void getList(HttpServletRequest request) {
			
		/*SearchDto dto =new SearchDto();
		List<SearchDto> list=searchDao.getList(dto);
		
		request.setAttribute("list", list);*/
		
		List<SearchDto> list=searchDao.getListDefault();
	}

	@Override
	public List<SearchDto> searchList(HttpServletRequest request) {
		
		String value2=request.getParameter("keyword2");
		
		String value=request.getParameter("keyword");
		System.out.println(value2);
		System.out.println(value);
		List<SearchDto> list = null;
		if(value2.equals("pop")) {
			list = searchDao.getList(value);
		}else if(value2.equals("tag")) {
			list = searchDao.getListTag(value);
		}else {
			list = searchDao.getListHuman(value);
		}
		for(int i=0; i<list.size();i++) {
			System.out.println(list.get(i));
		}
		return list;
	}

	@Override
	public SearchDto getUserOwnList(HttpServletRequest request) {
		String value = request.getParameter("id");	
		SearchDto dto = searchDao.getUserOwnList(value);
		return dto;
	}

	@Override
	public List<SearchDto> getBoardList(HttpServletRequest request) {
		String value = request.getParameter("id");	
		//System.out.println("service value : " + value);
		return searchDao.getBoardPicture(value);
	}

	@Override
	public int checkFollowed(String id_follower, String id_follow) {
		SearchDto dto = new SearchDto();
		dto.setId(id_follower);
		dto.setId_follow(id_follow);
		if(id_follower.equals(id_follow)) {
			return 3;
		}
		return searchDao.isFollowed(dto);
	}

	@Override
	public void getFollow(String id_follower, String id_follow) {
		SearchDto dto = new SearchDto();
		dto.setId(id_follower);
		dto.setId_follow(id_follow);
		searchDao.isFollow(dto);
	}

	@Override
	public void notFollow(String id_follower, String id_follow) {
		SearchDto dto = new SearchDto();
		dto.setId(id_follower);
		dto.setId_follow(id_follow);
		searchDao.isNotFollow(dto);
	}
	

	



}

