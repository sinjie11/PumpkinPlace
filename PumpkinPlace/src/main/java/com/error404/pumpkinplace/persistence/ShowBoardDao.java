package com.error404.pumpkinplace.persistence;


import java.util.List;

import com.error404.pumpkinplace.domain.ShowBoard;
import com.error404.pumpkinplace.pageutil.*;

public interface ShowBoardDao {
	
	int insert(ShowBoard showBoard); // insert
	List<ShowBoard> select(); // selectAll
	int update(ShowBoard showBoard); // update
	int delete(int sb_no); // delete
	ShowBoard select(int sb_no); // selectBysb_no
	int getNumOfShowBoardRecords(); // 게시글 카운트
	List<ShowBoard> searchkeyShowBoard(String keyword); // search keyword
	List<ShowBoard> searchdateShowBoard(String date); // search date
	List<ShowBoard> select(PaginationCriteria criteria);
}
