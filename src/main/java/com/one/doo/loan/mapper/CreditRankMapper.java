package com.one.doo.loan.mapper;

import com.one.doo.loan.domain.CreditRank;
public interface CreditRankMapper {
	
	//신용도에 따른 대출이율 읽기
	public CreditRank readRate(int rateId);
	
}
