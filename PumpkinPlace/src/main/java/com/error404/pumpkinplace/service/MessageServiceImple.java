package com.error404.pumpkinplace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.error404.pumpkinplace.domain.Message;
import com.error404.pumpkinplace.pageutil.PaginationCriteria;
import com.error404.pumpkinplace.persistence.MessageDao;

@Service
public class MessageServiceImple implements MessageService {
	
	@Autowired
	private MessageDao messageDao;
	
	@Override
	public int create(Message message) {
	
		return messageDao.insert(message);
	} // end create(message)
	
	@Override
	public List<Message> readAllMemId2() {
		
		return messageDao.selectAllMemId2();
	} // end read()
	
	@Override
	public List<Message> readAllMemId() {
		
		return messageDao.selectAllMemId();
	} // end readAllMemId()
	
	
	@Override
	public Message read(int msg_no) {
		
		return messageDao.select(msg_no);
	} // end read(msg_no)
	
	@Override
	public List<Message> readSend(PaginationCriteria criteria) {
		
		return messageDao.selectSend(criteria);
	} // end readSend(criteria)
	
	@Override
	public List<Message> readReceive(PaginationCriteria criteria) {
		
		return messageDao.selectReceive(criteria);
	} // end readReceive(criteria)
	
	@Override
	public int getNumOfMessageMemIdRecords() {
		
		return messageDao.getNumOfMessageMemIdRecords();
	} // end getNumOfMessageMemIdRecords();
	
	@Override
	public int getNumOfMessageMemId2Records() {
		
		return messageDao.getNumOfMessageMemId2Records();
	} // end getNumOfMessageRecords()
	
	@Override
	public int delete(int msg_no) {
		
		return messageDao.delete(msg_no);
	} // end delete(msg_no)

} // end class MessageServiceImple
