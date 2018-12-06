package com.one.doo.test;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.one.doo.loan.domain.LPBU;
import com.one.doo.loan.service.LPBUService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/spring-security.xml"})
@Log4j
public class LPBUServiceTest {

	@Setter(onMethod_ = @Autowired)
	private LPBUService service;
	
	@Test
	public void testExist() {
		log.info("서비스가 누구냐 " + service);
		assertNotNull("2." + service);
	}

	
	//@Test
	public void testRegister() {
		LPBU lpbu = new LPBU();
		//상담번호
		lpbu.setUserId("hi");
		lpbu.setLoanId(2);
		lpbu.setReserveTime("2018-12-06 17:20:00");
		lpbu.setRequestBM(500000);
		lpbu.setRateId(1);
		lpbu.setUserPhone("010-4195-8429");
		lpbu.setReasonLoan("테스트입니다.");
		lpbu.setBirthdate("1992-08-28");
		service.insertLPBU(lpbu);
		log.info("대출예약 번호 : " + lpbu.getLpbuNum());
	}
	
	@Test
	public void testDelete() {
		log.info("삭제 결과 : " + service.deleteLPBU(1));
	}
	
	@Test
	public void testUpdate() {
		log.info("수정 결과 : " + service.answerLPBU(2));
	}
}
