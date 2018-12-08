package com.one.doo.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.one.doo.metadata.url.domain.Url;
import com.one.doo.metadata.url.mapper.UrlMapper;
import com.one.doo.metadata.url.service.UrlService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/spring-security.xml"})
@Log4j
public class UrlMapperTest {
	@Inject
	private UrlMapper mapper;
	@Inject
	private UrlService service;
	
	//@Test 
	public void test() {
		log.info("------------");
		log.info("url매퍼: "+ mapper);
		log.info("------------");
		List<Url> urlList = mapper.getUrlListWithParams();
		log.info("리스트: "+urlList);
		for (Url url : urlList) {
			log.info("url객체: "+url);
		}
		log.info("----------");
	}
	@Test
	public void test2() {
		log.info("--------서비스테스트");
		log.info("url서비스:"+service);
		log.info("--------------");
		List<Url> list = service.getUrlListWithParam();
		log.info("리스트: "+list);
		for (Url url : list) {
			log.info(url);
		}
		log.info("------------");
	}
}
