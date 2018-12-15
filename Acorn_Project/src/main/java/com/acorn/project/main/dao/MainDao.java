package com.acorn.project.main.dao;

import java.util.List;

import com.acorn.project.main.dto.MainDto;

public interface MainDao {
	public List<MainDto> getFollowList(String id);
	public List<MainDto> getBoardList(String id);
	public List<String> getTagList(MainDto dto);
	public List<String> getPictureList(MainDto dto);
	public String getLike(MainDto dto);
	public String getBookMark(MainDto dto);
}
