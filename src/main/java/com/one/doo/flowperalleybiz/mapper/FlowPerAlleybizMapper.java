package com.one.doo.flowperalleybiz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.one.doo.flowperalleybiz.domain.FlowPerAlleybiz;

public interface FlowPerAlleybizMapper {
	
	// 상권코드를 이용해 가져오기
	public List<FlowPerAlleybiz> getFlowPerAlleybizList(@Param("AlleyBizCode") String AlleyBizCode);
}
