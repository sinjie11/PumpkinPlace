package com.error404.pumpkinplace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.error404.pumpkinplace.domain.Reply;
import com.error404.pumpkinplace.persistence.ReplyDaoImple;

@Service
public class ReplyServiceImple implements ReplyService {
	@Autowired
	private ReplyDaoImple replyDaoImple;
	@Override
	public int replyInsert(Reply reply) {
		return replyDaoImple.replyInsert(reply);
	}
	@Override
	public List<Reply> selectReplyAll1(int b_no) {
		return replyDaoImple.replySelect(b_no, 1);
	}
	@Override
	public List<Reply> selectReplyAll2(int r_no) {
		return replyDaoImple.replySelect(r_no, 2);
	}
	@Override
	public int updateReply(Reply reply) {
		return replyDaoImple.replyUpdate(reply);
	}
	@Override
	public int deleteReply(int r_no) {
		return replyDaoImple.replyDelete(r_no);
	}


}
