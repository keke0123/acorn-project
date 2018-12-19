package com.acorn.project.profile.service;

import javax.servlet.http.HttpSession;

import com.acorn.project.profile.dto.ProfileDto;

public interface ProfileService {
	public ProfileDto getUser(HttpSession session);
	
}
