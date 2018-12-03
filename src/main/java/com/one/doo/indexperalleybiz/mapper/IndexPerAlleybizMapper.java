package com.one.doo.indexperalleybiz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.one.doo.indexperalleybiz.domain.IndexPerAlleybiz;

public interface IndexPerAlleybizMapper {

	// 상권코드, 상권업종
	public List<IndexPerAlleybiz> getIndexPerAlleybizList(@Param("AlleyBizCode") String AlleyBizCode,@Param("CobbCode") String CobbCode);
	
}
