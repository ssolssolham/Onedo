package com.one.doo.outperalleybiz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.one.doo.outperalleybiz.domain.OutPerAlleybiz;

public interface OutPerAlleybizMapper {
	
	// 상권코드를 이용해 가져오기
	public List<OutPerAlleybiz> getOutPerAlleybizList(@Param("AlleyBizCode") String AlleyBizCode);
	public OutPerAlleybiz read(@Param("AlleyBizCode") int AlleyBizCode);
}
