package com.one.doo.facilitiesperalleybiz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.one.doo.facilitiesperalleybiz.domain.FacilitiesPerAlleybiz;

public interface FacilitiesPerAlleybizMapper {

	// 상권코드를 이용해 가져오기
	public List<FacilitiesPerAlleybiz> getFacilitiesPerAlleybizList(@Param("AlleyBizCode") String AlleyBizCode);
}
