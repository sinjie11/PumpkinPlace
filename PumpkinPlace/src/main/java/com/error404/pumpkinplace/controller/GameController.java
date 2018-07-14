package com.error404.pumpkinplace.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.error404.pumpkinplace.domain.Game;
import com.error404.pumpkinplace.service.GameService;

@Controller
@RequestMapping(value = "/game")
public class GameController {

	private static final Logger logger = LoggerFactory.getLogger(GameController.class);
	
	@Autowired
	private GameService gameService;

	@RequestMapping(value = "/gamepage")
	public void game() {
		
	}

	@RequestMapping(value = "/register", method=RequestMethod.GET)
	public void register() {	
	}
	
	@RequestMapping(value = "/register",  method=RequestMethod.POST)
	public String register(Game game) {
		gameService.insert(game);
		return "redirect:/game/gamepage/";
	}

	
	@RequestMapping(value = "/gameupdate", method=RequestMethod.POST)
	public String update(Game game, Model model) {
		int result = gameService.update(game);
		model.addAttribute(result);
		
		return "redirect:/game/gamepage";
	}
	
	@RequestMapping(value="/gamehome", method=RequestMethod.GET)
	public void rank(Model model) {
		List<Game> list = gameService.read();
		model.addAttribute("gameList", list);
	}
	
	@RequestMapping(value="/check", method=RequestMethod.GET)
	public void checkNullOfScore(String userid, RedirectAttributes attr) {
		int result = gameService.checkNullOfScore(userid);
		if (result == 1) {
			attr.addFlashAttribute("userid", userid);
			attr.addFlashAttribute("checkResult", "success");
		}
	}
		
}

