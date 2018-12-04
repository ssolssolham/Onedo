package com.one.doo.analysis.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.one.doo.areacode.domain.AreaCode;
import com.one.doo.areacode.mapper.AreaCodeMapper;
import com.one.doo.facilitiesperalleybiz.domain.FacilitiesPerAlleybiz;
import com.one.doo.facilitiesperalleybiz.mapper.FacilitiesPerAlleybizMapper;
import com.one.doo.flowperalleybiz.domain.FlowPerAlleybiz;
import com.one.doo.flowperalleybiz.mapper.FlowPerAlleybizMapper;
import com.one.doo.indexperalleybiz.domain.IndexPerAlleybiz;
import com.one.doo.indexperalleybiz.mapper.IndexPerAlleybizMapper;
import com.one.doo.livingperalleybiz.domain.LivingPerAlleybiz;
import com.one.doo.livingperalleybiz.mapper.LivingPerAlleybizMapper;
import com.one.doo.mlresult.domain.Mlresult;
import com.one.doo.mlresult.mapper.MlresultMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AnalysisServiceImpl implements AnalysisService {
	
	@Inject
	MlresultMapper mlresultMapper;
	
	@Inject
	FacilitiesPerAlleybizMapper facilitiesPerAlleybizMapper;
	
	@Inject
	FlowPerAlleybizMapper flowPerAlleybizMapper;
	
	@Inject
	IndexPerAlleybizMapper indexPerAlleybizMapper;
	
	@Inject
	LivingPerAlleybizMapper livingPerAlleybizMapper;
	
	@Inject
	AreaCodeMapper areaCodeMapper;
	
	@Transactional
	@Override
	public String getVillageList(String selectedDistrict) {
		
		List<AreaCode> list = areaCodeMapper.getAreaCodeListByAdmin(selectedDistrict);
		
		String result = "";
		
		for (AreaCode areaCode : list) {
			result += areaCode.getAreaCode_Name();
			result += ",";
		}
		
		result = result.substring(0, result.length() - 1);
		
		return result;
	}
	
	@Transactional
	@Override
	public List<HashMap<String,Object>> firstStep(List<String> Areas,String regionType) {
		
		List<HashMap> list = mlresultMapper.firstStep(Areas);
		List<HashMap<String,Object>> returnList = new ArrayList();
		
		for (HashMap hashMap : list) {
			int ALLEYBIZCODE = Integer.parseInt(String.valueOf(hashMap.get("ALLEYBIZCODE")));
			
			HashMap<String,Object> hash = new HashMap<String,Object>();
			// 보낼 객체들 준비
			Mlresult mlresult = mlresultMapper.read(ALLEYBIZCODE);
			FacilitiesPerAlleybiz facilitiesPerAlleybiz = facilitiesPerAlleybizMapper.read(ALLEYBIZCODE);
			FlowPerAlleybiz flowPerAlleybiz = flowPerAlleybizMapper.read(ALLEYBIZCODE);
			IndexPerAlleybiz indexPerAlleybiz = indexPerAlleybizMapper.read(ALLEYBIZCODE);
			LivingPerAlleybiz livingPerAlleybiz = livingPerAlleybizMapper.read(ALLEYBIZCODE);
			AreaCode areaCode = areaCodeMapper.read(ALLEYBIZCODE);
			
			
			hash.put("mlresult", mlresult);
			hash.put("facilitiesPerAlleybiz",facilitiesPerAlleybiz);
			hash.put("flowPerAlleybiz",flowPerAlleybiz);
			hash.put("indexPerAlleybiz",indexPerAlleybiz);
			hash.put("livingPerAlleybiz", livingPerAlleybiz);
			hash.put("areaCode", areaCode);
			
			
			returnList.add(hash);
		}
		
		return returnList;
	}

}
