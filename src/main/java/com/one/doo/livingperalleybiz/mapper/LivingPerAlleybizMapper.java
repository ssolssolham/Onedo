package com.one.doo.livingperalleybiz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.one.doo.livingperalleybiz.domain.LivingPerAlleybiz;

public interface LivingPerAlleybizMapper {
	
	// 상권코드를 이용해 가져오기
	public List<LivingPerAlleybiz> getLivingPerAlleybizList(@Param("AlleyBizCode") String AlleyBizCode);
}
