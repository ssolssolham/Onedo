package com.one.doo.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.one.doo.board.domain.Criteria;
import com.one.doo.member.domain.Auth;
import com.one.doo.member.domain.Member;
import com.one.doo.member.mapper.AuthMapper;
import com.one.doo.member.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberMapper memberMapper;
	@Inject
	private AuthMapper authMapper;
	@Inject
	private PasswordEncoder pwencoder;
	
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
	public List<Member> getList() {
		return memberMapper.getList();
	}

	@Override
	public List<Member> getListWithCri(Criteria cri) {
		return memberMapper.getListWithCri(cri);
	}

	@Override
	public int getTotalCount() {
		return memberMapper.getTotalCount();
	}
	
	

}
