package com.error404.pumpkinplace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.error404.pumpkinplace.domain.ShowBoard;
import com.error404.pumpkinplace.persistence.ShowBoardDao;

public class ShowBoardServiceImple implements ShowBoardService {
	
	@Autowired
	private ShowBoardDao showBoardDao;

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

}
