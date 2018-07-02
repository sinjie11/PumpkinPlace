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
	public int create(Message message) {
		
		return messageDao.insert(message);
	} // end create(message)

	@Override
	public Message read(String mem_id, Boolean msg_confirm) {
		
		return messageDao.select(mem_id, msg_confirm);
	} // end read(mem_id)

	@Override
	public int update(Message message) {
		
		return messageDao.update(message);
	} // end update(message)

	@Override
	public int delete(int msg_no) {
		
		return messageDao.delete(msg_no);
	} // end delete(msg_no)

} // end class MessageServiceImple
