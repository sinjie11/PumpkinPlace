package com.error404.pumpkinplace.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.error404.pumpkinplace.domain.Member;

@Service
public class MemberManageServiceImple {
private static final Logger logger = LoggerFactory.getLogger(MemberManageServiceImple.class);
	
	public Member read(String mem_id) {
		logger.info("mem_id: {}", mem_id);
		
		logger.info("비즈니스 로직을 처리중임..");
		Member m = new Member(0, "test11", "test11234", "test11@naver.com", "02-111-2222", null);
		
		logger.info("Member(mem_id: {}, mem_pwd: {}, mem_email: {}, mem_tel: {}",
				m.getMem_id(), m.getMem_pwd(), m.getMem_email(), m.getMem_tel());
		return m;
	} // end read(userid)
	
	
} // end class MemberManageServiceImple
