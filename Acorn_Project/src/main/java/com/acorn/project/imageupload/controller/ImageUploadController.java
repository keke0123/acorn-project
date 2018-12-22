package com.acorn.project.imageupload.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.project.imageupload.dto.ImageUploadDto;
import com.acorn.project.imageupload.service.ImageUploadService;


@Controller
public class ImageUploadController {
	@Autowired
	private ImageUploadService service;

	@RequestMapping("/gallery/list")
	public ModelAndView getList(HttpServletRequest request) {
		// HttpServletRequest 객체를 전달해서 필요한 모델이 담기게 한다.
		service.getList(request);
		// view 페이지로 forward 이동해서 글 목록 출력하기
		return new ModelAndView("gallery/list");
	}
	
	@RequestMapping("/gallery/upload_form")
	public ModelAndView UploadForm(HttpServletRequest request) {
		
		return new ModelAndView("gallery/upload_form");
	}
	
	@RequestMapping("/gallery/upload")
	public ModelAndView Upload(@ModelAttribute ImageUploadDto dto, 
			HttpServletRequest request) {
		String id_writer=(String)request.getSession().getAttribute("id");
		dto.setId_writer(id_writer);
		//FileDto 에는 업로드된 파일의 제목(title)과 파일정보(file)이 들어있다.
		service.saveFile(dto, request);
		
		//파일 목록보기로 리다일렉트 시킨다. 
		return new ModelAndView("redirect:/gallery/list.do");
	}

}
