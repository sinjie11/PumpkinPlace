package com.error404.pumpkinplace.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public void send(Integer page, Integer numsPerPage, String mem_id, Model model, HttpSession session) {
		
		PaginationCriteria criteria = new PaginationCriteria();
		if (page != null) {
			criteria.setPage(page);
		}
		if (numsPerPage != null) {
			criteria.setNumsPerPage(numsPerPage);
		}
				
		List<Message> list = messageService.send((String) session.getAttribute("loginId"));
		
		model.addAttribute("sendList", list);
		
		PageLinkMaker maker = new PageLinkMaker();
		maker.setCriteria(criteria);
		maker.setTotalCount(messageService.total());
		maker.setPageLinkData();
		model.addAttribute("pageMaker", maker);

		
	} // end send(mem_id, model)
	
	@RequestMapping(value = "/recieve", method = RequestMethod.GET)
	public void recieve(String mem_id2, Model model, HttpSession session) {
		
			
		List<Message> list = messageService.recieve((String) session.getAttribute("loginId"));
		
		model.addAttribute("recieveList", list);

	} // end recieve(mem_id2, model, session)
	
	@RequestMapping(value = "/recievedetail", method = RequestMethod.GET)
	public void recieveDetail(String mem_id2, Model model, HttpSession session) {
		logger.info("recieveDetail() GET 호출");
		
		List<Message> list = messageService.recieve((String) session.getAttribute("loginId"));
		
		model.addAttribute("recieveDetail", list);
		
	} // end recieveDetail(mem_id2, model, session)
		

} // end class MessageController
