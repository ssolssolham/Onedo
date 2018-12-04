package com.one.doo.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.one.doo.mlresult.domain.Mlresult;
import com.one.doo.mlresult.mapper.MlresultMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/spring-security.xml"})
@Log4j
public class MLResultTest {
	@Inject
	private MlresultMapper mapper;
	
	//@Test
//	public void test() {
//		List<String> areas = new ArrayList<String>();
//		areas.add("상일동");
//		List<HashMap> result = mapper.firstStep(areas);
//		for (HashMap map : result) {
//			log.info(map);
//		}
//		log.info("----------");
//	}
	
	@Test
	public void test() {
		int code = 628;
		Mlresult result = mapper.read(code);
		log.info(result);
		log.info("----------");
	}
}
