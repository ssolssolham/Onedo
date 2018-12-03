package com.one.doo.analysis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.one.doo.board.domain.Criteria;
import com.one.doo.member.domain.Auth;
import com.one.doo.member.domain.Member;
import com.one.doo.member.mapper.AuthMapper;
import com.one.doo.member.mapper.MemberMapper;
import com.one.doo.member.validate.MailCertify;
import com.one.doo.metadata.log.domain.Log;
import com.one.doo.metadata.log.mapper.LogMapper;
import com.one.doo.metadata.url.mapper.UrlMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AnalysisServiceImpl implements AnalysisService {
	@Override
	public String[] getVillageList(String selectedDistrict) {
		
		return null;
	}

}
