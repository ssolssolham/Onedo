package com.one.doo.member.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.one.doo.article.domain.Criteria;
import com.one.doo.member.domain.Member;
import com.one.doo.metadata.log.domain.Log;

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
	
	// 아이디중복체크
	public int idcheck(String userid);
	
	// 이메일인증
	public String sendMailCertify(String mail);
	
	// (인증-회원)수
	public int getTotalCount();
	
	// 회원수
	public int getMemCnt();
	
	// 회원이름수정
	public void modifyName(String userid, String username);
	
	// 회원탈퇴
	public void updateEnabled(String userid);
	
	// 권한부여
	public void grantAuth(String userid, String role);
	
	public int getUrlNo(String url,String method);
	
	public int countTodayLog(int url_no,String log_day);
	
	public void makeLoginLog(int url_no,String log_day);
	
	public int sumUpLoginLog(int url_no,String log_day);
}
