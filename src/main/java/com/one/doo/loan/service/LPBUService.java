package com.one.doo.loan.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.one.doo.board.domain.Criteria;
import com.one.doo.loan.domain.LPBU;

public interface LPBUService {

	public LPBU read(int lpbuNo);
	
	public int insertLPBU(LPBU lpbu);

	public List<HashMap<String, Object>> getLPBUList(String userId);
	
	
	/*관리자용 기능*/
	public boolean deleteLPBU(int lpbuNo);

	public boolean answerLPBU(int lpbuNo);
	
	public List<HashMap<String, Object>> getLPBUListWithPaging(Criteria cri);
	
	public int getTotalLPBU(Criteria cri);
	
}
