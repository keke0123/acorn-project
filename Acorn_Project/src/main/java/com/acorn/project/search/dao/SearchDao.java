package com.acorn.project.search.dao;

/*
 * 송현철 생성
 * 인기인 조회 Dao
 */

import java.util.List;

import com.acorn.project.search.dto.SearchDto;

public interface SearchDao {
	public List<SearchDto> getList(String value);
	public List<SearchDto> getListTag(String value);
	public List<SearchDto> getListHuman(String value);
	
/*	List<SearchDto> list = searchDao.getListTag(value);
	}else {
		List<SearchDto> list = searchDao.getListHuman(value);*/
	
	
}
