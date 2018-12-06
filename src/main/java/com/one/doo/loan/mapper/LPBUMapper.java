package com.one.doo.loan.mapper;

import com.one.doo.loan.domain.LPBU;

public interface LPBUMapper {

	public int insertLPBU(LPBU lpbu);

	public int deleteLPBU(int lpbuNo);

	public int answerLPBU(int lpbuNo);

}
