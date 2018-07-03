package com.error404.pumpkinplace.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.error404.pumpkinplace.service.MemberService;

@Controller
@RequestMapping(value = "/message")
public class MessageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void insertMessage() {
		logger.info("insertMessage() GET 호출");
		
	} // end insertMessage()
	
	

} // end class MessageController
