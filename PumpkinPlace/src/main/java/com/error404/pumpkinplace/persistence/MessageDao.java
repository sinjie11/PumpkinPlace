package com.error404.pumpkinplace.persistence;

import com.error404.pumpkinplace.domain.Message;

public interface MessageDao {
	
	int insert(Message msg); // 쪽지 쓰기
	
	Message select(String mem_id); // 쪽지 검색
	
	int update(Message msg); // 쪽지 수정(제목, 내용)
	
	int delete(String msg_no); // 쪽지 삭제

} // end interface MessageDao
