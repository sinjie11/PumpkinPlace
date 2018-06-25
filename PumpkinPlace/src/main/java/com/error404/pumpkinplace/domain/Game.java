package com.error404.pumpkinplace.domain;

public class Game {
	
	private int mem_no;
	private int mem_account;
	private int mem_gamescore;
	
	public Game() {}

	public Game(int mem_no, int mem_account, int mem_gamescore) {
		this.mem_no = mem_no;
		this.mem_account = mem_account;
		this.mem_gamescore = mem_gamescore;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public int getMem_account() {
		return mem_account;
	}

	public void setMem_account(int mem_account) {
		this.mem_account = mem_account;
	}

	public int getMem_gamescore() {
		return mem_gamescore;
	}

	public void setMem_gamescore(int mem_gamescore) {
		this.mem_gamescore = mem_gamescore;
	}
	
	
	
}
