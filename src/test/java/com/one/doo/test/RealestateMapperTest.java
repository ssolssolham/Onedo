package com.one.doo.test;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.one.doo.article.domain.Article;
import com.one.doo.article.domain.Criteria;
import com.one.doo.article.mapper.ArticleMapper;
import com.one.doo.realestate.mapper.RealestateMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/spring-security.xml"})
@Log4j
public class RealestateMapperTest {
	@Inject
	private RealestateMapper mapper;
	
	@Test 
	public void test() {
		log.info("------------");
		log.info("부동산 리스트 가져오기 매퍼: "+ mapper);
		log.info("------------");
		int alleybiz = 631;
		List<HashMap<String, Object>> result = mapper.getRealestateList(alleybiz);
		for (HashMap one : result) {
			log.info(one);
		}
		log.info("----------");
	}
}
