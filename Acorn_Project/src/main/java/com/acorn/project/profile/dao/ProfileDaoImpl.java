package com.acorn.project.profile.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.project.profile.dto.ProfileDto;
import com.acorn.project.profile.dto.PwdDto;

@Repository
public class ProfileDaoImpl implements ProfileDao{
	@Autowired
	private SqlSession session;

	@Override
	public ProfileDto getuserprofile(String id) {
		return session.selectOne("profile.getuserprofile", id);
	}

	@Override
	public void update(ProfileDto dto) {
		session.update("profile.update", dto);		
	}

	@Override
	public String selectPwd(PwdDto dto) {		
		return session.selectOne("profile.selectPwd", dto);
	}

	@Override
	public void updatePwd(PwdDto dto) {
		session.update("profile.updatePwd", dto);
	}



}











