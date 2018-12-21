package com.acorn.project.profile.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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

	@Override
	public void updatepwd(HttpServletRequest request) {
		//비밀번호를 수정할 회원의 아이디를 세션에서 얻어온다. 
		String id=(String)request.getSession().getAttribute("id");
		//새 비밀번호를 읽어온다.
		String pwd=request.getParameter("pwd");
		//비밀 번호를 암호화 한다.
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		//UsersDto 객체를 생성해서 담는다.
		ProfileDto dto=new ProfileDto();
		dto.setId(id);
		dto.setPwd(encoder.encode(pwd));
		//dao 를 이용해서 DB 에 수정 반영한다.
		dao.updatepwd(dto);
	}

}

