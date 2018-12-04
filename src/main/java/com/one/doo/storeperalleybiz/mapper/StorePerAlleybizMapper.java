package com.one.doo.storeperalleybiz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.one.doo.storeperalleybiz.domain.StorePerAlleybiz;

public interface StorePerAlleybizMapper {
	
	// 상권코드, 상권업종
		public List<StorePerAlleybiz> getStorePerAlleybizList(@Param("AlleyBizCode") String AlleyBizCode,@Param("CobbCode") String CobbCode);
		public StorePerAlleybiz read(@Param("AlleyBizCode") int AlleyBizCode);
		
}
