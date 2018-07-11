package com.error404.pumpkinplace.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.error404.pumpkinplace.domain.Reply;
import com.error404.pumpkinplace.service.ReplyServiceImple;
//레스트 방식으로 작동 하는 컨트롤러를 만드려면 @RestController의 컨트롤러로 만들거나 @ResponseBody 로 메소드를 만들어 줘야함
@RestController
@RequestMapping(value = "/reply")
public class ReplyController {
	@Autowired
	private ReplyServiceImple replySerciceImple;
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void replyInsert(Reply reply) {
		replySerciceImple.replyInsert(reply);
		
	}
	@RequestMapping(value = "/selectAll1" , method = RequestMethod.GET)
	public ResponseEntity<List<Reply>> replySelectAll1(int b_no) {
		List<Reply> list = replySerciceImple.selectReplyAll1(b_no);
		ResponseEntity<List<Reply>> entity = new ResponseEntity<List<Reply>>(list, HttpStatus.OK);
		return entity;
	}
	@RequestMapping(value = "/selectAll2" , method = RequestMethod.GET)
	public ResponseEntity<List<Reply>> replySelectAll2(int b_no) {
		List<Reply> list = replySerciceImple.selectReplyAll2(b_no);
		ResponseEntity<List<Reply>> entity = new ResponseEntity<List<Reply>>(list, HttpStatus.OK);
		return entity;
	}
}
