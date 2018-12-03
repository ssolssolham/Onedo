package com.one.doo.salespercobb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.one.doo.salespercobb.domain.SalesPerCobb;

public interface SalesPerCobbMapper {

	// 상권코드, 상권업종코드
	public List<SalesPerCobb> getSalesPerCobbList(@Param("AlleyBizCode") String AlleyBizCode,@Param("CobbCode") String CobbCode);
	
}
