package com.error404.pumpkinplace;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.error404.pumpkinplace.domain.Board;
import com.error404.pumpkinplace.pageutil.PaginationCriteria;
import com.error404.pumpkinplace.persistence.BoardDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
@WebAppConfiguration
public class BoardDaoTest {

	private static final Logger logger = LoggerFactory.getLogger(BoardDaoTest.class);

	@Autowired
	private BoardDao boardDao;

	@Test
	public void doTest() {
		// insertTest();
		// selectByMemid();
		// selectBySectionNoTest();
//		 selectBySectionNo1Test();
		 selectBySectionNo11Test();
//		 selectPrevNo();
	} // end doTest()

	// private void insertTest() {

	// Board board1= new Board(1, 0, "test1234", "테스트 글입니다", "admin", new
	// Date(),"c://image", "c://video", 0, 0, 0);
	// Board board2= new Board(2, 2, "Test", "Content", "admin", new Date(), null,
	// null, 0, 0, 0);
	// Board board3= new Board(1, 3, "Test", "Content", "admin", new Date(), null,
	// null, 0, 0, 0);
	// Board board4= new Board(1, 4, "Test", "Content", "admin", new Date(), null,
	// null, 0, 0, 0);
	// Board board5= new Board(2, 5, "Test", "Content", "admin", new Date(), null,
	// null, 0, 0, 0);
	// Board board6= new Board(3, 6, "Test", "Content", "admin", new Date(), null,
	// null, 0, 0, 0);
	// Board board7= new Board(1, 7, "Test", "Content", "admin", new Date(), null,
	// null, 0, 0, 0);
	// Board board8= new Board(1, 8, "Test", "Content", "admin", new Date(), null,
	// null, 0, 0, 0);
	// Board board9= new Board(4, 9, "Test", "Content", "admin", new Date(), null,
	// null, 0, 0, 0);
	// Board board10= new Board(1, 10, "Test", "Content", "admin", new Date(), null,
	// null, 0, 0, 0);

	// int result1 = boardDao.insert(board1);
	// int result2 = boardDao.insert(board2);
	// int result3 = boardDao.insert(board3);
	// int result4 = boardDao.insert(board4);
	// int result5 = boardDao.insert(board5);
	// int result6 = boardDao.insert(board6);
	// int result7 = boardDao.insert(board7);
	// int result8 = boardDao.insert(board8);
	// int result9 = boardDao.insert(board9);
	// int result10 = boardDao.insert(board10);

	// logger.info("Insert result = {}", result1);
	// logger.info("Insert result = {}", result2);
	// logger.info("Insert result = {}", result3);
	// logger.info("Insert result = {}", result4);
	// logger.info("Insert result = {}", result5);
	// logger.info("Insert result = {}", result6);
	// logger.info("Insert result = {}", result7);
	// logger.info("Insert result = {}", result8);
	// logger.info("Insert result = {}", result9);
	// logger.info("Insert result = {}", result10);
	// } // end intertTest()

	// private void selectByMemid() {
	// Board b = boardDao.select(1);
	// if (b != null) {
	// logger.info("Section No : {}", b.getB_section());
	// } else {
	// logger.info("사용할 수 있는 아이디");
	// }
	// } // selectByMemid()

	private void selectBySectionNoTest() {
		PaginationCriteria criteria = new PaginationCriteria();
		List<Board> list = boardDao.selectBySectionNo(1, criteria);
		for (Board b : list) {
			logger.info("{}, {}, {}, {}, {}", b.getB_no(), b.getB_title(), b.getB_content(), b.getB_regdate(),
					b.getB_readcnt());
		}
	}

	private void selectBySectionNo1Test() {
		List<Board> list = boardDao.selectBySectionNo1();
		for (Board b : list) {
			logger.info("{}, {}, {}, {}", b.getB_no(), b.getB_title(), b.getB_id(), b.getB_regdate());
		}
	}
	
	private void selectBySectionNo11Test() {
		List<Board> list = boardDao.selectBySectionNo11();
		for (Board b : list) {
			logger.info("{}, {}, {}, {}", b.getB_no(), b.getB_title(), b.getB_id(), b.getB_regdate());
		}
	}

	
	////////////////////////////////이전글 번호 받기
	private void selectPrevNo() {
		Board board = new Board(1, 73, null, null, null, null, null, null, 0, 0, 0);
	}



} // end class MemberDaoTest