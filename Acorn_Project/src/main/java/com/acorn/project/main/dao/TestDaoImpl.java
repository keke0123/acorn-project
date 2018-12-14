package com.acorn.project.main.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestDaoImpl implements TestDao{
	@Autowired
	private SqlSession session;
	
	public String selectUserData(String id) {
		String test = session.selectOne("test.selectUserData",id);
		return test;
	}
}
