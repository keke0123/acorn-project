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
			int boardNum = boardList.get(i).getNum_board();
			List<String> tagList=dao.getTagList(boardNum);
			List<String> pictureList=dao.getPictureList(boardNum);
			boardList.get(i).setTag(tagList);
			boardList.get(i).setOrgfilename(pictureList);
		}
		return boardList;
	}
}
