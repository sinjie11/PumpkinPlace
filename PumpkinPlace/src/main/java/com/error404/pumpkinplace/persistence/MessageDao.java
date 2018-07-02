package com.error404.pumpkinplace.persistence;

import com.error404.pumpkinplace.domain.Message;

public interface MessageDao {
	
	int insert(Message message);
	
	Message select(String mem_id, Boolean msg_confirm);
	
	int update(Message message);
	
	int delete(int msg_no);
	

} // end interface MessageDao
