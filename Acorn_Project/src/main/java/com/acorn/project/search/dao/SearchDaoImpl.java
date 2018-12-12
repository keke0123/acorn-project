package com.acorn.project.search.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.project.search.dto.SearchDto;

@Repository
public class SearchDaoImpl implements SearchDao{
	@Autowired
	private SqlSession session;
	@Override
	public List<SearchDto> getList(SearchDto dto) {
		
		return session.selectList("search.getList" , dto);
	}

	

}
