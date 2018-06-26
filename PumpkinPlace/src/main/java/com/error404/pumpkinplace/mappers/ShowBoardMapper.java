package com.error404.pumpkinplace.mappers;

import java.util.List;

import com.error404.pumpkinplace.domain.ShowBoard;

public interface ShowBoardMapper {
	int insertShowBoard(ShowBoard showBoard);
	
	List<ShowBoard> select();
	
	int updateShowBoard(ShowBoard showBoard);
	
	int deleteShowBoard(int sb_no);
	
	ShowBoard selectBySbNo(int sb_no);
	
	int totalCountShowBoard();
	
}
