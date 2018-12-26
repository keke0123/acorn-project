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
	
	@RequestMapping("/main/mainpage")
	public ModelAndView authMain(ModelAndView mView, HttpServletRequest request,
			HttpSession session) {
		mView.addObject("activeBar","main");
		// 임시로 아이디 변경 시켜놓음
		//session.setAttribute("id", "user1");
		mView.setViewName("main/mainpage");		
		return mView;
	}
	@RequestMapping("/main/mainBoard")
	@ResponseBody
	public List<MainDto> authGetMainBoard(HttpSession session, @ModelAttribute MainDto dto){
		String id = (String)session.getAttribute("id");
		dto.setId(id);
		return service.getMainBoard(dto);
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
