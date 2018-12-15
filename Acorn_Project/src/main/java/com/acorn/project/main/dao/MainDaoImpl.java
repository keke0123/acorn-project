package com.acorn.project.main.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.project.main.dto.MainDto;

@Repository
public class MainDaoImpl implements MainDao {
	@Autowired
	private SqlSession session;
	
	@Override
	public List<MainDto> getFollowList(String id) {	
		return session.selectList("main.getFollowList",id);
	}

	@Override
	public List<MainDto> getBoardList(String id) {
		return session.selectList("main.getBoardList", id);
	}

	@Override
	public List<String> getTagList(int num_board) {
		return session.selectList("main.getTag", num_board);
	}

	@Override
	public List<String> getPictureList(int num_board) {
		return session.selectList("main.getPicture", num_board);
	}
	
	

}
