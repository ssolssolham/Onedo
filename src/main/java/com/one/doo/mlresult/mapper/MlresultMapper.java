package com.one.doo.mlresult.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.one.doo.mlresult.domain.Mlresult;

public interface MlresultMapper {

	// 결과가 여러개?
	public List<Mlresult> getMlresultList(@Param("AlleyBizCode") String AlleyBizCode,@Param("CobbCode") String CobbCode);
	
	// 결과가 1개
	public Mlresult getMlresult(@Param("AlleyBizCode") String AlleyBizCode,@Param("CobbCode") String CobbCode);
}
