package com.error404.pumpkinplace.service;

import java.util.List;

import com.error404.pumpkinplace.domain.ShowBoard;

public interface ShowBoardService {
	List<ShowBoard> read();
	int create(ShowBoard showboard);
	ShowBoard read(int sb_no);
	int update(ShowBoard showboard);
	int delete(int sb_no);
	
}
