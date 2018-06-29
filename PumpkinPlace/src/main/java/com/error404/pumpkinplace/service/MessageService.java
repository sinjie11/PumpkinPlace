package com.error404.pumpkinplace.service;

import com.error404.pumpkinplace.domain.Message;

public interface MessageService {
	
	int create(Message msg); // 쪽지 보내기 서비스
	
	Message read(String mem_id); // 아이디로 검색 서비스
	
	int update(Message msg); // 쪽지 수정 서비스
	
	int delete(String msg_no); // 쪽지 삭제 서비스
	

} // end interface MessageService
