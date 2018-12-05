package com.one.doo.realestate.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.one.doo.realestate.domain.Realestate;

public interface RealestateMapper {

	// 추천된 해당 골목상권의 동 안에 있는 부동산 중개사만 불러오기(상일) 
	public List<HashMap<String, Object>> getRealestateList(@Param("AlleyBizCode") int AlleyBizCode);
	
	// 추천된 해당 골목상권의 동 안에 있는 부동산 중개사 매물 정보 모두 불러오기(상일)
	public List<Realestate> read(@Param("AlleyBizCode") int AlleyBizCode);
}
