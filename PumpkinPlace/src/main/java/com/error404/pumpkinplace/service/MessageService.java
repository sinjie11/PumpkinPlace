package com.error404.pumpkinplace.service;

import com.error404.pumpkinplace.domain.Message;

public interface MessageService {
	
	int create(Message message); // 쪽지 보내기 서비스
	
	Message read(String mem_id, Boolean msg_confirm); // 아이디 검색 서비스
	
	int update(Message message); // 쪽지 수정 서비스
	
	int delete(int msg_no); // 쪽지 삭제 서비스

} // end interface MessageService
