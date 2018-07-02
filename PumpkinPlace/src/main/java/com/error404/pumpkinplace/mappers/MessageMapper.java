package com.error404.pumpkinplace.mappers;

import com.error404.pumpkinplace.domain.Message;

public interface MessageMapper {
	
	int insertMessage(Message message);
	
	Message selectById(String mem_id, Boolean msg_confirm);
	
	int update(Message message);
	
	int delete(int msg_no);

} // end interface MessageMapper
