package com.acorn.project.profile.dto;

import org.springframework.web.multipart.MultipartFile;

public class ProfileDto {
	private String id;
	private String nick;
	private String pwd;
	private String name;
	private String status;
	private String phone;
	private String email;
	private String orgfilename;
	
	private MultipartFile file;
	
	public ProfileDto(){}

	public ProfileDto(String id, String nick, String pwd, String name, String status, String phone, String email,
			String orgfilename, MultipartFile file) {
		super();
		this.id = id;
		this.nick = nick;
		this.pwd = pwd;
		this.name = name;
		this.status = status;
		this.phone = phone;
		this.email = email;
		this.orgfilename = orgfilename;
		this.file = file;
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

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
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

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	
}













