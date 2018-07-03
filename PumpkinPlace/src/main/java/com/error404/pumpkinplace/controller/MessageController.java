package com.error404.pumpkinplace.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.error404.pumpkinplace.domain.Message;
import com.error404.pumpkinplace.service.MemberService;
import com.error404.pumpkinplace.service.MessageService;

@Controller
@RequestMapping(value = "/message")
public class MessageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MessageService messageService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void messageList(Model model) {
		logger.info("messageList() GET 호출");
		
	} // end messageList()
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insertMessage() {
		logger.info("insertMessage() GET 호출");
		
	} // end insertMessage()
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertMessage(Message message) {
		logger.info("insertMessage({}) POST 호출", message);
		messageService.create(message);
		
		return "redirect:/message/list";
		
	} // end insertMessage()
	
	@RequestMapping(value = "/send", method = RequestMethod.GET)
	public void send(String mem_id, Model model) {
		Message message = new Message(0, "${loginId}", null, null, null, null, false);
		
		List<Message> list = messageService.send(message.getMem_id());
		model.addAttribute("sendList", list);
		
	} // end send(mem_id, model)
	
	@RequestMapping(value = "/recieve", method = RequestMethod.GET)
	public void recieve() {

		
	} // end recieve()
	
	

} // end class MessageController
