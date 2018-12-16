package com.acorn.project.main.dto;

import java.util.List;

public class CommentDto {
	private String id_comment_writer;
	private String id_comment_target;
	private String comments;
	
	public CommentDto() {}

	public CommentDto(String id_comment_writer, String id_comment_target, String comments) {
		super();
		this.id_comment_writer = id_comment_writer;
		this.id_comment_target = id_comment_target;
		this.comments = comments;
	}

	public String getId_comment_writer() {
		return id_comment_writer;
	}

	public void setId_comment_writer(String id_comment_writer) {
		this.id_comment_writer = id_comment_writer;
	}

	public String getId_comment_target() {
		return id_comment_target;
	}

	public void setId_comment_target(String id_comment_target) {
		this.id_comment_target = id_comment_target;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	
}
