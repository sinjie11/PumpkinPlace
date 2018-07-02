package com.error404.pumpkinplace.mappers;

import com.error404.pumpkinplace.domain.Member;

public interface MemberMapper {
	
	// com.error404.pumpkinplace.mappers.MemberMapper.~
	int insertMember(Member member);
	
	Member checkMemid(String mem_id);
	
	Member login(Member member);
	
	int update(Member member);

	
} // end interface MemberMapper
