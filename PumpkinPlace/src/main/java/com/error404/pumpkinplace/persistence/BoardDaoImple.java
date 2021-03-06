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

	// @Override
	// public Board select(int b_section) {
	// logger.info("select({})", b_section);
	//
	// return sqlSession.selectOne(NAMESPACE + ".selectBoardInfoBySectionNo",
	// b_section);
	// }

	@Override
	public Board selectByBno(int b_no) {
		logger.info("select({})", b_no);

		return sqlSession.selectOne(NAMESPACE + ".selectByBno", b_no);
	}

	@Override
	public int update(Board board) {
		return sqlSession.update(NAMESPACE + ".update", board);
	}

	@Override
	public int delete(int b_no) {
		return sqlSession.delete(NAMESPACE + ".delete", b_no);
	}
	
	@Override
	public List<Board> search(int type, String keyword, int sectionNo, PaginationCriteria criteria) {
		logger.info("type: {}, keyword: {}", type, keyword);
		Map<String, Object> args = new HashMap<>();
		args.put("searchType", type);
		args.put("searchKeyword", keyword);
		args.put("b_section", sectionNo);
		args.put("start", criteria.getStart());
		args.put("end", criteria.getEnd());		
		return sqlSession.selectList(NAMESPACE + ".searchWithSectionNo", args);
	}
	
	@Override
	public List<Board> searchSectionNo11(int type, String keyword, PaginationCriteria criteria) {
		logger.info("searchWithSectionNo11() 호출");
		Map<String, Object> args = new HashMap<>();
		args.put("searchType", type);
		args.put("searchKeyword",keyword);
		args.put("start", criteria.getStart());
		args.put("end", criteria.getEnd());		
		return sqlSession.selectList(NAMESPACE + ".searchWithSectionNo11", args);
	}
	
	@Override
	public List<Board> searchSectionNo12(int type, String keyword, PaginationCriteria criteria) {
		logger.info("searchWithSectionNo12() 호출");
		Map<String, Object> args = new HashMap<>();
		args.put("searchType", type);
		args.put("searchKeyword", keyword);
		args.put("start", criteria.getStart());
		args.put("end", criteria.getEnd());		
		return sqlSession.selectList(NAMESPACE + ".searchWithSectionNo12", args);
	}

	@Override
	public List<Board> selectBySectionNo(int sectionNo, PaginationCriteria criteria) {
		logger.info("selectBySectionNo() 호출");
		Map<String, Object> args = new HashMap<>();
		args.put("b_section", sectionNo);
		args.put("start", criteria.getStart());
		args.put("end", criteria.getEnd());
		return sqlSession.selectList(NAMESPACE + ".selectBySectionNo", args);
	}

	@Override
	public List<Board> selectAllBySectionNo11(PaginationCriteria criteria) {
		logger.info("selectAllBySectionNo11 호출");
		return sqlSession.selectList(NAMESPACE + ".selectAllBySectionNo11", criteria);
	}

	@Override
	public List<Board> selectAllBySectionNo12(PaginationCriteria criteria) {
		logger.info("selectAllBySectionNo12 호출");
		return sqlSession.selectList(NAMESPACE + ".selectAllBySectionNo12", criteria);
	}

	@Override
	public List<Board> selectBySectionNo1() {
		logger.info("selectBySectionNo1 호출");
		return sqlSession.selectList(NAMESPACE + ".selectBySectionNo1");
	}

	@Override
	public List<Board> selectBySectionNo11() {
		logger.info("selectBySectionNo11 호출");
		return sqlSession.selectList(NAMESPACE + ".selectBySectionNo11");
	}

	@Override
	public List<Board> selectBySectionNo12() {
		logger.info("selectBySectionNo12 호출");
		return sqlSession.selectList(NAMESPACE + ".selectBySectionNo12");
	}

	// ************* 페이지 처리 관련 Overridden Method *************

	@Override
	public int getNumOfRecords(int sectionNo) {
		if (sectionNo == 1 || sectionNo == 2 || sectionNo == 3 || sectionNo == 4 || sectionNo == 5 || sectionNo == 6
				|| sectionNo == 7 || sectionNo == 8 || sectionNo == 9 || sectionNo == 10 || sectionNo == 20)
			return sqlSession.selectOne(NAMESPACE + ".totalCount", sectionNo);
		else if (sectionNo == 11)
			return sqlSession.selectOne(NAMESPACE + ".countTotalSectionNo11", sectionNo);
		else 
			return sqlSession.selectOne(NAMESPACE + ".countTotalSectionNo12", sectionNo);
	}
	
	@Override
	public int getNumOfSearchRecords(int type, String keyword, int sectionNo) {
		if (sectionNo == 1 || sectionNo == 2 || sectionNo == 3 || sectionNo == 4 || sectionNo == 5 || sectionNo == 6
				|| sectionNo == 7 || sectionNo == 8 || sectionNo == 9 || sectionNo == 10 || sectionNo == 20) {
			Map<String, Object> args = new HashMap<>();
			args.put("b_section", sectionNo);
			args.put("searchType", type);
			args.put("searchKeyword", keyword);
			return sqlSession.selectOne(NAMESPACE + ".countTotalSearch", args);
		}
		else if(sectionNo == 11) {
			Map<String, Object> args = new HashMap<>();
			args.put("searchType", type);
			args.put("searchKeyword", keyword);
			return sqlSession.selectOne(NAMESPACE + ".countTotalSearch11", args);
		}
		else {
			Map<String, Object> args = new HashMap<>();
			args.put("searchType", type);
			args.put("searchKeyword", keyword);
			return sqlSession.selectOne(NAMESPACE + ".countTotalSearch12", args);
		}
		
	}

	@Override
	public List<Board> select(PaginationCriteria criteria) {
		logger.info("start: {}, end: {}", criteria.getStart(), criteria.getEnd());

		return sqlSession.selectList(NAMESPACE + ".listPage", criteria);
	}

	// ******************************************************************

	// 보드 디테일
	@Override
	public Board boardSelect(int bno) {// 보드샐랙트

		return sqlSession.selectOne(NAMESPACE + ".boardSelect", bno);
	}

	@Override
	public int pulsReadcnt(int bno) {// 조회수 1+
		System.out.println("씨발 조회수 +1");
		Map<String, Object> args = new HashMap<>();
		args.put("type", 1);
		args.put("b_no", bno);
		return sqlSession.update(NAMESPACE + ".puls1", args);
	}

	@Override
	public int pulsUp(int bno) {// 조아요 1+
		Map<String, Object> args = new HashMap<>();
		args.put("type", 2);
		args.put("b_no", bno);
		return sqlSession.update(NAMESPACE + ".puls1", args);
	}

	@Override
	public int pulsDown(int bno) {// 비추 +1
		Map<String, Object> args = new HashMap<>();
		args.put("type", 3);
		args.put("b_no", bno);
		return sqlSession.update(NAMESPACE + ".puls1", args);
	}

	@Override
	public Board getUpDown(int bno) {
		return sqlSession.selectOne(NAMESPACE + ".getUpDown", bno);
	}




	@Override
	public int prevBoardNo(Board board) {
		return sqlSession.selectOne(NAMESPACE + ".boardPrevNo", board);
	}

	@Override
	public int nextBoardNo(Board board) {
		return sqlSession.selectOne(NAMESPACE + ".boardNextNo", board);
	}
	
	@Override
	public int checkSectionNoByBno(int bno) {
		return sqlSession.selectOne(NAMESPACE + ".checkSectionNoByBno", bno);
	}

}
