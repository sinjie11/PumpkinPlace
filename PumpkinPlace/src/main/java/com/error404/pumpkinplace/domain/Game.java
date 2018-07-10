package com.error404.pumpkinplace.domain;

public class Game {
	
	private String mem_id;
	private int mem_account;
	private int mem_gamescore;
	
	public Game() {}

	public Game(String mem_id, int mem_account, int mem_gamescore) {
		this.mem_id = mem_id;
		this.mem_account = mem_account;
		this.mem_gamescore = mem_gamescore;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
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
