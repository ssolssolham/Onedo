package com.one.doo.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.one.doo.auth.domain.Auth;
import com.one.doo.auth.mapper.AuthMapper;
import com.one.doo.article.domain.Criteria;
import com.one.doo.member.domain.Member;
import com.one.doo.member.mapper.MemberMapper;
import com.one.doo.member.validate.MailCertify;
import com.one.doo.metadata.log.mapper.LogMapper;
import com.one.doo.metadata.url.mapper.UrlMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberMapper memberMapper;
	@Inject
	private AuthMapper authMapper; // 회원가입시 인증정보추가 트랜잭션처리+
	@Inject
	private PasswordEncoder pwencoder;
	@Inject
	private MailCertify mail;
	// 로그 등록을 위한 Mapper
	@Inject
	private LogMapper logMapper;
	@Inject
	private UrlMapper urlMapper;
	
	@Transactional
	@Override
	public void regist(Member member) {
		String userpw = pwencoder.encode(member.getUserpw());
		member.setUserpw(userpw);
		
		Auth auth = new Auth();
		auth.setUserid(member.getUserid());
		auth.setAuth("ROLE_USER");
		
		memberMapper.insert(member);
		authMapper.insert(auth);
	}

	@Override
	public int idcheck(String userid) {
		return memberMapper.idcheck(userid);
	}

	@Override
	public String sendMailCertify(String mail) {
		log.info("서비스 "+mail);
		String code = this.mail.sendMail(mail);
		log.info("메일보내기작업하고온 멤버서비스"+code);
		return code;
	}

	public List<Member> getList() {
		return memberMapper.getList();
	}

	@Override
	public List<Member> getListWithCri(Criteria cri) {
		return memberMapper.getListWithCri(cri);
	}

	@Override // (권한-유저)수
	public int getTotalCount() {
		return memberMapper.getTotalCount();
	}
	
	@Override  //회원의 수
	public int getMemCnt() {
		return memberMapper.getMemCnt();
	}
	
	@Override
	public int getUrlNo(String url,String method) {
		return urlMapper.readUrlNo(url, method);
	}
	
	@Override
	public int countTodayLog(int url_no,String log_day) {
		return logMapper.countTodayLog(url_no, log_day);
	}
	
	@Override
	public void makeLoginLog(int url_no,String log_day) {
		logMapper.insert(url_no, log_day);
	}

	@Override
	public int sumUpLoginLog(int url_no, String log_day) {
		return logMapper.update(url_no, log_day);
	}

	@Override  //회원이름수정
	public void modifyName(String userid, String username) {
		memberMapper.updateName(username, userid);
	}

	@Transactional
	@Override  // 회원권한삭제(강제탈퇴)
	public void updateEnabled(String userid) {
		// member의 enabled를 N으로 변경
		// member가 갖고있던 모든권한을 delete
		memberMapper.updateEnabled(userid);
		authMapper.deleteAuth(userid);
	}

	@Override  // 회원권한부여
	public void grantAuth(String userid, String role) {
		Auth auth = new Auth(userid, role);
		authMapper.insert(auth);
	}

}
