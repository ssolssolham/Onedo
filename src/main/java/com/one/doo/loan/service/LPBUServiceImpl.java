package com.one.doo.loan.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.doo.board.domain.Criteria;
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
	public LPBU read(int lpbuNo) {
		return mapper.read(lpbuNo);
	};
	
	@Override
	public int insertLPBU(LPBU lpbu) {
		return mapper.insertLPBU(lpbu);
	}

	@Override
	public List<HashMap<String, Object>> getLPBUList(String userId){
		return mapper.getLPBUList(userId);
	}

	@Override
	public boolean deleteLPBU(int lpbuNo) {
		return mapper.deleteLPBU(lpbuNo) == 1;
	}
	
	@Override
	public boolean answerLPBU(int lpbuNo) {
		return mapper.answerLPBU(lpbuNo) == 1;
	}

	@Override
	public List<HashMap<String, Object>> getLPBUListWithPaging(Criteria cri) {
		return mapper.getLPBUListWithPaging(cri);
	}

	@Override
	public int getTotalLPBU(Criteria cri) {
		return mapper.getTotalLPBU(cri);
	}


}
