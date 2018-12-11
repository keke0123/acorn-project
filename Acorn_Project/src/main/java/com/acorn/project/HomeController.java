package com.acorn.project;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
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
