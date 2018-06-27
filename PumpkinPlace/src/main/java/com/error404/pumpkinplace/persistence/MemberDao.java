package com.error404.pumpkinplace.persistence;

import com.error404.pumpkinplace.domain.Member;

public interface MemberDao {
	
	int insert(Member member); // 회원 추가
	
	Member select(String mem_id); // 아이디 중복 체크
	
	Member select(Member member); // 로그인(아이디, 패스워드) 체크
	
	int update(Member member); // 회원정보(패스워드, 이메일, 전화번호) 수정
	
} // end interface MemberDao
