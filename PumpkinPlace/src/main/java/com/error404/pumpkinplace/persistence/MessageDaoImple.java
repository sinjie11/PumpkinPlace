package com.error404.pumpkinplace.persistence;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.error404.pumpkinplace.domain.Message;
import com.error404.pumpkinplace.mappers.MessageMapper;
import com.error404.pumpkinplace.pageutil.PaginationCriteria;

@Repository
public class MessageDaoImple implements MessageDao {
	
	private static final Logger logger = LoggerFactory.getLogger(MessageDaoImple.class);
	
	private static final String NAMESPACE = "com.error404.pumpkinplace.mappers.MessageMapper";
	
	@Autowired
	private MessageMapper messageMapper;
	
	
	@Override
	public List<Message> send(String mem_id) {
		
		return messageMapper.send(mem_id);
	} // end send(mem_id)
	
	@Override
	public List<Message> recieve(String mem_id2) {
		
		return messageMapper.recieve(mem_id2);
	} // end recieve(mem_id2)
	
	@Override
	public List<Message> sendPage(PaginationCriteria criteria, String mem_id) {
		
		return messageMapper.sendPage(criteria, mem_id);
	}
	
	@Override
	public List<Message> recievePage(PaginationCriteria criteria) {
	
		return messageMapper.recievePage(criteria);
	}
	
	@Override
	public int totalCount(String mem_id) {
	
		return messageMapper.totalCount(mem_id);
	}
	
	@Override
	public int totalCount2() {
	
		return messageMapper.totalCount2();
	}
	
	@Override
	public int insert(Message message) {
	
		return messageMapper.insertMessage(message);
	} // end insert(message)

	@Override
	public Message select(String mem_id) {
	
		return messageMapper.selectById(mem_id);
	} // end select(mem_id)
	
	@Override
	public Message select2(String mem_id2) {
		
		return messageMapper.selectById2(mem_id2);
	} // end select2(mem_id2)

	@Override
	public Message select3(int msg_no) {
	
		return messageMapper.selectByMsgNo(msg_no);
	} // end select3(msg_no)
	
	@Override
	public int update(Message message) {
		
		return messageMapper.update(message);
	} // end update(message)

	@Override
	public int delete(int msg_no) {
		
		return messageMapper.delete(msg_no);
	} // end delete(msg_no)

} // end class MessageDaoImple
