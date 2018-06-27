package com.error404.pumpkinplace.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.error404.pumpkinplace.domain.ShowBoard;
import com.error404.pumpkinplace.mappers.ShowBoardMapper;
import com.error404.pumpkinplace.pageutil.PaginationCriteria;

@Repository
public class ShowBoardDaoImple implements ShowBoardDao {
	private static final String NAMESPACE = "com.error404.pumpkinplace.mappers.ShowBoardMapper";
	
	private static final Logger logger = LoggerFactory.getLogger(ShowBoardDaoImple.class);
	
	@Autowired private SqlSession sqlSession;
	@Autowired private ShowBoardMapper showBoardMapper;
	
	@Override
	public int insert(ShowBoard showBoard) {
		logger.info("insert({}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}) 호출", 
				showBoard.getSb_no(),
				showBoard.getSb_nm(), 
				showBoard.getSb_title(), 
				showBoard.getSb_content(),
				showBoard.getSb_city(),
				showBoard.getSb_price(),
				showBoard.getSb_tel(),
				showBoard.getSb_locinfo(),
				showBoard.getSb_regdate(),
				showBoard.getSb_img(),
				showBoard.getSb_video(),
				showBoard.getSb_startdate(),
				showBoard.getSb_enddate());
		return showBoardMapper.insertShowBoard(showBoard);
	}
	
	@Override
	public List<ShowBoard> select() {
		logger.info("select() 호출");
		
		return sqlSession.selectList(NAMESPACE + ".selectAllShowBoard");
	}

	@Override
	public ShowBoard select(int sb_no) {
		logger.info("select({})", sb_no);
		return showBoardMapper.selectBySbNo(sb_no);
	}

	@Override
	public int update(ShowBoard showBoard) {
		logger.info("update(sb_no: {}, sb_title; {}, sb_content: {}, sb_city: {}, sb_price: {}, sb_tel: {}, sb_locinfo: {}, sb_regdate: {}, sb_img: {}, sb_vide: {}, sb_startdate: {}, sb_enddate: {})",
				showBoard.getSb_no(),
				showBoard.getSb_title(), 
				showBoard.getSb_content(),	
				showBoard.getSb_city(),	
				showBoard.getSb_price(), 
				showBoard.getSb_tel(),	
				showBoard.getSb_locinfo(),	
				showBoard.getSb_regdate(), 
				showBoard.getSb_img(), 
				showBoard.getSb_video(),	
				showBoard.getSb_startdate(), 
				showBoard.getSb_enddate());
		return showBoardMapper.updateShowBoard(showBoard);
	}

	@Override
	public int delete(int sb_no) {
		logger.info("delete(sb_no: {})", sb_no);
		return showBoardMapper.deleteShowBoard(sb_no);
	}

	@Override
	public int getNumOfShowBoardRecords() {

		return showBoardMapper.totalCountShowBoard();
	}

	@Override
	public List<ShowBoard> select(PaginationCriteria criteria) {
		logger.info("start: {}, end: {}",
				criteria.getStart(), criteria.getEnd());
		return sqlSession.selectList(NAMESPACE + ".listShowBoardPage", criteria);
	}
	
	@Override
	public List<ShowBoard> searchShowBoard(String keyword) {
		logger.info("keyword: {}", keyword);
		Map<String, Object> args = new HashMap<>();
		args.put("searchKeyWord", "%" + keyword + "%");
		
		List<ShowBoard> list = sqlSession.selectList(NAMESPACE + ".searchShowBoard", args);
		
		return list;
	}

	

}
