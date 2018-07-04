package com.error404.pumpkinplace.persistence;

import java.util.List;

import com.error404.pumpkinplace.domain.Game;

public interface GameDao {
	int insert(Game game);
	int update(Game game);
	List<Game> select();
}
