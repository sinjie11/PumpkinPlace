package com.error404.pumpkinplace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.error404.pumpkinplace.domain.Game;
import com.error404.pumpkinplace.persistence.GameDao;

public class GameServiceImple implements GameService {
	
	@Autowired
	private GameDao gameDao;
	
	@Override
	public int insert(Game game) {
		return gameDao.insert(game);
	}
	
	@Override
	public int update(Game game) {
		return gameDao.update(game);
	}
	
	@Override
	public List<Game> read() {
		return gameDao.select();
	}
}
