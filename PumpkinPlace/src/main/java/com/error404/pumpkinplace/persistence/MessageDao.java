package com.error404.pumpkinplace.persistence;

import java.util.List;

import com.error404.pumpkinplace.domain.Message;
import com.error404.pumpkinplace.pageutil.PaginationCriteria;

public interface MessageDao {
	
	List<Message> send(String mem_id);
	
	List<Message> receive(String mem_id2);
		
	List<Message> sendPage(PaginationCriteria criteria);
	
	List<Message> receivePage(PaginationCriteria criteria);
	
	int totalCount(String mem_id);
	
	int totalCount2(String mem_id2);
	
	int insert(Message message);
	
	Message select(String mem_id);
	
	Message select2(String mem_id2);
	
	Message select3(int msg_no);
	
	int update(Message message);
	
	int delete(int msg_no);


} // end interface MessageDao
