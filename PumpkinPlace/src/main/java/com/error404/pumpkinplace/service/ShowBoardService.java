package com.error404.pumpkinplace.service;

import java.sql.Date;
import java.util.List;

import com.error404.pumpkinplace.domain.ShowBoard;
import com.error404.pumpkinplace.pageutil.*;

public interface ShowBoardService {
	List<ShowBoard> read();
	int create(ShowBoard showboard); // insert
	ShowBoard read(int sb_no); // selectBysb_no
	int update(ShowBoard showboard); // update
	int delete(int sb_no); // delete
	int getNumOfShowBoardRecords(); // 게시글 갯수 카운트
	List<ShowBoard> read(PaginationCriteria criteria); // 페이징
	List<ShowBoard> searchByKeyword(String keyword); // search
	List<ShowBoard> searchByDate(String date);
	
}
