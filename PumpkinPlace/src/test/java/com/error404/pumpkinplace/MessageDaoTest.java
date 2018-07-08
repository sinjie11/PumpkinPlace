package com.error404.pumpkinplace;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.error404.pumpkinplace.domain.Message;
import com.error404.pumpkinplace.persistence.MessageDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
@WebAppConfiguration
public class MessageDaoTest {
	
	private static final Logger logger = LoggerFactory.getLogger(MessageDaoTest.class);
	
	@Autowired
	private MessageDao messageDao;
	
	@Test
	public void doTest() {
//		insertTest();
//		selectByMemIdTest();
		selectByMsgNo();
		
	} // end doTest()
	
	private void insertTest() {
		Message message = new Message(0, "admin1", "test", "테스트 내용", null, 0);
		
		int result = messageDao.insert(message);
		
		logger.info("Insert result : {} ", result);
	} // end insertTest()
	
	private void selectByMemIdTest() {
		List<Message> list = messageDao.selectAllMemId2();
		
		for (int i = 0; i < list.size(); i++) {
		logger.info("list : ({}, {}, {}, {}, {})", list.get(i).getMsg_no(), 
				list.get(i).getMem_id(), list.get(i).getMem_id2(), 
				list.get(i).getMsg_content(), list.get(i).getMsg_regdate());
		}
		
	} // end selectTest()
	
	private void selectByMsgNo() {		
		Message message = messageDao.select(32);
		
		logger.info("selectByMsgNo = ({}, {}, {}, {}, {})", 
				message.getMsg_no(), message.getMem_id(), 
				message.getMem_id2(), message.getMsg_content(), 
				message.getMsg_regdate(), message.getMsg_confirm());

	} // end selectByMsgNoMem()

	
	
} // end class MessageDaoTest
