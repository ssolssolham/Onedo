package com.one.doo.loan.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.doo.loan.domain.CreditRank;
import com.one.doo.loan.mapper.CreditRankMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service 
@AllArgsConstructor
@Log4j
public class CreditRankServiceImpl implements CreditRankService{

	@Setter(onMethod_ = @Autowired)
	private CreditRankMapper mapper;

	@Override
	public CreditRank readRate(int rateId) {
		return mapper.readRate(rateId);
	}

}
