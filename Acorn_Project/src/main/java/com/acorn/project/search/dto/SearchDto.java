package com.acorn.project.search.dto;
/*
 * 송현철 생성
 * 인기인 조회 Dto
 */

public class SearchDto {
	private int num;                   //인기인 조회(번호) 필요없을 수도 있음.
	private String id;                 //인기인 id 
	private String nick;               //인기인 닉네임
	private String orgFileName;        //인기인 사진출력시 필요.
	
	public SearchDto() {}

	public SearchDto(int num, String id, String nick, String orgFileName) {
		super();
		this.num = num;
		this.id = id;
		this.nick = nick;
		this.orgFileName = orgFileName;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getOrgFileName() {
		return orgFileName;
	}

	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}
	
	
	
}
