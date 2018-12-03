package com.one.doo.test;
import static org.junit.Assert.assertNotNull;

import java.util.HashMap;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.one.doo.loan.domain.Parameter;
import com.one.doo.loan.service.LoanService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/spring-security.xml"})
@Log4j
public class LoanServiceTests {

	@Setter(onMethod_ = @Autowired)
	private LoanService service;
	
	@Test
	public void testExist() {
		log.info("서비스가 누구냐 " + service);
		assertNotNull("2." + service);
	}
	
/*	private String loanCategory;
	private int requiredMoney;
	private double resultRate;
	private int targetNum;
	private int termService;*/
	
	@Test
	public void testGetList() {
		Parameter param = new Parameter("담보", 50000, 5.0, 2, 5, "전체");
		//service.getLoanList(param).forEach(loan -> log.info(loan));
		
		List<HashMap<String, Object>> map = service.getLoanList(param);
		for (HashMap<String, Object> loan : map) {
			System.out.println(loan.keySet());
			System.out.println(loan.get("TARGET_DESCRIPTION"));
			
		}
	}
	
}
