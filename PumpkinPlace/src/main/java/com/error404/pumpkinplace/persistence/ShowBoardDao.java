package com.error404.pumpkinplace.persistence;


import java.util.List;

import com.error404.pumpkinplace.domain.ShowBoard;

public interface ShowBoardDao {
	
	int insert(ShowBoard showBoard); // insert
	List<ShowBoard> select(); // selectAll
	int update(ShowBoard showBoard); // update
	int delete(int sb_no); // delete
	ShowBoard select(int sb_no); // selectBysb_no
	
}
