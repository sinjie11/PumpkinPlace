package com.error404.pumpkinplace.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/gameboard")
public class GameController {

	private static final Logger logger = LoggerFactory.getLogger(GameController.class);
	
	@RequestMapping(value = "/game")
	public void game() {
		logger.info("game 페이지 호출");
	}
	
	@RequestMapping(value = "/shop")
	public void shop() {
		logger.info("game 아이템샵 페이지 호출");
	}
	
}
