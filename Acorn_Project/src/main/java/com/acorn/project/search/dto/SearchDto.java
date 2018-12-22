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
	private int lcount;
	private int countFollower;
	private int num_board;
	private String p_orgfilename;
	
	public SearchDto() {}

	public SearchDto(int num, String id, String nick, String orgFileName, String name, String id_follow,
			int countFollow, int lcount, int countFollower, int num_board, String p_orgfilename) {
		super();
		this.num = num;
		this.id = id;
		this.nick = nick;
		this.orgFileName = orgFileName;
		this.name = name;
		this.id_follow = id_follow;
		this.countFollow = countFollow;
		this.lcount = lcount;
		this.countFollower = countFollower;
		this.num_board = num_board;
		this.p_orgfilename = p_orgfilename;
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

	public int getLcount() {
		return lcount;
	}

	public void setLcount(int lcount) {
		this.lcount = lcount;
	}

	public int getCountFollower() {
		return countFollower;
	}

	public void setCountFollower(int countFollower) {
		this.countFollower = countFollower;
	}

	public int getNum_board() {
		return num_board;
	}

	public void setNum_board(int num_board) {
		this.num_board = num_board;
	}

	public String getP_orgfilename() {
		return p_orgfilename;
	}

	public void setP_orgfilename(String p_orgfilename) {
		this.p_orgfilename = p_orgfilename;
	}


}
