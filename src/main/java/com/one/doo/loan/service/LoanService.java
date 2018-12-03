package com.one.doo.loan.service;

import java.util.HashMap;
import java.util.List;

import com.one.doo.loan.domain.CreditRank;
import com.one.doo.loan.domain.Loan;
import com.one.doo.loan.domain.Parameter;

public interface LoanService {

	public List<HashMap<String,Object>> getLoanList(Parameter param);
	
	/* 관리자용 기능 */
	//새로운 대출상품 등록
	public void insertLoan(Loan loan);

	//대출상품 정보 수정
	public boolean updateLoan(Loan loan);
	
	//대출상품 정보 상세읽기
	public Loan readLoan(int loanId);
	
}
