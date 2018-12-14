package com.acorn.project.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.project.main.dao.TestDao;

@Service
public class TestServiceImpl implements TestService{

	@Autowired
	private TestDao dao;
	
	@Override
	public void getUserData(ModelAndView mView, String id) {
		String orgfilename = dao.selectUserData(id);
		mView.addObject("orgfilename", orgfilename);
	}
	
}
