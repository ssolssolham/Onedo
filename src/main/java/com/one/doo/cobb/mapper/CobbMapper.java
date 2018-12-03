package com.one.doo.cobb.mapper;

import org.apache.ibatis.annotations.Param;

public interface CobbMapper {
	
	// 상권업종명으로 상권업종별 코드 가져오기
	public String getCobbCode(@Param("cobbName") String cobbName); 
}
