package com.acorn.project.search.dao;

/*
 * 송현철 생성
 * 인기인 조회 Dao
 */

import java.util.List;

import com.acorn.project.search.dto.SearchDto;

public interface SearchDao {
	public List<SearchDto> getList(String value);
	
	
	
}
