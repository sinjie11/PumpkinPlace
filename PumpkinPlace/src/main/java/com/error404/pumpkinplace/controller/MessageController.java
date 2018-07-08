package com.error404.pumpkinplace.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.error404.pumpkinplace.domain.Message;
import com.error404.pumpkinplace.pageutil.PageLinkMaker;
import com.error404.pumpkinplace.pageutil.PaginationCriteria;
import com.error404.pumpkinplace.service.MessageService;

@Controller
@RequestMapping(value = "/message")
public class MessageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MessageService messageService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void messageList() {
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
	public void send(Integer page, Integer numsPerPage, Model model, HttpSession session) {
		logger.info("send() GET 호출");
		
		PaginationCriteria criteria = new PaginationCriteria();
		if (page != null) {
			criteria.setPage(page);
		}
		if (numsPerPage != null) {
			criteria.setNumsPerPage(numsPerPage);
		}
	
		List<Message> list = messageService.readSend(criteria);
		model.addAttribute("sendList", list);
		
		PageLinkMaker maker = new PageLinkMaker();
		maker.setCriteria(criteria);
		maker.setTotalCount(messageService.getNumOfMessageMemId2Records()); // 보낸 쪽지함에서 받은 사람 추출
		maker.setPageLinkData();
		
		model.addAttribute("pageMaker", maker);					
				
	} // end send()
	
	@RequestMapping(value = "/senddetail", method = RequestMethod.GET)
	public void sendDetail(@ModelAttribute("criteria") PaginationCriteria criteria, int msg_no, Model model, HttpSession session) {
		logger.info("sendDetail() GET 호출");
		
		Message message = messageService.read(msg_no);
		
		model.addAttribute("message", message);
				
	} // end sendDetail(mem_id, model, session)
	
	@RequestMapping(value = "/receive", method = RequestMethod.GET)
	public void receive(Integer page, Integer numsPerPage, Model model, HttpSession session) {
		logger.info("receivePage() GET 호출");
		
		PaginationCriteria criteria = new PaginationCriteria();
		if (page != null) {
			criteria.setPage(page);
		}
		if (numsPerPage != null) {
			criteria.setNumsPerPage(numsPerPage);
		}
	
		List<Message> list = messageService.readReceive(criteria);
		
		model.addAttribute("receiveList", list);
		
		PageLinkMaker maker = new PageLinkMaker();
		maker.setCriteria(criteria);
		maker.setTotalCount(messageService.getNumOfMessageMemIdRecords()); // 받은 쪽지함에서 보낸 사람 추출
		maker.setPageLinkData();
		
		model.addAttribute("pageMaker", maker);	;
	
	} // end receive()
	
	@RequestMapping(value = "/receivedetail", method = RequestMethod.GET)
	public void receiveDetail(@ModelAttribute("criteria") PaginationCriteria criteria, int msg_no, Model model, HttpSession session) {
		logger.info("receiveDetail() GET 호출");
		
		Message message = messageService.read(msg_no);
		
		model.addAttribute("message", message);
		
	
				
	} // end receiveDetail(mem_id2, model, session)
		

} // end class MessageController
