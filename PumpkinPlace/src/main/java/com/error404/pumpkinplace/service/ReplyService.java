package com.error404.pumpkinplace.service;

import java.util.List;

import com.error404.pumpkinplace.domain.Reply;

public interface ReplyService {
	int replyInsert(Reply reply) ;
	List<Reply> selectReplyAll1(int b_no);
	List<Reply> selectReplyAll2(int r_no);
	int updateReply(Reply reply);
	int deleteReply(int r_no);
}
