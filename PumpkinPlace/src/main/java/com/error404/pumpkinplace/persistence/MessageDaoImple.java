package com.error404.pumpkinplace.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
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
	private SqlSession sqlSession;
	
	@Autowired
	private MessageMapper messageMapper;
	
	
	@Override
	public int insert(Message message) {
		
		return messageMapper.insertMessage(message);
	} // end insert(message)
	
	@Override
	public List<Message> selectAllMemId2() {
		
		return messageMapper.selectAllMemId2Message();
	} // end selectAllMemId2()
	
	@Override
	public List<Message> selectAllMemId() {
		
		return messageMapper.selectAllMemIdMessage();
	} // end selectAllMemId()
	
	
	@Override
	public Message select(int msg_no) {
		
		return messageMapper.selectByMsgNo(msg_no);
	} // end select(msg_no)
	
	@Override
	public List<Message> selectSend(PaginationCriteria criteria) {
		
		return sqlSession.selectList(NAMESPACE + ".ListPageMemId2Message", criteria);
	} // end select(criteria)
	
	@Override
	public List<Message> selectReceive(PaginationCriteria criteria) {
	
		return sqlSession.selectList(NAMESPACE + ".ListPageMemIdMessage", criteria);
	} // end selectReceive(criteria)
	
	@Override
	public int getNumOfMessageMemIdRecords() {
		
		return messageMapper.totalCountMemId();
	} // end getNumOfMessageMemIdRecords
	
	@Override
	public int getNumOfMessageMemId2Records() {
		
		return messageMapper.totalCountMemId2();
	} // end getNumOfMessageRecords()
	
	

} // end class MessageDaoImple
