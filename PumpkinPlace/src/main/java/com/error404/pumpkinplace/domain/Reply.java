package com.error404.pumpkinplace.domain;

import java.util.Date;

public class Reply {
	private long b_no; // 게시글 번호
	private int r_no; // 댓글 번호
	private int r_section; // 댓글 구분
	private String r_content; // 댓글 내용
	private String r_id; // 댓글 작성자
	private Date r_regdate; // 댓글 작성시간(수정시간)
	private int r_like; // 댓글(좋아요)
	private int r_hate; // 댓글 (싫어요)
	
	public Reply() {}

	public Reply(long b_no, int r_no, int r_section, String r_content, String r_id, Date r_regdate, int r_like,
			int r_hate) {
		super();
		this.b_no = b_no;
		this.r_no = r_no;
		this.r_section = r_section;
		this.r_content = r_content;
		this.r_id = r_id;
		this.r_regdate = r_regdate;
		this.r_like = r_like;
		this.r_hate = r_hate;
	}

	public long getB_no() {
		return b_no;
	}

	public void setB_no(long b_no) {
		this.b_no = b_no;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public int getR_section() {
		return r_section;
	}

	public void setR_section(int r_section) {
		this.r_section = r_section;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public String getR_id() {
		return r_id;
	}

	public void setR_id(String r_id) {
		this.r_id = r_id;
	}

	public Date getR_regdate() {
		return r_regdate;
	}

	public void setR_regdate(Date r_regdate) {
		this.r_regdate = r_regdate;
	}

	public int getR_like() {
		return r_like;
	}

	public void setR_like(int r_like) {
		this.r_like = r_like;
	}

	public int getR_hate() {
		return r_hate;
	}

	public void setR_hate(int r_hate) {
		this.r_hate = r_hate;
	}
	
	
} // end class Reply
