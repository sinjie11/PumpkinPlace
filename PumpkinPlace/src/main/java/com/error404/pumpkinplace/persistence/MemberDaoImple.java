package com.error404.pumpkinplace.persistence;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.error404.pumpkinplace.domain.Member;
import com.error404.pumpkinplace.mappers.MemberMapper;

@Repository
public class MemberDaoImple implements MemberDao {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberDaoImple.class);
	
	private static final String NAMESPACE = "com.error404.pumpkinplace.mappers.MemberMapper";
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public int insert(Member member) { // 회원 가입
		logger.info("insert({}, {}, {}, {})",
				member.getMem_id(), member.getMem_pwd(), member.getMem_email(), member.getMem_tel());
		
		return memberMapper.insertMember(member);
	} // end insert(member)

	@Override
	public Member select(String mem_id) { // 아이디 중복 검사
		logger.info("select(mem_id : {})", mem_id);
		
		return memberMapper.checkMemid(mem_id);
	} // end select(mem_id)

	@Override
	public Member select(Member member) { // 아이디, 비밀번호 일치 여부 (로그인)
		logger.info("select(mem_id : {}, mem_pwd : {}", member.getMem_id(), member.getMem_pwd());
				
		return memberMapper.login(member);
	} // end select(member)

} // end class MemberDaoImple
