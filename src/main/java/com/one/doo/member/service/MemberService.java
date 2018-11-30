package com.one.doo.member.service;

import org.springframework.stereotype.Service;

import com.one.doo.member.domain.Member;

/**
 * 멤버관련 비즈니스로직을 처리하기위한 서비스객체
 * @author SiwonPark
 */
@Service
public interface MemberService {
	public void regist(Member member);
	
	public int idcheck(String userid);
}
