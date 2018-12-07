package com.one.doo.loan.mapper;

import java.util.HashMap;
import java.util.List;

import com.one.doo.loan.domain.LPBU;

public interface LPBUMapper {

	public int insertLPBU(LPBU lpbu);

	public int deleteLPBU(int lpbuNo);

	public int answerLPBU(int lpbuNo);

	public List<HashMap<String, Object>> getLPBUList(String userId);
}
