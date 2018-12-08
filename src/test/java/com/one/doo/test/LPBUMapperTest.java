package com.one.doo.test;

import java.util.HashMap;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.one.doo.board.domain.Criteria;
import com.one.doo.loan.domain.LPBU;
import com.one.doo.loan.mapper.LPBUMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/spring-security.xml"})
@Log4j
public class LPBUMapperTest {

	@Setter(onMethod_ = @Autowired)
	private LPBUMapper mapper;
	
	@Test
	public void testMap() {
		log.info(mapper);
	}
	
	//@Test
	public void testCreate() {
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
			mapper.insertLPBU(lpbu);
			log.info("예약완료!!!");
	}

	//@Test
	public void testMapper() {
		log.info(mapper);
	}

	//@Test
	public void testDelete() {
		int lpbuno = 1;
		mapper.deleteLPBU(lpbuno);
	}

	//@Test
	public void testUpdate() {
/*		int lpbuNo = 1;
		int count = mapper.update(lpbuNo);
		log.info("UPDATE COUNT: " + count);*/
	}

	//@Test
	public void testList() {
		Criteria cri = new Criteria();
		List<HashMap<String, Object>> lpbus = mapper.getLPBUListWithPaging(cri);
		lpbus.forEach(lpbu -> log.info(lpbu));
	}
	
	


}
