package com.error404.pumpkinplace.service;

import java.util.List;

import com.error404.pumpkinplace.domain.Board;
import com.error404.pumpkinplace.pageutil.*;

public interface BoardService {
	List<Board> read();
	int create(Board board);
	Board read(int b_section);
	int update(Board board);
	int delete(int bno);
	List<Board> read(int type, String keyword);
	int getNumOfRecords();
//	List<Board> read(PaginationCriteria criteria);
}
