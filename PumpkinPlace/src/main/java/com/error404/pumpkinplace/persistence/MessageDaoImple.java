package com.error404.pumpkinplace.persistence;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.error404.pumpkinplace.domain.Message;
import com.error404.pumpkinplace.mappers.MessageMapper;

@Repository
public class MessageDaoImple implements MessageDao {
	
	private static final Logger logger = LoggerFactory.getLogger(MessageDaoImple.class);
	
	private static final String NAMESPACE = "com.error404.pumpkinplace.mappers.MessageMapper";
	
	@Autowired
	private MessageMapper messageMapper;
	

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
	public int update(Message message) {
		
		return messageMapper.update(message);
	} // end update(message)

	@Override
	public int delete(int msg_no) {
		
		return messageMapper.delete(msg_no);
	} // end delete(msg_no)

} // end class MessageDaoImple
