package com.one.doo.member.mapper;

import com.one.doo.member.domain.Member;

public interface MemberMapper {
	
	public Member read(String userid);	
	
	public void insert(Member member);
	
	public int idcheck(String userid);
}
