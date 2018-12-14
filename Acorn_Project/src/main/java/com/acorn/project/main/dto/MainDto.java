package com.acorn.project.main.dto;

import java.util.List;

public class MainDto {
	private int num_board;
	private String orgfilename;
	private String content;
	private String regdate;
	private String id_writer;
	private List<String> tag;
	
	public MainDto() {}
	
	public MainDto(int num_board, String orgfilename, String content, String regdate, String id_writer,
			List<String> tag) {
		super();
		this.num_board = num_board;
		this.orgfilename = orgfilename;
		this.content = content;
		this.regdate = regdate;
		this.id_writer = id_writer;
		this.tag = tag;
	}
	public int getNum_board() {
		return num_board;
	}
	public void setNum_board(int num_board) {
		this.num_board = num_board;
	}
	public String getOrgfilename() {
		return orgfilename;
	}
	public void setOrgfilename(String orgfilename) {
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
	
	
}
