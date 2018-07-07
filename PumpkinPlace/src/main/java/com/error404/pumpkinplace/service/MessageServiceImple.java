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
	public List<Message> receive(String mem_id2) {
	
		return messageDao.receive(mem_id2);
	} // end receive(mem_id2)
	
	@Override
	public List<Message> sendPage(PaginationCriteria criteria) {
	
		return messageDao.sendPage(criteria);
	} // end sendPage(mem_id, criteria)
	
	@Override
	public List<Message> receivePage(PaginationCriteria criteria) {
		
		return messageDao.receivePage(criteria);
	} // end receivePage(mem_id2, criteria)
	
	@Override
	public int totalCount(String mem_id) {

		return messageDao.totalCount(mem_id);
	} // end totalCount()
	
	@Override
	public int totalCount2(String mem_id2) {
	
		return messageDao.totalCount2(mem_id2);
	} // end totalCount2()
		
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
	public Message read3(int msg_no) {
	
		return messageDao.select3(msg_no);
	} // end read3(msg_no)

	@Override
	public int update(Message message) {
		
		return messageDao.update(message);
	} // end update(message)

	@Override
	public int delete(int msg_no) {
		
		return messageDao.delete(msg_no);
	} // end delete(msg_no)

} // end class MessageServiceImple
