package com.one.doo.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.one.doo.article.domain.Criteria;
import com.one.doo.article.domain.Reply;
import com.one.doo.article.mapper.ReplyMapper;
import com.one.doo.member.domain.Member;
import com.one.doo.member.mapper.MemberMapper;
import com.one.doo.member.service.MemberService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/spring-security.xml"})
@Log4j
public class MemTest {
	
	@Inject
	private MemberMapper mapper;
	
	@Inject
	private MemberService service;
	
	@Test
	public void testMapper() {
		int cnt = mapper.getTotalCount();
		log.info("총 회원수: "+cnt);
		/*		
		Criteria cri = new Criteria(1, 3);
		List<Member> list = mapper.getListWithCri(cri);
		for (Member member : list) {
			log.info(member+"\n");
		}
	
		mapper.updateName("수정", "SD");
		log.info("바뀐이름: "+mapper.read("SD"));
*/	
	}
	
	//@Test
	public void serviceTest() {
		int cnt = service.getTotalCount();
		log.info("총 인원수: "+cnt);
		
		List<Member> list = service.getList();
		for (Member member : list) {
			log.info(member);
		}
	}
	
}
