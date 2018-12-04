package com.one.doo.realestate.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.one.doo.realestate.domain.Realestate;

public interface RealestateMapper {

	// 동이름을 Where조건으로 걸어서 agent_Address와 비교
	public List<Realestate> getRealestateList(@Param("AreaCodeName") String AreaCodeName);
	public Realestate read(@Param("AreaCodeName") int AreaCodeName);
}
