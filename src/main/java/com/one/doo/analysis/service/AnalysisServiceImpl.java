package com.one.doo.analysis.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.one.doo.alleybiz.domain.AlleyBiz;
import com.one.doo.alleybiz.mapper.AlleyBizMapper;
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
import com.one.doo.outperalleybiz.domain.OutPerAlleybiz;
import com.one.doo.outperalleybiz.mapper.OutPerAlleybizMapper;
import com.one.doo.realestate.domain.Realestate;
import com.one.doo.realestate.mapper.RealestateMapper;
import com.one.doo.riskoffounndation.domain.RiskOfFoundation;
import com.one.doo.riskoffounndation.mapper.RiskOfFoundationMapper;
import com.one.doo.salespercobb.domain.SalesPerCobb;
import com.one.doo.salespercobb.mapper.SalesPerCobbMapper;
import com.one.doo.storeperalleybiz.domain.StorePerAlleybiz;
import com.one.doo.storeperalleybiz.mapper.StorePerAlleybizMapper;
import com.one.doo.workerperalleybiz.domain.WorkerPerAlleybiz;
import com.one.doo.workerperalleybiz.mapper.WorkerPerAlleybizMapper;

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
	
	@Inject
	OutPerAlleybizMapper outPerAlleybizMapper;
	
	@Inject 
	RealestateMapper realestateMapper;
	
	@Inject
	RiskOfFoundationMapper riskOfFoundationMapper;
	
	@Inject
	AlleyBizMapper alleyBizMapper;
	
	@Inject
	SalesPerCobbMapper salesPerCobbMapper;
	
	@Inject
	StorePerAlleybizMapper storePerAlleybizMapper;
	
	@Inject
	WorkerPerAlleybizMapper workerPerAlleybizMapper;
	
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
		log.info(regionType);
			
		//리스트 반환할 객체 선언 
		List<HashMap> list = null;
		
		//부동산 보낼 객체 준비 (상일) 부동산중개사 이름 / 부동산중개사 주소
		List<HashMap<String, Object>> realestateList = null;
		//부동산에 해당하는 전체 매물 리스트 반환
		List<Realestate> memulList = null;
		//검색 타입별로 쿼리문 실행
		switch(regionType) {
			case "주택가" : list = mlresultMapper.firstStep(Areas);
				break;
			case "대학가" : list = mlresultMapper.secondStep(Areas);
				log.info("대학가 부름??: "+regionType);
				break;
			case "유흥가" : list = mlresultMapper.thirdStep(Areas);
				log.info("유흥가 부름??: "+regionType);
				break;
			case "역세권" : list = mlresultMapper.fourthStep(Areas);
				log.info("역세권 부름??: "+regionType);
				break;
			case "오피스" : list = mlresultMapper.fifthStep(Areas);
				log.info("오피스 부름??: "+regionType);
				break;	
		}
		
		//반환할 리스트가 없으면 
		if (list == null) {
			log.info("--------------해당 타입에 대한 list 반환값 없음 -----------");
			return null;
		}
		
		List<HashMap<String,Object>> returnList = new ArrayList();
		
		for (HashMap hashMap : list) {
			int ALLEYBIZCODE = Integer.parseInt(String.valueOf(hashMap.get("ALLEYBIZCODE")));
			
			HashMap<String,Object> hash = new HashMap<String,Object>();
			// 보낼 객체들 준비(상일)
			Mlresult mlresult = mlresultMapper.read(ALLEYBIZCODE);
			FacilitiesPerAlleybiz facilitiesPerAlleybiz = facilitiesPerAlleybizMapper.read(ALLEYBIZCODE);
			FlowPerAlleybiz flowPerAlleybiz = flowPerAlleybizMapper.read(ALLEYBIZCODE);
			IndexPerAlleybiz indexPerAlleybiz = indexPerAlleybizMapper.read(ALLEYBIZCODE);
			LivingPerAlleybiz livingPerAlleybiz = livingPerAlleybizMapper.read(ALLEYBIZCODE);
			AreaCode areaCode = areaCodeMapper.read(ALLEYBIZCODE);
			OutPerAlleybiz outPerAlleybiz = outPerAlleybizMapper.read(ALLEYBIZCODE);
			RiskOfFoundation riskOfFoundation = riskOfFoundationMapper.read(areaCode.getAreaCode());
			AlleyBiz alleyBiz = alleyBizMapper.read(ALLEYBIZCODE);
			SalesPerCobb salesPerCobb = salesPerCobbMapper.read(ALLEYBIZCODE);
			StorePerAlleybiz storePerAlleybiz = storePerAlleybizMapper.read(ALLEYBIZCODE);
			WorkerPerAlleybiz workerPerAlleybiz = workerPerAlleybizMapper.read(ALLEYBIZCODE);
			
			
			realestateList = realestateMapper.getRealestateList(ALLEYBIZCODE);
			memulList = realestateMapper.read(ALLEYBIZCODE);
			
			hash.put("mlresult", mlresult);
			hash.put("facilitiesPerAlleybiz",facilitiesPerAlleybiz);
			hash.put("flowPerAlleybiz",flowPerAlleybiz);
			hash.put("indexPerAlleybiz",indexPerAlleybiz);
			hash.put("livingPerAlleybiz", livingPerAlleybiz);
			hash.put("areaCode", areaCode);
			hash.put("outPerAlleybiz", outPerAlleybiz);
			hash.put("riskOfFoundation",riskOfFoundation);
			hash.put("alleyBiz",alleyBiz);
			hash.put("salesPerCobb", salesPerCobb);
			hash.put("storePerAlleybiz", storePerAlleybiz);
			hash.put("workerPerAlleybiz", workerPerAlleybiz);
			
			//부동산리스트 반환값이 없으면 null
			if(realestateList != null) {
				//부동산중개사 리스트 담기(상일)
				hash.put("realestateList", realestateList);
				hash.put("memulList", memulList);
			} else {
				//null일시
				log.info("--------------해당 타입에 대한 부동산리스트 반환값 없음 -----------");
				hash.put("realestateList", null);
				hash.put("memulList", null);
			}
		
			returnList.add(hash);
		}
		
		return returnList;
	}

}
