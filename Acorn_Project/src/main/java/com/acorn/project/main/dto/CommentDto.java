package com.acorn.project.main.dto;

import java.util.List;

public class CommentDto {
	private String id_comment_writer;
	private String id_comment_target;
	private String comments;
	private int num_board;
	private int ref_group;
	private int comment_group;
	private String deleted;
	//
	private int startRowNum;
	private int endRowNum;
	
	public CommentDto() {}

	public CommentDto(String id_comment_writer, String id_comment_target, String comments, int num_board, int ref_group,
			int comment_group, String deleted, int startRowNum, int endRowNum) {
		super();
		this.id_comment_writer = id_comment_writer;
		this.id_comment_target = id_comment_target;
		this.comments = comments;
		this.num_board = num_board;
		this.ref_group = ref_group;
		this.comment_group = comment_group;
		this.deleted = deleted;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
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

	public int getNum_board() {
		return num_board;
	}

	public void setNum_board(int num_board) {
		this.num_board = num_board;
	}

	public int getRef_group() {
		return ref_group;
	}

	public void setRef_group(int ref_group) {
		this.ref_group = ref_group;
	}

	public int getComment_group() {
		return comment_group;
	}

	public void setComment_group(int comment_group) {
		this.comment_group = comment_group;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}


}
