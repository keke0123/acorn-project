package com.acorn.project.main.dao;

import java.util.HashMap;
import java.util.List;

import com.acorn.project.main.dto.CommentDto;
import com.acorn.project.main.dto.MainDto;

public interface MainDao {
	public List<MainDto> getFollowList(String id);
	public List<MainDto> getBoardList(MainDto dto);
	public List<String> getTagList(MainDto dto);
	public List<String> getPictureList(MainDto dto);
	public String getLike(MainDto dto);
	public String getBookMark(MainDto dto);
	public String getThumbNail(MainDto dto);
	public List<CommentDto> getComment(MainDto dto);
	//
	public void insertLike(MainDto dto);
	public void deleteLike(MainDto dto);
	//
	public void insertBookMark(MainDto dto);
	public void deleteBookMark(MainDto dto);
	//
	public void insertComment(CommentDto dto);
	public int getSequence();
	//
	public List<CommentDto> AddComment(MainDto dto);
}
