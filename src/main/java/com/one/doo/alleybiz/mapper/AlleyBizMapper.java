package com.one.doo.alleybiz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.one.doo.alleybiz.domain.AlleyBiz;

public interface AlleyBizMapper {
	
	// 행정동번호를 통해 지역별 상권 가져오기
	public List<AlleyBiz> getAlleyBizListByAreaCode(@Param("AreaCode") int AreaCode);
	
	public int getAreaCodeByAnalyze1(@Param("AreaNames") String AreaNames);
}
