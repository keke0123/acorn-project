package com.acorn.project.users.dto;

public class UsersDto {
	private String id;
	private String pwd;
	private String nick;
	private String name;
	private String status;
	private String phone;
	private String email;
	private String orgfilename;
	private long filesize;
	private String regdate;
	private String google_id;
	
	public UsersDto() {}

	public UsersDto(String id, String pwd, String nick, String name, String status, String phone, String email,
			String orgfilename, long filesize, String regdate, String google_id) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.nick = nick;
		this.name = name;
		this.status = status;
		this.phone = phone;
		this.email = email;
		this.orgfilename = orgfilename;
		this.filesize = filesize;
		this.regdate = regdate;
		this.google_id = google_id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getOrgfilename() {
		return orgfilename;
	}

	public void setOrgfilename(String orgfilename) {
		this.orgfilename = orgfilename;
	}

	public long getFilesize() {
		return filesize;
	}

	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getGoogle_id() {
		return google_id;
	}

	public void setGoogle_id(String google_id) {
		this.google_id = google_id;
	}
	
	
}
