package com.error404.pumpkinplace.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.error404.pumpkinplace.domain.Member;
import com.error404.pumpkinplace.persistence.MemberDao;

@Service
public class MemberServiceImple implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Override
	public int create(Member member) {
		
		return memberDao.insert(member);
	} // end create(member)

	@Override
	public Member read(String mem_id) {
		
		return memberDao.select(mem_id);
	} // end read(mem_id)
	
	@Override
	public Member read(Member member) {
	
		return memberDao.select(member);
	} // end read(member)
	
	@Override
	public int update(Member member) {
		
		return memberDao.update(member);
	} // end update(member)
	
	
} // class end MemberServiceImple
