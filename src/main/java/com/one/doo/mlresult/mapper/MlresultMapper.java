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
	
	public List<HashMap> firstStep(@Param("Areas") List<String> Areas);
	
	public List<HashMap> secondStep(@Param("Areas") List<String> Areas);
	
	public List<HashMap> thirdStep(@Param("Areas") List<String> Areas);
	
	public List<HashMap> fourthStep(@Param("Areas") List<String> Areas);
	
	public List<HashMap> fifthStep(@Param("Areas") List<String> Areas);
}
