package com.acorn.project.imageupload.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.project.imageupload.dto.ImageUploadDto;

@Repository
public class ImageUploadDaoImpl implements ImageUploadDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<ImageUploadDto> getList(ImageUploadDto dto) {
		
		return null;
	}

}
