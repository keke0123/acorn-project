package com.acorn.project.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.project.main.dao.MainDao;
import com.acorn.project.main.dto.CommentDto;
import com.acorn.project.main.dto.MainDto;

@Service
public class MainServiceImpl implements MainService{
	@Autowired
	private MainDao dao;

	@Override
	public void getBoardList(ModelAndView mView, String id, HttpServletRequest request) {
		List<MainDto> followList=dao.getFollowList(id);
		request.setAttribute("followList", followList);
	}

	@Override
	public List<MainDto> getMainBoard(MainDto initDto) {
		if(initDto.getStartRowNum()==0) {
			initDto.setStartRowNum(1);
			initDto.setEndRowNum(2);
		}
		List<MainDto> boardList=dao.getBoardList(initDto);
		for(int i=0; i<boardList.size(); i++) {
			// List 의 MainDto 에 게시판번호를 받아 DB에서 검색해서
			// 부족한 정보 집어 넣기 
			MainDto dto = boardList.get(i);
			dto.setId(initDto.getId());
			List<String> tagList=dao.getTagList(dto);
			List<String> pictureList=dao.getPictureList(dto);
			String thumbNail=dao.getThumbNail(dto);
			String id_like=dao.getLike(dto);
			String id_bookmark=dao.getBookMark(dto);
			// dto 참조값을 dto 에 넣어보기
			// 댓글 갯수 처음에 3개 까지만 보여주기
			dto.setStartRowNum(1);
			dto.setEndRowNum(3);
			List<CommentDto> commentList = dao.getComment(dto);
			dto.setCommentList(commentList);
			dto.setThumbNail(thumbNail);
			dto.setTag(tagList);
			dto.setOrgfilename(pictureList);
			dto.setId_like(id_like);
			dto.setId_bookmark(id_bookmark);
		}
		return boardList;
	}

	@Override
	public void getInsertLike(MainDto dto) {
		dao.insertLike(dto);
	}

	@Override
	public void getDeleteLike(MainDto dto) {
		dao.deleteLike(dto);
	}

	@Override
	public void getInsertBookMark(MainDto dto) {
		dao.insertBookMark(dto);
	}

	@Override
	public void getDeleteBookMark(MainDto dto) {
		dao.deleteBookMark(dto);
	}

	@Override
	public void getInsertComment(CommentDto dto) {
		int num=dao.getSequence();
		dto.setRef_group(num);
		dto.setComment_group(num);
		dao.insertComment(dto);
	}

	@Override
	public List<CommentDto> getAddComment(MainDto dto) {
		return dao.AddComment(dto);
	}
}
