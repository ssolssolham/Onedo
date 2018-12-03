package com.one.doo.loan.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.doo.loan.domain.CreditRank;
import com.one.doo.loan.domain.Loan;
import com.one.doo.loan.domain.Parameter;
import com.one.doo.loan.mapper.LoanMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service 
@AllArgsConstructor
@Log4j
public class LoanServiceImpl implements LoanService{

	@Setter(onMethod_ = @Autowired)
	private LoanMapper mapper;

	@Override
	public List<HashMap<String, Object>> getLoanList(Parameter param) {
		return mapper.getLoanList(param);
	}

	@Override
	public void insertLoan(Loan loan) {
		mapper.insertLoan(loan);
	}

	@Override
	public boolean updateLoan(Loan loan) {
		return mapper.updateLoan(loan) == 1;
	}

	@Override
	public Loan readLoan(int loanId) {
		return mapper.readLoan(loanId);
	}

	@Override
	public CreditRank readRate(int rateId) {
		return mapper.readRate(rateId);
	}

}
