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
	public List<Message> send(String mem_id) {
	
		return messageDao.send(mem_id);
	} // end send(mem_id)
	
	@Override
	public List<Message> recieve(String mem_id2) {
	
		return messageDao.recieve(mem_id2);
	} // end recieve(mem_id2)
	
	@Override
	public List<Message> sendPage(PaginationCriteria criteria) {
	
		return messageDao.sendPage(criteria);
	} // end sendPage(criteria)
	
	@Override
	public List<Message> recievePage(PaginationCriteria criteria) {
	
		return messageDao.recievePage(criteria);
	} // end recievePage(criteria)
	
	@Override
	public int total() {
		
		return messageDao.total();
	} // end total()
	
	@Override
	public int total2() {
	
		return messageDao.total2();
	} // end total2()
	
	@Override
	public int create(Message message) {
		
		return messageDao.insert(message);
	} // end create(message)

	@Override
	public Message read(String mem_id) {
		
		return messageDao.select(mem_id);
	} // end read(mem_id)
	
	@Override
	public Message read2(String mem_id2) {
		
		return messageDao.select2(mem_id2);
	} // end read2(mem_id2)

	@Override
	public int update(Message message) {
		
		return messageDao.update(message);
	} // end update(message)

	@Override
	public int delete(int msg_no) {
		
		return messageDao.delete(msg_no);
	} // end delete(msg_no)

} // end class MessageServiceImple
