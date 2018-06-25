package com.error404.pumpkinplace;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.error404.pumpkinplace.domain.Member;
import com.error404.pumpkinplace.persistence.MemberDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
@WebAppConfiguration
public class MemberDaoTest {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberDaoTest.class);
	
	@Autowired
	private MemberDao memberDao;
	
	@Test
	public void doTest() {
		insertTest();
//		selectByMemid();
	} // end doTest()
	
	private void insertTest() {
		Member member = new Member(0, "test", "test1234", "test1@naver.com", "010-9116-5281", null);
		int result = memberDao.insert(member);
		
		logger.info("Insert result = {}", result);
	} // end intertTest()
	
	private void selectByMemid() {
		Member m = memberDao.select("admin");
		if (m != null) {
			logger.info("userid: {}, pwd: {}", 
					m.getMem_id(), m.getMem_pwd());
		} else {
			logger.info("사용할 수 있는 아이디");
		}
	} // selectByMemid()
	
	
} // end class MemberDaoTest
