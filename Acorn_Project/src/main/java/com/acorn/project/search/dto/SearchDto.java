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
	private String name;
	private String id_follow;
	private int countFollow;
	
	public SearchDto() {}

	public SearchDto(int num, String id, String nick, String orgFileName, String name, String id_follow,
			int countFollow) {
		super();
		this.num = num;
		this.id = id;
		this.nick = nick;
		this.orgFileName = orgFileName;
		this.name = name;
		this.id_follow = id_follow;
		this.countFollow = countFollow;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId_follow() {
		return id_follow;
	}

	public void setId_follow(String id_follow) {
		this.id_follow = id_follow;
	}

	public int getCountFollow() {
		return countFollow;
	}

	public void setCountFollow(int countFollow) {
		this.countFollow = countFollow;
	}

	
	
	
	
}