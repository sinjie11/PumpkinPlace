package com.error404.pumpkinplace.persistence;

import java.util.List;

import com.error404.pumpkinplace.domain.Board;
import com.error404.pumpkinplace.pageutil.PaginationCriteria;

public interface BoardDao {

	List<Board> select();
	int insert(Board board);
//	Board select(int b_section);
	Board selectByBno(int b_no);
	int update(Board board);
	int delete(int bno);
	List<Board> search(int type, String keyword);
	int getNumOfRecords();
	List<Board> select(PaginationCriteria criteria);
	List<Board> selectBySectionNo(int sectionNo);
	
} 





