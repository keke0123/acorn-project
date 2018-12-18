package com.acorn.project.users.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.project.users.dto.UsersDto;

@Repository
public class UsersDaoImpl implements UsersDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(UsersDto dto) {
		session.insert("users.insert",dto);
	}

	//인자로 전달된 아이디가 존재하는지 여부
	@Override
	public boolean isExist(String inputId) {
		String selectedId=session.selectOne("users.isExist",inputId);
		if(selectedId==null) {
			return false;
		}else {
			return true;
		}
		
	}

	@Override
	public String getPwdHash(String id) {
		//비밀번호 hash 값을 select 해서 리턴해준다
		return session.selectOne("users.getPwd",id);
	}

	//인자로 전달된 닉네임이 존재하는지 여부
	@Override
	public boolean isNickExist(String inputNick) {
		String selectedNick=session.selectOne("users.isNickExist", inputNick);
		if(selectedNick==null) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public String googleLogin(String googleId) {
		String selectedId=session.selectOne("users.googleId",googleId);
		
		return selectedId;
	}

}
