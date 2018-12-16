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
	public List<String> getTagList(MainDto dto) {
		return session.selectList("main.getTag", dto);
	}

	@Override
	public List<String> getPictureList(MainDto dto) {
		return session.selectList("main.getPicture", dto);
	}

	@Override
	public String getLike(MainDto dto) {
		return session.selectOne("main.getLike", dto);
	}

	@Override
	public String getBookMark(MainDto dto) {
		return session.selectOne("main.getBookMark", dto);
	}

	@Override
	public String getThumbNail(MainDto dto) {
		return session.selectOne("main.getThumbNail", dto);
	}

}
