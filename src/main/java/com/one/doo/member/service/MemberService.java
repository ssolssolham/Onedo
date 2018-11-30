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
	
	// 아이디중복체크
	public int idcheck(String userid);
	
	// 이메일인증
	public String sendMailCertify(String mail);
}
