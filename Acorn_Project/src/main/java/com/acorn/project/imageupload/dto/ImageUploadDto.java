package com.acorn.project.imageupload.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ImageUploadDto {
	private int num_board; // 게시물 번호
	private String id_writer; // 작성자 아이디
	private String content; // 글 내용
	private String regdate; // 등록 날짜
	private String tag; // 태그
	
	private String orgfileName;
	private long fileSize;
	
	private MultipartFile file;

	public ImageUploadDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ImageUploadDto(int num_board, String id_writer, String content, String regdate, String tag,
			String orgfileName, long fileSize, MultipartFile file) {
		super();
		this.num_board = num_board;
		this.id_writer = id_writer;
		this.content = content;
		this.regdate = regdate;
		this.tag = tag;
		this.orgfileName = orgfileName;
		this.fileSize = fileSize;
		this.file = file;
	}

	public int getNum_board() {
		return num_board;
	}

	public void setNum_board(int num_board) {
		this.num_board = num_board;
	}

	public String getId_writer() {
		return id_writer;
	}

	public void setId_writer(String id_writer) {
		this.id_writer = id_writer;
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

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getOrgfileName() {
		return orgfileName;
	}

	public void setOrgfileName(String orgfileName) {
		this.orgfileName = orgfileName;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	
	
}
