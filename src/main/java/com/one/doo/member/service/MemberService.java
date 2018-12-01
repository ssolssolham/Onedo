package com.one.doo.member.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.one.doo.board.domain.Criteria;
import com.one.doo.member.domain.Member;

/**
 * 멤버관련 비즈니스로직을 처리하기위한 서비스객체
 * @author SiwonPark
 */
@Service
public interface MemberService {
	
	// 회원 전체목록 조회
	public List<Member> getList();
	
	// 페이지별 회원 조회
	public List<Member> getListWithCri(Criteria cri);
	
	public void regist(Member member);
	
	public int idcheck(String userid);
	
	public int getTotalCount();
}
