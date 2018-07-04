package com.error404.pumpkinplace.service;

import java.util.List;

import com.error404.pumpkinplace.domain.Member;

public interface MemberService {
	
	int create(Member member); // 회원 가입 서비스
	
	Member read(String mem_id); // 아이디 중복 체크 서비스
	
	Member read(Member member); // 로그인(아이디, 패스워드) 체크  서비스
	
	int update(Member member); // 회원정보 (패스워드, 이메일, 전화번호) 수정 서비스
	
} // end interface MemberService
