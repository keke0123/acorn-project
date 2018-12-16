package com.acorn.project.main.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.acorn.project.main.dto.CommentDto;
import com.acorn.project.main.dto.MainDto;

public interface MainService {
	public void getBoardList(ModelAndView mView, String id, HttpServletRequest request);
	public List<MainDto> getMainBoard(String id);
	public void getInsertLike(MainDto dto);
	public void getDeleteLike(MainDto dto);
	public void getInsertBookMark(MainDto dto);
	public void getDeleteBookMark(MainDto dto);
	public void getInsertComment(CommentDto dto);
}
