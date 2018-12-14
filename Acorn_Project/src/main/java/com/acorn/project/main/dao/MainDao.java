package com.acorn.project.main.dao;

import java.util.List;

import com.acorn.project.main.dto.MainDto;

public interface MainDao {
	public List<MainDto> getFollowList(String id);
	public List<MainDto> getBoardList(String id);
	public List<String> getTagList(int num_board);
}
