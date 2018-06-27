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
	public void doTest() { // 테스트 메소드 실행 부분
//		insertTest();
//		selectByMemid();
//		loginTest();
		updateTest();
	} // end doTest()
	
	private void insertTest() { // 회원 추가 테스트
		Member member = new Member(0, "test", "test1234", "test1@naver.com", "010-9116-5281", null);
		int result = memberDao.insert(member);
		
		logger.info("Insert result = {}", result);
	} // end intertTest()
	
	private void selectByMemid() { // 아이디 중복 검색 테스트
		Member m = memberDao.select("test");
		if (m != null) {
			logger.info("mem_id: {}, mem_pwd: {}", 
					m.getMem_id(), m.getMem_pwd());
		} else {
			logger.info("사용할 수 있는 아이디");
		}
	} // selectByMemid()
	

	private void loginTest() { // 로그인(아이디, 패스워드) 중복 검색 테스트
		Member m = new Member(0, "admin", "admin", null, null, null);
		Member loginResult = memberDao.select(m);
		if (loginResult != null) {
			logger.info("로그인 성공");
		} else {
			logger.info("로그인 실패");
		}
	} // end loginTest()
	
	private void updateTest() { // 회원정보(패스워드, 이메일, 전화번호) 수정 테스트
		Member m = new Member(0, "test", "1111", "king@lycos.co.kr", "02-2331-1111", null);
		int result = memberDao.update(m);
		
		logger.info("Update result = {}", result);		
	} // end updateTest()
	
} // end class MemberDaoTest
