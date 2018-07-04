package com.error404.pumpkinplace.mappers;

import java.util.List;

import com.error404.pumpkinplace.domain.Message;
import com.error404.pumpkinplace.pageutil.PaginationCriteria;

public interface MessageMapper {
	
	List<Message> send(String mem_id);
	
	List<Message> recieve(String mem_id2);
	
	List<Message> send(PaginationCriteria criteria);
	
	List<Message> recieve(PaginationCriteria criteria);
	
	int totalCount();
	
	int totalCount2();
	
	int insertMessage(Message message);
	
	Message selectById(String mem_id);
	
	Message selectById2(String mem_id2);
		
	int update(Message message);
	
	int delete(int msg_no);

} // end interface MessageMapper
