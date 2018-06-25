package com.error404.pumpkinplace.persistence;


import java.util.List;

import com.error404.pumpkinplace.domain.ShowBoard;

public interface ShowBoardDao {
	
	List<ShowBoard> select();
	int insert(ShowBoard showboard);
	ShowBoard select(int sb_no);
	int update(ShowBoard showboard);
	int delete(int sb_no);
	
}
