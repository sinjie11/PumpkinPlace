package com.error404.pumpkinplace.service;

import java.util.List;

import com.error404.pumpkinplace.domain.Message;
import com.error404.pumpkinplace.pageutil.PaginationCriteria;

public interface MessageService {
	
	int create(Message message); // 쪽지 보내기 서비스
	
	List<Message> readAllMemId2(); // 보낸 쪽지함 서비스
	
	List<Message> readAllMemId(); // 받은 쪽지함 서비스
	
	Message read(int msg_no);
	
	List<Message> readSend(PaginationCriteria criteria); // 보낸 쪽지함 페이징 서비스
	
	List<Message> readReceive(PaginationCriteria criteria); // 받은 쪽지함 페이징 서비스
	
	int getNumOfMessageMemIdRecords(); // 보낸 쪽지 갯수 서비스
	
	int getNumOfMessageMemId2Records(); // 받은 쪽지 갯수 서비스
	
	int delete(int msg_no); // 쪽지 삭제 서비스
	
} // end interface MessageService
