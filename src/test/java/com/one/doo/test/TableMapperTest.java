package com.one.doo.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.one.doo.metadata.table.domain.Table;
import com.one.doo.metadata.table.mapper.TableMapper;
import com.one.doo.metadata.table.service.TableService;
import com.one.doo.metadata.url.domain.Url;
import com.one.doo.metadata.url.mapper.UrlMapper;
import com.one.doo.metadata.url.service.UrlService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/spring-security.xml"})
@Log4j
public class TableMapperTest {
	@Inject
	private TableMapper mapper;
	@Inject
	private TableService service;
	
	//@Test 
	public void test() {
		log.info("------------");
		log.info("table매퍼: "+ mapper);
		log.info("------------");
		List<Table> list = mapper.getTableList();
		log.info("리스트: "+list);
		for (Table table : list) {
			log.info("table객체: "+table);
		}
		log.info("----------");
	}
	
	@Test
	public void test2() {
		log.info("--------서비스테스트");
		log.info("table서비스:"+service);
		log.info("--------------");
		List<Table> list = service.getTableList();
		log.info("리스트: "+list);
		for (Table table : list) {
			log.info(table);
			
		}
		log.info("------------");
	}
}
