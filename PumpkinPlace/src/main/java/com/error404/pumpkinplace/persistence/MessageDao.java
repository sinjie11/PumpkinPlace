package com.error404.pumpkinplace.persistence;

import java.util.List;

import com.error404.pumpkinplace.domain.Message;
import com.error404.pumpkinplace.pageutil.PaginationCriteria;

public interface MessageDao {
	
	int insert(Message message);
	
	List<Message> selectAllMemId2();
	
	List<Message> selectAllMemId();
	
	Message select(int msg_no);
	
	List<Message> selectSend(PaginationCriteria criteria);
	
	List<Message> selectReceive(PaginationCriteria criteria);
	
	int getNumOfMessageMemIdRecords();
	
	int getNumOfMessageMemId2Records();
	
	int delete(int msg_no);
	

} // end interface MessageDao
