package com.one.doo.loan.service;

import com.one.doo.loan.domain.CreditRank;

public interface CreditRankService {
	//신용도에 따른 대출이율 읽기
	public CreditRank readRate(int rateId);
}
