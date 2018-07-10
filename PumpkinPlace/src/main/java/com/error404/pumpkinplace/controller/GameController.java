package com.error404.pumpkinplace.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/game")
public class GameController {

	private static final Logger logger = LoggerFactory.getLogger(GameController.class);
	
/*	@RequestMapping(value = "/gameView")
	@RequestMapping(value = "/gamepage")
	public void game() {
		logger.info("game 페이지 호출");
	}*/
	@RequestMapping(value = "/gamepage")
	public void game() {
		logger.info("game 페이지 호출");
	}
	
}
