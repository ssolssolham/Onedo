package com.one.doo.loan.service;

import java.util.HashMap;
import java.util.List;

import com.one.doo.loan.domain.LPBU;

public interface LPBUService {

	public int insertLPBU(LPBU lpbu);

	public int answerLPBU(int lpbuNo);

	public int deleteLPBU(int lpbuNo);

	public List<HashMap<String, Object>> listLPBU(String userId);
}
