package com.acorn.project.imageupload.dao;

import java.util.List;

import com.acorn.project.imageupload.dto.ImageUploadDto;


public interface ImageUploadDao {
	public List<ImageUploadDto> getList(ImageUploadDto dto);
	public ImageUploadDto getData(int num);
	public void insert(ImageUploadDto dto);
	public void insertImage(ImageUploadDto dto);
}
