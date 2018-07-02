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
		selectById();
		
	} // end doTest()
	
	private void insertTest() {
		Message message = new Message(0, "admin", "test1", "쪽지 제목 Junit", "쪽지 내용 Uunit", null, null);
		
		int result = messageDao.insert(message);
		
		logger.info("Insert result : {} ", result);
	} // end insertTest()
	
	private void selectById() {
		Boolean test = false;
		Message message = messageDao.select("admin", false);
		
		logger.info("selectById : {} ", message.getMem_id());
	} // end selectById()

} // end class MessageDaoTest
