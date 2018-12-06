package com.one.doo.loan.service;

import com.one.doo.loan.domain.LPBU;

public interface LPBUService {

	public int insertLPBU(LPBU lpbu);

	public int answerLPBU(int lpbuNo);

	public int deleteLPBU(int lpbuNo);


}
