package com.error404.pumpkinplace.mappers;

import com.error404.pumpkinplace.domain.Message;

public interface MessageMapper {
	
	int insertMessage(Message message);
	
	Message selectById(String mem_id);
	
	Message selectById2(String mem_id2);
		
	int update(Message message);
	
	int delete(int msg_no);

} // end interface MessageMapper
