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
	public void messageList() {
		logger.info("messageList() GET 호출");
		
	} // end messageList()
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insertMessage() {
		logger.info("insertMessage() GET 호출");
		
	} // end insertMessage()
	
	@RequestMapping(value = "/send", method = RequestMethod.GET)
	public void selectById() {
		logger.info("selectById() GET 호출");
		
	} // end selectById()
	
	@RequestMapping(value = "/recieve", method = RequestMethod.GET)
	public void selectById2() {
		logger.info("selectById()2 GET 호출");
		
	} // end selectById()
	
	

} // end class MessageController
