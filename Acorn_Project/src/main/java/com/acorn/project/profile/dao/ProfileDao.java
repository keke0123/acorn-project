package com.acorn.project.profile.dao;

import com.acorn.project.profile.dto.ProfileDto;
import com.acorn.project.profile.dto.PwdDto;

public interface ProfileDao {
	public ProfileDto getuserprofile(String id);
	public void update(ProfileDto dto);
	public String selectPwd(PwdDto dto);
	public void updatePwd(PwdDto dto);

}
