package com.acorn.project.profile.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.project.profile.dao.ProfileDao;
import com.acorn.project.profile.dto.ProfileDto;

@Service
public class ProfileServiceImpl implements ProfileService {
	@Autowired
	private ProfileDao dao;

	@Override
	public ProfileDto getUser(HttpSession session) {
		String id=(String)session.getAttribute("id");		
		return dao.getuserprofile(id);
	}

	@Override
	public void updateUser(ProfileDto dto) {
		dao.update(dto);		
	}


}
