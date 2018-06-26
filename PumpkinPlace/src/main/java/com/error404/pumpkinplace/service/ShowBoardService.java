package com.error404.pumpkinplace.service;

import java.sql.Date;
import java.util.List;

import com.error404.pumpkinplace.domain.ShowBoard;

public interface ShowBoardService {
	int create(ShowBoard showboard); // insert
	ShowBoard read(int sb_no); // selectBysb_no
	int update(ShowBoard showboard); // update
	int delete(int sb_no); // delete
	int getNumOfShowBoardRecords(); // 게시글 갯수 카운트
	List<ShowBoard> search(String keyword); // search
//	List<ShowBoard> searchByDate(Date keywordDate);
//	List<ShowBoard> select(PaginationCriteria criteria); // 페이징
}
