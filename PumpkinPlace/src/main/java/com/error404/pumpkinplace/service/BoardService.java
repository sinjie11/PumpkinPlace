package com.error404.pumpkinplace.service;

import java.util.List;

import com.error404.pumpkinplace.domain.Board;
import com.error404.pumpkinplace.pageutil.*;

public interface BoardService {
	// 게시판DB에 있는 모든 게시글을 보여주는 서비스
	List<Board> read();
	
	// 게시판DB에 새로운 게시글을 추가하는 서비스
	int create(Board board);
	
	// 게시판DB에서 해당 b_section에 속하는 게시글 하나를 보여주는 서비스
//	Board read(int b_section);
	
	Board readByBno(int bno);
	
	// 게시판DB에서 해당 b_section에 속하는 게시글 모두를 보여주는 서비스
	List<Board> readBySectionNo(int b_section, PaginationCriteria criteria);
	List<Board> readAllBySectionNo11( PaginationCriteria criteria);
	List<Board> readAllBySectionNo12( PaginationCriteria criteria);
	List<Board> readBySectionNo1();
	List<Board> readBySectionNo11();
	List<Board> readBySectionNo12();

	// 게시판DB에 있던 기존 게시글의 세부사항(제목, 내용 등)을 갱신하는 서비스
	int update(Board board);
	
	// 게시판DB에 있는 게시글 하나를 삭제하는 서비스 
	int delete(int bno);
	
	// 게시판DB에서 해당 keyword를 포함하는 게시글을 찾아 보여주는 서비스
	List<Board> read(int type, String keyword); 
	
	// 아래 두 method는 Page 처리를 합니다
	int getNumOfRecords();
	List<Board> read(PaginationCriteria criteria);
	
	//board detail 불러오기 
	Board readDetail(int bno);
	
	//up 
	Board upPuls1(int bno );
	
	//down
	Board downPuls1(int bno);
	
}
