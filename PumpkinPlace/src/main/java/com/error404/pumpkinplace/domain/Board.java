package com.error404.pumpkinplace.domain;

import java.util.Date;

public class Board {
	private int b_section; // 게시판 구분 번호
	private long b_no; // 게시글 번호
	private String b_title; // 게시글 제목
	private String b_content; // 게시글 내용
	private String b_id; // 게시글 작성자 아이디
	private Date b_regdate; // 게시글 작성일자
	private String b_img; // 게시글 이미지 내용
	private String b_video; // 게시글 동영상 내용
	private int b_readcnt; // 게시글 조회 수
	private int b_up; // 게시글 추천 수
	private int b_down; // 게시글 비추천 수
	
	public Board() {}//

	public Board(int b_section, long b_no, String b_title, String b_content, String b_id, Date b_regdate, String b_img,
			String b_video, int b_readcnt, int b_up, int b_down) {
		super();
		this.b_section = b_section;
		this.b_no = b_no;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_id = b_id;
		this.b_regdate = b_regdate;
		this.b_img = b_img;
		this.b_video = b_video;
		this.b_readcnt = b_readcnt;
		this.b_up = b_up;
		this.b_down = b_down;
	}

	public int getB_section() {
		return b_section;
	}

	public void setB_section(int b_section) {
		this.b_section = b_section;
	}

	public long getB_no() {
		return b_no;
	}

	public void setB_no(long b_no) {
		this.b_no = b_no;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public Date getB_regdate() {
		return b_regdate;
	}

	public void setB_regdate(Date b_regdate) {
		this.b_regdate = b_regdate;
	}

	public String getB_img() {
		return b_img;
	}

	public void setB_img(String b_img) {
		this.b_img = b_img;
	}

	public String getB_video() {
		return b_video;
	}

	public void setB_video(String b_video) {
		this.b_video = b_video;
	}

	public int getB_readcnt() {
		return b_readcnt;
	}

	public void setB_readcnt(int b_readcnt) {
		this.b_readcnt = b_readcnt;
	}

	public int getB_up() {
		return b_up;
	}

	public void setB_up(int b_up) {
		this.b_up = b_up;
	}

	public int getB_down() {
		return b_down;
	}

	public void setB_down(int b_down) {
		this.b_down = b_down;
	}

	
} // end class Board
