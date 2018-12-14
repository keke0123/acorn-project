package com.acorn.project.main.dao;

import java.util.List;

import com.acorn.project.main.dto.MainDto;

public interface MainDao {
	public List<MainDto> getFollowList(String id);
}
