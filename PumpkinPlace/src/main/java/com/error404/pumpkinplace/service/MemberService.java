package com.error404.pumpkinplace.service;

import com.error404.pumpkinplace.domain.Member;

public interface MemberService {

	int create(Member member); // 회원 가입 서비스
	
	Member read(String mem_id); // 아이디 중복 체크 서비스
	
	Member read(Member member); // 로그인(아이디, 패스워드) 체크  서비스
	
} // end interface MemberService
