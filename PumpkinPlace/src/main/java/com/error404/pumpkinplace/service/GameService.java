package com.error404.pumpkinplace.service;

import java.util.List;

import com.error404.pumpkinplace.domain.Game;

public interface GameService {
	int insert(Game game);
	int update(Game game);
	List<Game> read();
	Game readOne(int mem_no);
	int checkNullOfScore(String userid);
}
