package com.error404.pumpkinplace.mappers;

import java.util.List;

import com.error404.pumpkinplace.domain.Message;
import com.error404.pumpkinplace.pageutil.PaginationCriteria;

public interface MessageMapper {
	
	List<Message> send(String mem_id);
	
	List<Message> receive(String mem_id2);
		
	List<Message> sendPage(PaginationCriteria criteria);
	
	List<Message> receivePage(PaginationCriteria criteria);
	
	int totalCount(String mem_id);
	
	int totalCount2(String mem_id2);
	
	int insertMessage(Message message);
	
	Message selectById(String mem_id);
	
	Message selectById2(String mem_id2);
	
	Message selectByMsgNo(int msg_no);
		
	int update(Message message);
	
	int delete(int msg_no);

} // end interface MessageMapper
