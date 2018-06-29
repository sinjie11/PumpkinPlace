package com.error404.pumpkinplace.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.error404.pumpkinplace.domain.Message;
import com.error404.pumpkinplace.persistence.MessageDao;

@Service
public class MessageServiceImple implements MessageService {

	@Autowired
	private MessageDao messageDao;
	
	@Override
	public int create(Message msg) {
		
		return messageDao.insert(msg);
	} // end create()

	@Override
	public Message read(String mem_id) {
		
		return messageDao.select(mem_id);
	} // end read()

	@Override
	public int update(Message msg) {
		
		return messageDao.update(msg);
	} // end update()

	@Override
	public int delete(String msg_no) {
		
		return messageDao.delete(msg_no);
	} // end delete()

} // end class MessageServiceImple
