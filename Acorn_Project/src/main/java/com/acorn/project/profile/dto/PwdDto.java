package com.acorn.project.profile.dto;

public class PwdDto {
	private String prev_pwd;
	private String pwd;
	private String id;
	
	public PwdDto(){}

	public String getPrev_pwd() {
		return prev_pwd;
	}

	public void setPrev_pwd(String prev_pwd) {
		this.prev_pwd = prev_pwd;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public PwdDto(String prev_pwd, String pwd, String id) {
		super();
		this.prev_pwd = prev_pwd;
		this.pwd = pwd;
		this.id = id;
	}


}
