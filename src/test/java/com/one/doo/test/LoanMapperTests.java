package com.one.doo.test;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.one.doo.loan.domain.Loan;
import com.one.doo.loan.domain.Parameter;
import com.one.doo.loan.mapper.LoanMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/spring-security.xml"})
@Log4j
public class LoanMapperTests {

	@Setter(onMethod_ = @Autowired)
	private LoanMapper mapper;

	@Test
	public void testGetList() {
		mapper.getLoanList(new Parameter()).forEach(loan -> log.info(loan));
	}
	
	
	//@Test
	public void testInsert() {
		Loan loan = new Loan();
		mapper.insertLoan(loan);
		log.info(loan);
	}
	
	//@Test
	public void testRead() {
		Loan loan = mapper.readLoan(52);
		log.info(loan);
	}
	
	//@Test
	public void testUpdate() {
		Loan loan = new Loan();
		int count = mapper.updateLoan(loan);
		log.info("UPDATE COUNT: " + count);
	}
}
