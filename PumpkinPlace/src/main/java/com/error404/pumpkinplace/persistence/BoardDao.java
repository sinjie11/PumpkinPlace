package com.error404.pumpkinplace.persistence;

import java.util.List;

import com.error404.pumpkinplace.domain.Board;
import com.error404.pumpkinplace.pageutil.PaginationCriteria;

public interface BoardDao {

	List<Board> select();
	int insert( Board board);
	Board selectByBno(int b_no);

	int update(Board board);
	int delete(int bno);
	
	List<Board> search(int type, String keyword, int sectionNo, PaginationCriteria criteria);
	List<Board> searchSectionNo11(int type, String keyword, PaginationCriteria criteria);
	List<Board> searchSectionNo12(int type, String keyword, PaginationCriteria criteria);

	
	int getNumOfRecords(int sectionNo);
	int getNumOfSearchRecords(int type, String keyword, int sectionNo);
	
	List<Board> select(PaginationCriteria criteria);
	
	List<Board> selectBySectionNo(int sectionNo, PaginationCriteria criteria);
	List<Board> selectAllBySectionNo11(PaginationCriteria criteria);
	List<Board> selectAllBySectionNo12(PaginationCriteria criteria);
	List<Board> selectBySectionNo1();
	List<Board> selectBySectionNo11();
	List<Board> selectBySectionNo12();
	
	Board boardSelect(int bno);
	int pulsReadcnt(int bno);
	int pulsUp(int bno);
	int pulsDown(int bno);
	Board getUpDown(int bno);
	

	int checkSectionNoByBno(int bno);

	//////////////////////
	int prevBoardNo(Board board); // 이전글 번호 받기
	int nextBoardNo(Board board); // 다음글 번호 받기
} 





