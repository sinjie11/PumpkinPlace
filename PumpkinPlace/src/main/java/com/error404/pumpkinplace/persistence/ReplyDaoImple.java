package com.error404.pumpkinplace.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.error404.pumpkinplace.domain.Reply;

@Repository
public class ReplyDaoImple implements ReplyDao {
	private static final String NAMESPACE = "com.error404.pumpkinplace.mappers.ReplyMapper";
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int replyInsert(Reply reply) {
		return sqlSession.insert(NAMESPACE+".insert", reply);
	}
	@Override
	public List<Reply> replySelect(int b_no ,int r_section) {
		Map<String, Object> args =  new HashMap<>();
		args.put("b_no", b_no);
		args.put("r_section", r_section);
		return sqlSession.selectList(NAMESPACE+".selectAll", args);
	}
	@Override
	public int replyUpdate(Reply reply) {
		return sqlSession.update(NAMESPACE+".updateReply",reply);
	}
	@Override
	public int replyDelete(int r_no) {
		return sqlSession.delete(NAMESPACE+".deleteReply",r_no);
	}

}
