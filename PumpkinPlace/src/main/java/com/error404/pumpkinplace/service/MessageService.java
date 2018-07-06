package com.error404.pumpkinplace.service;

import java.util.List;

import com.error404.pumpkinplace.domain.Message;
import com.error404.pumpkinplace.pageutil.PaginationCriteria;

public interface MessageService {
	
	List<Message> send(String mem_id); // 보낸 쪽지함 서비스
	
	List<Message> receive(String mem_id2); // 받은 쪽지함 서비스
	
	List<Message> sendPage(PaginationCriteria criteria); // 보낸 쪽지함 페이지 서비스
	
	List<Message> receivePage(PaginationCriteria criteria); // 받은 쪽지함 페이지 서비스
	
	int totalCount(String mem_id); // 보낸 쪽지함 총 페이지 개수
	
	int totalCount2(String mem_id2); // 받은 쪽지함 총 페이지 개수
	
	int create(Message message); // 쪽지 보내기 서비스
	
	Message read(String mem_id); // 아이디 검색 서비스
	
	Message read2(String mem_id2); // 아이디2 검색 서비스
	
	Message read3(int msg_no); // 쪽지 번호로 검색 서비스
	
	int update(Message message); // 쪽지 수정 서비스
	
	int delete(int msg_no); // 쪽지 삭제 서비스

} // end interface MessageService
