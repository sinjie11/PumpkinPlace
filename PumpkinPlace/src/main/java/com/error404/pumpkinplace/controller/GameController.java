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

	@RequestMapping(value = "/register", method=RequestMethod.GET)
	public void register() {	
	}
	
	@RequestMapping(value = "/register",  method=RequestMethod.POST)
	public String register(Game game) {
		gameService.insert(game);
		
		return "redirect:/game/gamepage";
	}
	
	@RequestMapping(value = "/update", method=RequestMethod.GET)
	public void update(int mem_no, Model model) {
		Game game = gameService.readOne(mem_no);
		model.addAttribute(game);
	}
	
	@RequestMapping(value = "/update", method=RequestMethod.POST)
	public String update(Game game, RedirectAttributes attr) {
		int result = gameService.update(game);
		if(result ==1) {
			attr.addFlashAttribute("updateResult", "success");
		}
		
		return "redirect:/game/gamepage";
	}
	
	@RequestMapping(value="/rank", method=RequestMethod.GET)
	public void rank(Model model) {
		List<Game> list = gameService.read();
		model.addAttribute("gameList", list);
	}
}

