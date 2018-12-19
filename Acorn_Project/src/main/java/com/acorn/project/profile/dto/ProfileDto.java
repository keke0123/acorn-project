package com.acorn.project.profile.dto;

public class ProfileDto {
	private String id;
	private String nick;
	private String name;
	private String phone;
	private String email;
	private String orgfilename;
	
	ProfileDto(){}

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public ProfileDto(String id, String nick, String name, String phone, String email, String orgfilename) {
		super();
		this.id = id;
		this.nick = nick;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.orgfilename = orgfilename;
	}
}













