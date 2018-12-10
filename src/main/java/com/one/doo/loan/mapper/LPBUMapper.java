package com.one.doo.loan.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.one.doo.board.domain.Criteria;
import com.one.doo.loan.domain.LPBU;
import com.one.doo.loan.domain.Loan;

public interface LPBUMapper {

	public LPBU read(@Param("lpbuNo") int lpbuNo);
	
	public int insertLPBU(LPBU lpbu);

	public List<HashMap<String, Object>> getLPBUList(@Param("userId") String userId);
	
	/* 관리자용 기능	*/
	public int deleteLPBU(@Param("lpbuNo") int lpbuNo);

	public int answerLPBU(int lpbuNo);
	
	public List<HashMap<String, Object>> getLPBUListWithPaging(Criteria cri);
	
	public int getTotalLPBU(Criteria cri);
	
	public int loadLpbuCnt();
}
