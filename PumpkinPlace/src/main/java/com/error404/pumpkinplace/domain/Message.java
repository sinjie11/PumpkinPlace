package com.error404.pumpkinplace.domain;

import java.util.Date;

public class Message {
	
	private int msg_no; // 쪽지 번호
	private String mem_id; // 쪽지 발신 아이디
	private String mem_id2; // 쪽지 수신 아이디
	private String msg_content; // 쪽지 내용
	private Date msg_regdate; // 쪽지 작성 일자
	private int msg_confirm; // 쪽지 수신 여부 (0: 읽지않음, 0이외 값: 읽음)
	
	public Message() {}

	public Message(int msg_no, String mem_id, String mem_id2, String msg_content, Date msg_regdate, int msg_confirm) {
		
		this.msg_no = msg_no;
		this.mem_id = mem_id;
		this.mem_id2 = mem_id2;
		this.msg_content = msg_content;
		this.msg_regdate = msg_regdate;
		this.msg_confirm = msg_confirm;
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

	public String getMem_id2() {
		return mem_id2;
	}

	public void setMem_id2(String mem_id2) {
		this.mem_id2 = mem_id2;
	}

	public String getMsg_content() {
		return msg_content;
	}

	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}

	public Date getMsg_regdate() {
		return msg_regdate;
	}

	public void setMsg_regdate(Date msg_regdate) {
		this.msg_regdate = msg_regdate;
	}

	public int getMsg_confirm() {
		return msg_confirm;
	}

	public void setMsg_confirm(int msg_confirm) {
		this.msg_confirm = msg_confirm;
	}

} // end class Message
