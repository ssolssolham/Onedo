package com.one.doo.mlresult.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.one.doo.mlresult.domain.Mlresult;

public interface MlresultMapper {

	// 결과가 여러개?
	public List<Mlresult> getMlresultList(@Param("AlleyBizCode") int AlleyBizCode);
	
	// 결과가 1개
	public Mlresult read(@Param("AlleyBizCode") int AlleyBizCode);
	
	//주택가 타입에 대한 검색
	public List<HashMap> firstStep(@Param("Areas") List<String> Areas);
	
	//대학가 타입에 대한 검색
	public List<HashMap> secondStep(@Param("Areas") List<String> Areas);
	
	//유흥가 타입에 대한 검색
	public List<HashMap> thirdStep(@Param("Areas") List<String> Areas);
	
	//역세권 타입에 대한 검색
	public List<HashMap> fourthStep(@Param("Areas") List<String> Areas);
	
	//오피스 타입에 대한 검색
	public List<HashMap> fifthStep(@Param("Areas") List<String> Areas);
	
	// 매출액 산출
	public List<Mlresult> readSalesList(@Param("AlleyBizCode") int AlleyBizCode);
}
