package com.acorn.project.profile.dao;

import com.acorn.project.profile.dto.ProfileDto;

public interface ProfileDao {
	public ProfileDto getuserprofile(String id);
	public void update(ProfileDto dto);
	//비밀번호 수정하는 메소드
	public void updatepwd(ProfileDto dto);
}
