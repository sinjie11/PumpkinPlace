package com.error404.pumpkinplace.persistence;

import com.error404.pumpkinplace.domain.Message;

public interface MessageDao {
	
	int insert(Message message);
	
	Message select(String mem_id);
	
	Message select2(String mem_id2);
	
	int update(Message message);
	
	int delete(int msg_no);


} // end interface MessageDao
