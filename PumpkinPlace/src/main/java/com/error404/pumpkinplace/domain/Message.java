package com.error404.pumpkinplace.domain;

import java.util.Date;

public class Message {
	
	private int msg_no; // 쪽지 번호
	private String mem_id; // 회원 아이디
	private String msg_title; // 쪽지 제목
	private String msg_content; // 쪽지 내용
	private String msg_send; // 쪽지 보낸 사람
	private String msg_recieve; // 쪽지 받는 사람
	private Date msg_regdate; // 쪽지 작성일자
	private int msg_section; // 쪽지 구분(1: 보낸편지함, 2: 받은편지함)
	
	public Message() {}

	public Message(int msg_no, String mem_id, String msg_title, String msg_content, String msg_send, String msg_recieve,
			Date msg_regdate, int msg_section) {
		super();
		this.msg_no = msg_no;
		this.mem_id = mem_id;
		this.msg_title = msg_title;
		this.msg_content = msg_content;
		this.msg_send = msg_send;
		this.msg_recieve = msg_recieve;
		this.msg_regdate = msg_regdate;
		this.msg_section = msg_section;
	}

	public int getMsg_no() {
		return msg_no;
	}

	public void setMsg_no(int msg_no) {
		this.msg_no = msg_no;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMsg_title() {
		return msg_title;
	}

	public void setMsg_title(String msg_title) {
		this.msg_title = msg_title;
	}

	public String getMsg_content() {
		return msg_content;
	}

	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}

	public String getMsg_send() {
		return msg_send;
	}

	public void setMsg_send(String msg_send) {
		this.msg_send = msg_send;
	}

	public String getMsg_recieve() {
		return msg_recieve;
	}

	public void setMsg_recieve(String msg_recieve) {
		this.msg_recieve = msg_recieve;
	}

	public Date getMsg_regdate() {
		return msg_regdate;
	}

	public void setMsg_regdate(Date msg_regdate) {
		this.msg_regdate = msg_regdate;
	}

	public int getMsg_section() {
		return msg_section;
	}

	public void setMsg_section(int msg_section) {
		this.msg_section = msg_section;
	}

	
} // end class Message
