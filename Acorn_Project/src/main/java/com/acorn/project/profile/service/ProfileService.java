package com.acorn.project.profile.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.acorn.project.profile.dto.ProfileDto;
import com.acorn.project.profile.dto.PwdDto;

public interface ProfileService {
	public ProfileDto getUser(HttpSession session);
	//개인정보 수정반영하는 메소드
	public void updateUser(ProfileDto dto, HttpServletRequest request);
	
	public boolean updatePwd(PwdDto dto);
	public void updatePwd2(PwdDto dto);
}
