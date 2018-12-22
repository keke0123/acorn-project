package com.acorn.project.imageupload.service;

import javax.servlet.http.HttpServletRequest;

import com.acorn.project.imageupload.dto.ImageUploadDto;


public interface ImageUploadService {
	public void getList(HttpServletRequest request);
	public void saveFile(ImageUploadDto dto, HttpServletRequest request);
	
}
