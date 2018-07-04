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
import com.error404.pumpkinplace.pageutil.PaginationCriteria;

@Repository
public class BoardDaoImple implements BoardDao {
	private static final String NAMESPACE = "com.error404.pumpkinplace.mappers.BoardMapper";

	private static final Logger logger = LoggerFactory.getLogger(BoardDaoImple.class);

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Board> select() {
		logger.info("select() 호출");

		return sqlSession.selectList(NAMESPACE + ".selectAll");
	}

	@Override
	public int insert(Board board) {
		logger.info("insert({}, {}, {}, {}, {}) 호출", board.getB_section(), board.getB_no(), board.getB_title(),
				board.getB_content(), board.getB_id());

		return sqlSession.insert(NAMESPACE + ".insert", board);
	}

//	@Override
//	public Board select(int b_section) {
//		logger.info("select({})", b_section);
//
//		return sqlSession.selectOne(NAMESPACE + ".selectBoardInfoBySectionNo", b_section);
//	}

	@Override
	public Board selectByBno(int b_no) {
		logger.info("select({})", b_no);

		return sqlSession.selectOne(NAMESPACE + ".selectByBno", b_no);
	}

	@Override
	public int update(Board board) {
		logger.info("update(bno: {}, title: {}, content: {}, date : {}, access count : {])", board.getB_no(),
				board.getB_title(), board.getB_content(), board.getB_regdate(), board.getB_readcnt());

		return sqlSession.update(NAMESPACE + ".update", board);
	}

	@Override
	public int delete(int b_no) {
		logger.info("delete(b_no: {})", b_no);

		return sqlSession.delete(NAMESPACE + ".delete", b_no);
	}

	@Override
	public List<Board> search(int type, String keyword) {
		logger.info("type: {}, keyword: {}", type, keyword);
		Map<String, Object> args = new HashMap<>();
		args.put("searchType", type);
		args.put("searchKeyword", "%" + keyword + "%");
		List<Board> list = sqlSession.selectList(NAMESPACE + ".search", args);

		return list;
	}

	@Override
	public List<Board> selectBySectionNo(int sectionNo) {
		logger.info("selectBySectionNo() 호출");
		return sqlSession.selectList(NAMESPACE + ".selectBySectionNo");
	}

	// ************* 페이지 처리 관련 Overridden Method *************

	@Override
	public int getNumOfRecords() {
		return sqlSession.selectOne(NAMESPACE + ".totalCount");
	}

	@Override
	public List<Board> select(PaginationCriteria criteria) {
		logger.info("start: {}, end: {}", criteria.getStart(), criteria.getEnd());

		return sqlSession.selectList(NAMESPACE + ".listPage", criteria);
	}
	
	//보드 디테일 
	@Override
	public Board boardSelect(int bno) {//보드샐랙트
		
		return sqlSession.selectOne(NAMESPACE + ".boardSelect", bno);
	}

	@Override
	public int pulsReadcnt(int bno) {//조회수 1+
		System.out.println("씨발 조회수 +1");
		Map<String, Object> args =  new HashMap<>();
		args.put("type", 1);
		args.put("b_no" ,bno);
		return sqlSession.update(NAMESPACE + ".puls1",args);
	}

	@Override
	public int pulsUp(int bno) {//조아요 1+
		Map<String, Object> args =  new HashMap<>();
		args.put("type", 2);
		args.put("b_no" ,bno);
		return sqlSession.update(NAMESPACE + ".puls1",args);
	}

	@Override
	public int pulsDown(int bno) {//비추 +1
		Map<String, Object> args =  new HashMap<>();
		args.put("type", 3);
		args.put("b_no" ,bno);
		return sqlSession.update(NAMESPACE + ".puls1",args);
	}
	
	

}
