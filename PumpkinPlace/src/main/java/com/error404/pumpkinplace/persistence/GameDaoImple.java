package com.error404.pumpkinplace.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.error404.pumpkinplace.domain.Game;

public class GameDaoImple implements GameDao {
	private static final String NAMESPACE =
			"com.error404.pumpkinplace.mappers.GameMapper";
	
	private static final Logger logger =
			LoggerFactory.getLogger(GameDaoImple.class);
	
	@Autowired
	private SqlSession sqlSession; 
	
	@Override
	public int insert(Game game) {
		logger.info("insert() 호출");
		return sqlSession.insert(NAMESPACE + ".insertGameInfo", game);
	}

	@Override
	public int update(Game game) {
		logger.info("update() 호출");
		return sqlSession.update(NAMESPACE + "updatePointAndScore",  game);
	}

	@Override
	public List<Game> select() {
		logger.info("select() 호출");
		return sqlSession.selectList(NAMESPACE + "selectGameAll");
	}

}
