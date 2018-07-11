package com.error404.pumpkinplace.persistence;

import java.util.List;

import com.error404.pumpkinplace.domain.Reply;

public interface ReplyDao {
	int replyInsert(Reply reply);
	List<Reply> replySelect(int b_no ,int r_section); 
	int replyUpdate(Reply reply);
	int replyDelete(int r_no);
}
