package com.error404.pumpkinplace.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value ="/tradeboard")
public class TradeController {

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model) {
		
		// action 적용시 필요
		model.addAttribute("url", "trade");
		
	}
}
