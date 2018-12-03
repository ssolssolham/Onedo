package com.one.doo.analysis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.one.doo.areacode.domain.AreaCode;
import com.one.doo.areacode.mapper.AreaCodeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AnalysisServiceImpl implements AnalysisService {
	
	@Inject
	AreaCodeMapper areacodeMapper;
	
	@Transactional
	@Override
	public String getVillageList(String selectedDistrict) {
		
		List<AreaCode> list = areacodeMapper.getAreaCodeListByAdmin(selectedDistrict);
		
		String result = "";
		
		for (AreaCode areaCode : list) {
			result += areaCode.getAreaCode_Name();
			result += ",";
		}
		
		result = result.substring(0, result.length() - 1);
		
		return result;
	}

}
