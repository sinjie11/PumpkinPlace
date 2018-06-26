package com.error404.pumpkinplace.service;

import java.util.List;

import com.error404.pumpkinplace.domain.ShowBoard;

public interface ShowBoardService {
	int create(ShowBoard showboard); // insert
	ShowBoard read(int sb_no); // selectBysb_no
	int update(ShowBoard showboard); // update
	int delete(int sb_no); // delete
	
}
