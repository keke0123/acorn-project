package com.acorn.project;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.project.imageupload.dto.ImageUploadDto;
import com.acorn.project.imageupload.service.ImageUploadService;

@Controller
public class HomeController {
	
	@Autowired
	private ImageUploadService service;
	
	@RequestMapping("/home")
	public ModelAndView home() {
		List<String> noticeList = new ArrayList<>();
		
		noticeList.add("test");
		
		ModelAndView mView=new ModelAndView();
		mView.addObject("noticeList", noticeList);
		mView.setViewName("home");
		return mView;
	}
	
	
}
