package com.error404.pumpkinplace.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.error404.pumpkinplace.domain.Board;
//import com.error404.pumpkinplace.pageutil.PaginationCriteria;

// 스프링 프레임워크의 콤포넌트(Spring Framework Component)
// 0) @Component
// 1) @Controller
// 2) @Service
// 3) @Repository

// 스프링 프레임워크에게 영속 계층(persistence/repository layer)의
// 콤포넌트(bean)로 관리
@Repository
public class BoardDaoImple implements BoardDao {
	private static final String NAMESPACE =
			"com.error404.pumpkinplace.BoardMapper";
	
	private static final Logger logger =
			LoggerFactory.getLogger(BoardDaoImple.class);
	
	// MyBatis 프레임워크의 SqlSession 객체를 주입(DI)받아서 사용
	@Autowired
	private SqlSession sqlSession; // 다형성
	// SqlSession
	// |__ SqlSessionTemplate

	@Override
	public List<Board> select() {
		logger.info("select() 호출");
		
		return sqlSession.selectList(NAMESPACE + ".selectAll");
	}

	@Override
	public int insert(Board board) {
		logger.info("insert({}, {}, {}) 호출",
				board.getB_title(), board.getB_content(), board.getB_id());
		
		return sqlSession.insert(NAMESPACE + ".insert", board);
	} // end insert()

	@Override
	public Board select(int b_section) {
		logger.info("select({})", b_section);
		
		return sqlSession.selectOne(NAMESPACE + ".selectBoardInfoBySectionNo", b_section);
	} // end select(bno)
	
	@Override
	public int update(Board board) {
		logger.info("update(bno: {}, title: {}, content: {}, date : {}, access count : {])",
				board.getB_no(), board.getB_title(), board.getB_content(), 
				board.getB_regdate(), board.getB_readcnt());
		
		return sqlSession.update(NAMESPACE + ".update", board);
	} // end update()
	
	@Override
	public int delete(int bno) {
		logger.info("delete(bno: {})", bno);
		
		return sqlSession.delete(NAMESPACE + ".delete", bno);
	} // end delete()
	
	@Override
	public List<Board> search(int type, String keyword) {
		logger.info("type: {}, keyword: {}", type, keyword);
		Map<String, Object> args = new HashMap<>();
		args.put("searchType", type);
		args.put("searchKeyword", "%" + keyword + "%");
		List<Board> list =
				sqlSession.selectList(NAMESPACE + ".search", args);
		
		return list;
	} // end search()
	
	@Override
	public int getNumOfRecords() {
		return sqlSession.selectOne(NAMESPACE + ".totalCount");
	} // end getNumOfRecords()
	
//	@Override
//	public List<Board> select(PaginationCriteria criteria) {
//		logger.info("start: {}, end: {}",
//				criteria.getStart(), criteria.getEnd());
//		
//		return sqlSession.selectList(NAMESPACE + ".listPage", criteria);
//	}
	
} // end class BoardDaoImple












