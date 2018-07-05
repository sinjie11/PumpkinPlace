package com.error404.pumpkinplace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.error404.pumpkinplace.domain.Board;
import com.error404.pumpkinplace.pageutil.PaginationCriteria;
import com.error404.pumpkinplace.persistence.BoardDao;

@Service
public class BoardServiceImple implements BoardService {

	@Autowired
	private BoardDao boardDao;

	@Override
	public List<Board> read() {

		return boardDao.select();
	}

	@Override
	public int create(Board board) {

		return boardDao.insert( board);
	}

//	@Override
//	public Board read(int b_section) {
//
//		return boardDao.select(b_section);
//	}

	@Override
	public Board readByBno(int bno) {
		return boardDao.selectByBno(bno);

	}

	@Override
	public int update(Board board) {

		return boardDao.update(board);
	}

	@Override
	public int delete(int b_no) {

		return boardDao.delete(b_no);
	}

	@Override
	public List<Board> read(int type, String keyword) {

		return boardDao.search(type, keyword);
	}

	@Override
	public int getNumOfRecords() {
		return boardDao.getNumOfRecords();
	}

	@Override
	public List<Board> read(PaginationCriteria criteria) {
		return boardDao.select(criteria);
	}

	@Override
	public List<Board> readBySectionNo(int b_section, PaginationCriteria criteria) {
		return boardDao.selectBySectionNo(b_section, criteria);
	}
	
	@Override
	public List<Board> readAllBySectionNo11( PaginationCriteria criteria) {
		return boardDao.selectAllBySectionNo11(criteria);
	}
	
	@Override
	public List<Board> readAllBySectionNo12( PaginationCriteria criteria) {
		return boardDao.selectAllBySectionNo12(criteria);
	}
	
	@Override
	public List<Board> readBySectionNo1() {
		return boardDao.selectBySectionNo1();
	}
	
	@Override
	public List<Board> readBySectionNo11() {
		return boardDao.selectBySectionNo11();
	}
	
	@Override
	public List<Board> readBySectionNo12() {
		return boardDao.selectBySectionNo12();
	}
	
	@Override
	public Board readDetail(int bno) {
		int result = boardDao.pulsReadcnt(bno);//조회수 +1
		System.out.println("검색 리저트"+result);
		return boardDao.boardSelect(bno);//보드 불러오기 
	}

	@Override
	public Board upPuls1(int bno) {
		boardDao.pulsUp(bno);
		return boardDao.getUpDown(bno);
	}

	@Override
	public Board downPuls1(int bno) {
		boardDao.pulsDown(bno);
		return boardDao.getUpDown(bno);
	}

	@Override
	public int readSectionNoByBno(int bno) {
		return boardDao.checkSectionNoByBno(bno);
	}

	@Override
	public int prevboardNo(Board board) {
		return boardDao.prevBoardNo(board);
	}

	@Override
	public int nextboardNo(Board board) {
		return boardDao.nextBoardNo(board);
	}
	
	
} 


