package com.one.doo.admin.home.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.one.doo.adbd.mapper.ADBDMapper;
import com.one.doo.adbd.service.ADBDServiceImpl;
import com.one.doo.loan.mapper.LPBUMapper;
import com.one.doo.loan.mapper.LoanMapper;
import com.one.doo.metadata.log.mapper.LogMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdminHomeServiceImpl implements AdminHomeService{

	// 로그, ADBD, LPBU 
	@Inject
	LogMapper logMapper;

	@Inject
	ADBDMapper adbdMapper;
	
	@Inject
	LPBUMapper lpbuMapper;
	
	@Inject
	LoanMapper loanMapper;
	
	@Override
	public List<Object> adminFirstStep() {
		int logCnt  = logMapper.logCnt();
		int adbdCnt = adbdMapper.loadAdbdCnt();
		int lpbuCnt = lpbuMapper.loadLpbuCnt();
		List<Object> list = new ArrayList<Object>();
		
		/* 그래프 데이터 */
		list.add(logCnt);
		list.add(adbdCnt);
		list.add(lpbuCnt);
		
		/* 월간 베스트 5 상품 */
		List<HashMap<String,Object>> map = loanMapper.bestFiveLoans();
		list.add(map);
		/* 월간 베스트 5 상권 */
//		List<HashMap<String,Object>> map2 = 
		
		
		
		
		return list;
	}

}
