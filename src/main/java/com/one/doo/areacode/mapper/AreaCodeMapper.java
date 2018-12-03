package com.one.doo.areacode.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.one.doo.areacode.domain.AreaCode;

public interface AreaCodeMapper {

	// 구 선택만 할경우
	public List<AreaCode> getAreaCodeListByAdmin(@Param("AdminName") String AdminName);
	
	// 구 지역번호 가져오기
	public int getAdminNumByAdmin(@Param("AdminName") String AdminName);
	
	// 동 선택까지 한 경우
	public List<AreaCode> getAreaCodeListByAreaNames(@Param("AdminName") HashMap AreaCodeNames);
	
}
