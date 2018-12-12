package com.acorn.project.users.dao;

import com.acorn.project.users.dto.UsersDto;

public interface UsersDao {
	
	//회원 정보를 DB에 INSERT 하는 메소드
	public void insert(UsersDto dto);
	//인자로 전달된 아이디가 이미 DB에 존재하는지 여부를 리턴하는 메소드
	public boolean isExist(String inputId);
	//아이디에 해당하는 비밀번호 hash 값을 리턴해주는 메소드
	public String getPwdHash(String id);
	//인자로 전달된 닉네임이 존재하는 여부를 리턴하는 메소드
	public boolean isNickExist(String inputNick);
}
