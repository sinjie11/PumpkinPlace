package com.error404.pumpkinplace.mappers;

import java.util.List;

import com.error404.pumpkinplace.domain.Message;
import com.error404.pumpkinplace.pageutil.PaginationCriteria;

public interface MessageMapper {
	
	int insertMessage(Message message);
	
	List<Message> selectAllMemId2Message();
	
	List<Message> selectAllMemIdMessage();
	
	Message selectByMsgNo(int msg_no);
	
	int totalCountMemId();
	
	int totalCountMemId2();

} // end interface MessageMapper
