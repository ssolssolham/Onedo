package com.one.doo.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.one.doo.article.domain.Reply;
import com.one.doo.article.mapper.ReplyMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/spring-security.xml"})
@Log4j
public class ReplyTest {
	
	@Inject
	private ReplyMapper mapper;
	
	@Test
	public void testMapper() {
		//log.info("댓글매퍼: "+mapper);
		
//		Reply reply = new Reply();
//		reply.setArticle_num(151L);
//		reply.setReply("댓글매퍼 유닛테스트");
//		reply.setReplyer("hi");
//		log.info("댓글!!"+reply);
//		mapper.insert(reply);
		
		//mapper.getListWithPaging(cri, 14L);
	}	
	
}
