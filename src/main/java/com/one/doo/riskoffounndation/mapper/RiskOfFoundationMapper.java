package com.one.doo.riskoffounndation.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.one.doo.riskoffounndation.domain.RiskOfFoundation;

public interface RiskOfFoundationMapper {
	
	// 행정동코드를 이용해 가져오기
		public List<RiskOfFoundation> getRiskOfFoundationList(@Param("AreaCode") int AreaCode);
		public RiskOfFoundation read(@Param("AreaCode") int AreaCode);
}
