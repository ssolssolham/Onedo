package com.one.doo.loan.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.doo.loan.domain.LPBU;
import com.one.doo.loan.mapper.LPBUMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class LPBUServiceImpl implements LPBUService {

	@Setter(onMethod_ = @Autowired)
	private LPBUMapper mapper;

	@Override
	public int insertLPBU(LPBU lpbu) {
		return mapper.insertLPBU(lpbu);
	}

	@Override
	public int answerLPBU(int lpbuNo) {
		return mapper.answerLPBU(lpbuNo);
	}

	@Override
	public int deleteLPBU(int lpbuNo) {
		return mapper.deleteLPBU(lpbuNo);
	}

	@Override
	public List<HashMap<String, Object>> listLPBU(String userId){
		return mapper.listLPBU(userId);
	}


	


}
