package com.error404.pumpkinplace.domain;

import java.util.Date;

public class Member {
	
	private int mem_no; // 회원 번호
	private String mem_id; // 회원 아이디
	private String mem_pwd; // 회원 비밀번호
	private String mem_email; // 회원 이메일
	private String mem_tel; // 회원 전화번호
	private Date mem_regdate; // 회원 가입일자
	
	public Member() {}

	public Member(int mem_no, String mem_id, String mem_pwd, String mem_email, String mem_tel, Date mem_regdate) {
		super();
		this.mem_no = mem_no;
		this.mem_id = mem_id;
		this.mem_pwd = mem_pwd;
		this.mem_email = mem_email;
		this.mem_tel = mem_tel;
		this.mem_regdate = mem_regdate;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pwd() {
		return mem_pwd;
	}

	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_tel() {
		return mem_tel;
	}

	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}

	public Date getMem_regdate() {
		return mem_regdate;
	}

	public void setMem_regdate(Date mem_regdate) {
		this.mem_regdate = mem_regdate;
	}

	@Override
	public String toString() {
		return "Member [mem_no=" + mem_no + ", mem_id=" + mem_id + ", mem_pwd=" + mem_pwd + ", mem_email=" + mem_email
				+ ", mem_tel=" + mem_tel + ", mem_regdate=" + mem_regdate + "]";
	}
	
	
	

} // end class Member
