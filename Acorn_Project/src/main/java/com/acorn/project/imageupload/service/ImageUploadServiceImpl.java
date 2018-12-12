package com.acorn.project.imageupload.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.project.imageupload.dao.ImageUploadDao;

@Service
public class ImageUploadServiceImpl implements ImageUploadService{
	@Autowired
	private ImageUploadDao dao;
	
	
	@Override
	public void getList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}

}
