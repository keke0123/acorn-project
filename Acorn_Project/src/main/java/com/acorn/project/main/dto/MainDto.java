package com.acorn.project.main.dto;

import java.util.List;

public class MainDto {
	private int num_board;
	private List<String> orgfilename;
	private String content;
	private String regdate;
	private String id_writer;
	private List<String> tag;
	private String id_like;
	private String id_bookmark;
	private String id;
	private int count_like;
	
	public MainDto() {}

	public MainDto(int num_board, List<String> orgfilename, String content, String regdate, String id_writer,
			List<String> tag, String id_like, String id_bookmark, String id, int count_like) {
		super();
		this.num_board = num_board;
		this.orgfilename = orgfilename;
		this.content = content;
		this.regdate = regdate;
		this.id_writer = id_writer;
		this.tag = tag;
		this.id_like = id_like;
		this.id_bookmark = id_bookmark;
		this.id = id;
		this.count_like = count_like;
	}

	public int getNum_board() {
		return num_board;
	}

	public void setNum_board(int num_board) {
		this.num_board = num_board;
	}

	public List<String> getOrgfilename() {
		return orgfilename;
	}

	public void setOrgfilename(List<String> orgfilename) {
		this.orgfilename = orgfilename;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getId_writer() {
		return id_writer;
	}

	public void setId_writer(String id_writer) {
		this.id_writer = id_writer;
	}

	public List<String> getTag() {
		return tag;
	}

	public void setTag(List<String> tag) {
		this.tag = tag;
	}

	public String getId_like() {
		return id_like;
	}

	public void setId_like(String id_like) {
		this.id_like = id_like;
	}

	public String getId_bookmark() {
		return id_bookmark;
	}

	public void setId_bookmark(String id_bookmark) {
		this.id_bookmark = id_bookmark;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getCount_like() {
		return count_like;
	}

	public void setCount_like(int count_like) {
		this.count_like = count_like;
	}

	
}
