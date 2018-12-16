package com.acorn.project.main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.project.main.dto.CommentDto;
import com.acorn.project.main.dto.MainDto;
import com.acorn.project.main.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	private MainService service;
	
	@RequestMapping("/main/main")
	public ModelAndView authMain(ModelAndView mView, HttpServletRequest request,
			HttpSession session) {
		// test 용도로 임의로 session 에 id 값을 넣는다.
		session.setAttribute("id", "user1");
		//
		String id=(String)session.getAttribute("id");
		
		service.getBoardList(mView, id, request);
		
		mView.addObject("id",id);
		mView.setViewName("main/main");
		
		return mView;
	}
	@RequestMapping("/main/mainBoard")
	@ResponseBody
	public List<MainDto> authGetMainBoard(HttpSession session){
		session.setAttribute("id", "user1");
		String id = (String)session.getAttribute("id");
		return service.getMainBoard(id);
	}
	@RequestMapping("/main/insertLike")
	@ResponseBody
	public boolean authInsertLike(@ModelAttribute MainDto dto){
		service.getInsertLike(dto);
		return true;
	}
	@RequestMapping("/main/deleteLike")
	@ResponseBody
	public boolean authDeleteLike(@ModelAttribute MainDto dto){
		service.getDeleteLike(dto);
		return true;
	}
	@RequestMapping("/main/insertBookMark")
	@ResponseBody
	public boolean authInsertBookMark(@ModelAttribute MainDto dto){
		service.getInsertBookMark(dto);
		return true;
	}
	@RequestMapping("/main/deleteBookMark")
	@ResponseBody
	public boolean authDeleteBookMark(@ModelAttribute MainDto dto){
		service.getDeleteBookMark(dto);
		return true;
	}
	@RequestMapping("/main/insertComment")
	@ResponseBody
	public boolean authInsertComment(@ModelAttribute CommentDto dto) {
		service.getInsertComment(dto);
		return true;
	}
	@RequestMapping("/main/getAddComment")
	@ResponseBody
	public List<CommentDto> authgetAddComment(@ModelAttribute MainDto dto) {
		return service.getAddComment(dto);
	}
}
