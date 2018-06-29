package com.error404.pumpkinplace.domain;

import java.util.Date;

public class Message {
	
	private int msg_no; // 쪽지 번호
	private String msg_confirm; // 쪽지 확인 여부
	private String mem_id; // 회원 아이디(sender)
	private String msg_recvid; // 회원 아이디(receiver)
	private String msg_title; // 쪽지 제목
	private String msg_sendcontent; // 보낸 쪽지 내용
	private String msg_recvcontent; // 받은 쪽지 내용
	private Date msg_regdate; // 쪽지 작성일자
	
	public Message() {}

	public Message(int msg_no, String msg_confirm, String mem_id, String msg_recvid, String msg_title,
			String msg_sendcontent, String msg_recvcontent, Date msg_regdate) {

		this.msg_no = msg_no;
		this.msg_confirm = msg_confirm;
		this.mem_id = mem_id;
		this.msg_recvid = msg_recvid;
		this.msg_title = msg_title;
		this.msg_sendcontent = msg_sendcontent;
		this.msg_recvcontent = msg_recvcontent;
		this.msg_regdate = msg_regdate;
	}

	public int getMsg_no() {
		return msg_no;
	}

	public void setMsg_no(int msg_no) {
		this.msg_no = msg_no;
	}

	public String getMsg_confirm() {
		return msg_confirm;
	}

	public void setMsg_confirm(String msg_confirm) {
		this.msg_confirm = msg_confirm;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMsg_recvid() {
		return msg_recvid;
	}

	public void setMsg_recvid(String msg_recvid) {
		this.msg_recvid = msg_recvid;
	}

	public String getMsg_title() {
		return msg_title;
	}

	public void setMsg_title(String msg_title) {
		this.msg_title = msg_title;
	}

	public String getMsg_sendcontent() {
		return msg_sendcontent;
	}

	public void setMsg_sendcontent(String msg_sendcontent) {
		this.msg_sendcontent = msg_sendcontent;
	}

	public String getMsg_recvcontent() {
		return msg_recvcontent;
	}

	public void setMsg_recvcontent(String msg_recvcontent) {
		this.msg_recvcontent = msg_recvcontent;
	}

	public Date getMsg_regdate() {
		return msg_regdate;
	}

	public void setMsg_regdate(Date msg_regdate) {
		this.msg_regdate = msg_regdate;
	}
	
	
} // end class Message
