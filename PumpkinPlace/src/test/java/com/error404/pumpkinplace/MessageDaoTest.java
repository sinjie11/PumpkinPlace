package com.error404.pumpkinplace;

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
//		selectById();
		selectById2();
//		updateTest();
//		deleteTest();
		
	} // end doTest()
	
	private void insertTest() {
		Message message = new Message(0, "admin", "test1", "쪽지 제목 Junit", "쪽지 내용 Uunit", null, null);
		
		int result = messageDao.insert(message);
		
		logger.info("Insert result : {} ", result);
	} // end insertTest()
	
	private void selectById() {
		Message message = new Message(0, "admin", null, null, null, null, false);
		
		logger.info("selectById : {} ", message.getMem_id());
	} // end selectById()
	
	private void selectById2() {
		Message message = new Message(0, null, "test", null, null, null, false);
		
		logger.info("selectById2 : {}", message.getMem_id2());
	} // end selectById2()
	
	
	
	private void updateTest() {
		Message message = new Message(3, null, null, "J 제목변경", "내용변경", null, false);
		
		int result = messageDao.update(message);
		
		logger.info("Update result : {} ", result);
		
	} // end updateTest()

	private void deleteTest() {
		int result = messageDao.delete(3);
		
		logger.info("Delete result = {} ", result);
	} // end deleteTest()
	
} // end class MessageDaoTest
