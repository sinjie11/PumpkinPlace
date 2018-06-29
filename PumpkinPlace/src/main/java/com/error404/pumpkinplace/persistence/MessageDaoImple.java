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
	public int insert(Message msg) {

		return messageMapper.insertMessage(msg);
	} // end insert(msg)

	@Override
	public Message select(String mem_id) {

		return messageMapper.selectMessage(mem_id);
	} // end select(mem_id)

	@Override
	public int update(Message msg) {

		return messageMapper.update(msg);
	} // end update(msg)

	@Override
	public int delete(String msg_no) {
		
		return messageMapper.delete(msg_no);
	} // end delete(msg_no_

} // end class MessageDaoImple
