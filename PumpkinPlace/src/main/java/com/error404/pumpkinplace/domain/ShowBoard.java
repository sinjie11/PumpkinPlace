package com.error404.pumpkinplace.domain;

import java.util.Date;

public class ShowBoard {
	
	private long sb_no; // 공연 글 번호
	private String sb_nm; // 공연자 이름
	private String sb_title; // 공연 제목
	private String sb_content; // 공연 내용
	private String sb_city; // 공연 지역
	private int sb_price; // 공연 가격
	private String sb_tel; // 공연 담당자 연락처
	private String sb_locinfo; // 공연 위치정보(GoogleMap 활용 시 사용)
	private Date sb_regdate; // 공연글 작성일자
	private String sb_img; // 공연 이미지
	private String sb_video; // 공연 동영상
	private Date sb_startdate; // 공연 시작일자
	private Date sb_enddate; // 공연 종료일자
	
	public ShowBoard() {}

	public ShowBoard(long sb_no, String sb_nm, String sb_title, String sb_content, String sb_city, int sb_price,
			String sb_tel, String sb_locinfo, Date sb_regdate, String sb_img, String sb_video, Date sb_startdate,
			Date sb_enddate) {
		
		this.sb_no = sb_no;
		this.sb_nm = sb_nm;
		this.sb_title = sb_title;
		this.sb_content = sb_content;
		this.sb_city = sb_city;
		this.sb_price = sb_price;
		this.sb_tel = sb_tel;
		this.sb_locinfo = sb_locinfo;
		this.sb_regdate = sb_regdate;
		this.sb_img = sb_img;
		this.sb_video = sb_video;
		this.sb_startdate = sb_startdate;
		this.sb_enddate = sb_enddate;
	}

	public long getSb_no() {
		return sb_no;
	}

	public void setSb_no(long sb_no) {
		this.sb_no = sb_no;
	}

	public String getSb_nm() {
		return sb_nm;
	}

	public void setSb_nm(String sb_nm) {
		this.sb_nm = sb_nm;
	}

	public String getSb_title() {
		return sb_title;
	}

	public void setSb_title(String sb_title) {
		this.sb_title = sb_title;
	}

	public String getSb_content() {
		return sb_content;
	}

	public void setSb_content(String sb_content) {
		this.sb_content = sb_content;
	}

	public String getSb_city() {
		return sb_city;
	}

	public void setSb_city(String sb_city) {
		this.sb_city = sb_city;
	}

	public int getSb_price() {
		return sb_price;
	}

	public void setSb_price(int sb_price) {
		this.sb_price = sb_price;
	}

	public String getSb_tel() {
		return sb_tel;
	}

	public void setSb_tel(String sb_tel) {
		this.sb_tel = sb_tel;
	}

	public String getSb_locinfo() {
		return sb_locinfo;
	}

	public void setSb_locinfo(String sb_locinfo) {
		this.sb_locinfo = sb_locinfo;
	}

	public Date getSb_regdate() {
		return sb_regdate;
	}

	public void setSb_regdate(Date sb_regdate) {
		this.sb_regdate = sb_regdate;
	}

	public String getSb_img() {
		return sb_img;
	}

	public void setSb_img(String sb_img) {
		this.sb_img = sb_img;
	}

	public String getSb_video() {
		return sb_video;
	}

	public void setSb_video(String sb_video) {
		this.sb_video = sb_video;
	}

	public Date getSb_startdate() {
		return sb_startdate;
	}

	public void setSb_startdate(Date sb_startdate) {
		this.sb_startdate = sb_startdate;
	}

	public Date getSb_enddate() {
		return sb_enddate;
	}

	public void setSb_enddate(Date sb_enddate) {
		this.sb_enddate = sb_enddate;
	}

		
	
} // end class ShowBoard
