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

import com.error404.pumpkinplace.domain.ShowBoard;
import com.error404.pumpkinplace.persistence.ShowBoardDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class ShowBoardDaoTest {

	private static final Logger logger = LoggerFactory.getLogger(ShowBoardDaoTest.class);
	
	@Autowired private ShowBoardDao showboardDao;
	
	@Test
	public void doTest() {
//		insertTest();
//		testSelectAll();
//		testSelectBySbNo();
//		testUpdate();
//		testDelete();
//		testTotalCount();
		testSearch();
	}
	
	private void insertTest() {
		ShowBoard showBoard1 = new ShowBoard(6, "황총민", "밴드 리턴", "우리가 돌아왔다", "서울", 0, "02-234-4732", "서울시 강남구 00클럽", new Date(), "c://image", "c://video", new Date(), new Date());
		
		int result1 = showboardDao.insert(showBoard1);
		
		logger.info("Insert result = {}", result1);
	}
	
	private void testSelectAll() {
		List<ShowBoard> list = showboardDao.select();
		for (ShowBoard sb : list) {
			logger.info("{}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}",
					sb.getSb_no(),
					sb.getSb_nm(), 
					sb.getSb_title(), 
					sb.getSb_content(),
					sb.getSb_city(),
					sb.getSb_price(),
					sb.getSb_tel(),
					sb.getSb_locinfo(),
					sb.getSb_regdate(),
					sb.getSb_img(),
					sb.getSb_video(),
					sb.getSb_startdate(),
					sb.getSb_enddate());
		}
	}
	
	private void testSelectBySbNo() {
		ShowBoard sb = showboardDao.select(2);
		logger.info("{}, {}, {}", sb.getSb_no(), sb.getSb_nm(), sb.getSb_content());
	}
	
	private void testUpdate() {
		ShowBoard sb = new ShowBoard(1, null, "이거는 테스트", "이 공연은 취소되었습니다.", "없음", 0, "없음", "없음", new Date(), "0", "0", new Date(), new Date());
		int result = showboardDao.update(sb);
		logger.info("update result = {}", result);
	}
	
	private void testDelete() {
		int result = showboardDao.delete(4);
		logger.info("delete result = {}", result);
	}
	
	private void testTotalCount() {
		int result = showboardDao.getNumOfShowBoardRecords();
		logger.info("totalCount result = {}", result);
	}
	
	private void testSearch() {
		List<ShowBoard> list = showboardDao.searchShowBoard("5");
		for (ShowBoard sb : list) {
			logger.info("{}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}",
					sb.getSb_no(),
					sb.getSb_nm(), 
					sb.getSb_title(), 
					sb.getSb_content(),
					sb.getSb_city(),
					sb.getSb_price(),
					sb.getSb_tel(),
					sb.getSb_locinfo(),
					sb.getSb_regdate(),
					sb.getSb_img(),
					sb.getSb_video(),
					sb.getSb_startdate(),
					sb.getSb_enddate());
		}
	}
}
