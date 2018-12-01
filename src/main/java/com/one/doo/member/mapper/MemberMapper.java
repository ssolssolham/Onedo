package com.one.doo.member.mapper;

import java.util.List;

import com.one.doo.board.domain.Criteria;
import com.one.doo.member.domain.Member;

public interface MemberMapper {
	
	public Member read(String userid);	
	
	public void insert(Member member);
	
	public int idcheck(String userid);
	
	public List<Member> getList();
	
	public List<Member> getListWithCri(Criteria cri);
	
	public int getTotalCount();
	
}
