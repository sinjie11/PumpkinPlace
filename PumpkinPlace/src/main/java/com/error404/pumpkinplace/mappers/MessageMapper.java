package com.error404.pumpkinplace.mappers;

import com.error404.pumpkinplace.domain.Message;

public interface MessageMapper {
	
	// com.error404.pumpkinplace.mappers.MemberMapper.~
	int insertMessage(Message msg);
	
	Message selectMessage(String mem_id);
	
	int update(Message msg);
	
	int delete(String msg_no);

	
} // end interface MessageMapper
