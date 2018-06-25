package com.error404.pumpkinplace.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.error404.pumpkinplace.service.ShowBoardService;

@Controller
@RequestMapping(value = "/showboard")
public class ShowBoardController {
	private static final Logger logger = LoggerFactory.getLogger(ShowBoardController.class);
	
	@RequestMapping(value = "/showboard")
	public void showBoard(){
		
		
	}
	
	
} // end class ShowBoardController
