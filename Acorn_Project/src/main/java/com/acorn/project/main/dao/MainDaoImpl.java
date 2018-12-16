package com.acorn.project.main.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.project.main.dto.CommentDto;
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

	@Override
	public List<CommentDto> getComment(MainDto dto) {
		return session.selectList("main.getComment", dto);
	}

	@Override
	public void insertLike(MainDto dto) {
		session.insert("main.insertLike", dto);
	}

	@Override
	public void deleteLike(MainDto dto) {
		session.delete("main.deleteLike", dto);
	}

	@Override
	public void insertBookMark(MainDto dto) {
		session.insert("main.insertBookMark", dto);
	}

	@Override
	public void deleteBookMark(MainDto dto) {
		session.delete("main.deleteBookMark", dto);
	}

	@Override
	public void insertComment(CommentDto dto) {
		session.insert("main.insertComment",dto);
	}
	@Override
	public int getSequence() {
		return session.selectOne("main.getSequence");
	}

}
