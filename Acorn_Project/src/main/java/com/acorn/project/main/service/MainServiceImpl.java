package com.acorn.project.main.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.project.main.dao.MainDao;
import com.acorn.project.main.dto.MainDto;

@Service
public class MainServiceImpl implements MainService{
	@Autowired
	private MainDao dao;

	@Override
	public void getBoardList(ModelAndView mView, String id, HttpServletRequest request) {
		List<MainDto> followList=dao.getFollowList(id);
		request.setAttribute("followList", followList);
		//mView.addObject("followList", followList);
	}

	@Override
	public List<MainDto> getMainBoard(String id) {
		List<MainDto> boardList=dao.getBoardList(id);
		for(int i=0; i<boardList.size(); i++) {
			// List 의 MainDto 에 게시판번호를 받아 DB에서 검색해서
			// 부족한 정보 집어 넣기 
			MainDto dto = boardList.get(i);
			dto.setId(id);
			List<String> tagList=dao.getTagList(dto);
			List<String> pictureList=dao.getPictureList(dto);
			String id_like=dao.getLike(dto);
			String id_bookmark=dao.getBookMark(dto);
			dto.setTag(tagList);
			dto.setOrgfilename(pictureList);
			dto.setId_like(id_like);
			dto.setId_bookmark(id_bookmark);
		}
		return boardList;
	}
}
