package com.error404.pumpkinplace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.error404.pumpkinplace.domain.ShowBoard;
import com.error404.pumpkinplace.pageutil.PaginationCriteria;
import com.error404.pumpkinplace.persistence.ShowBoardDao;

@Service
public class ShowBoardServiceImple implements ShowBoardService {
	
	@Autowired
	private ShowBoardDao showBoardDao;

	@Override
	public List<ShowBoard> read() {

		return showBoardDao.select();
	}
	
	@Override
	public int create(ShowBoard showBoard) {

		return showBoardDao.insert(showBoard);
	}
	
	@Override
	public ShowBoard read(int sb_no) {

		return showBoardDao.select(sb_no);
	}

	@Override
	public int update(ShowBoard showBoard) {

		return showBoardDao.update(showBoard);
	}

	@Override
	public int delete(int sb_no) {

		return showBoardDao.delete(sb_no);
	}

	@Override
	public int getNumOfShowBoardRecords() {

		return showBoardDao.getNumOfShowBoardRecords();
	}

	@Override
	public List<ShowBoard> searchByKeyword(String keyword) {

		return showBoardDao.searchkeyShowBoard(keyword);
	}

	@Override
	public List<ShowBoard> read(PaginationCriteria criteria) {

		return showBoardDao.select(criteria);
	}

	@Override
	public List<ShowBoard> searchByDate(String date) {
		
		return showBoardDao.searchdateShowBoard(date);
	}
		

	

}
