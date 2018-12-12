package com.one.doo.analysis.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.doo.adbd.service.ADBDService;
import com.one.doo.analysis.service.AnalysisService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/analysis")
@AllArgsConstructor
public class AnalysisController {

	@Inject
	private AnalysisService analysisService;
	
	@Inject
	private ADBDService adbdService;

	@RequestMapping("/")
	public String home() {
		return "analysis/analysis";
	}

	@RequestMapping(value = "/getvillagelist/{selectedDistrict}", produces = "application/json; charset=utf8")
	public @ResponseBody String getVillageList(@PathVariable String selectedDistrict) {
		log.info(selectedDistrict);

		String result = "{\"area\":\"" + analysisService.getVillageList(selectedDistrict) + "\"}";

		log.info(result);

		return result;
	}

	@RequestMapping(value = "/analysisstart", produces = "application/json; charset=utf8")
	public @ResponseBody List<HashMap<String,Object>> getAnalysisResult(@RequestParam(value="userId") String userId, @RequestParam(value = "villageList[]") List<String> arrayParams,
			@RequestParam(value = "regionType") String regionType) {
		log.info("배열 파라미터??? " + arrayParams);
		log.info("검색 타입??? " + regionType);
		log.info("유저 아이디 : " + userId);
		System.out.println(arrayParams.toString());
		
		List<HashMap<String,Object>> hash = analysisService.firstStep(arrayParams, regionType);
		
		if ( hash == null ) {
			return null;
		}
		
		for (int i = 0; i < hash.size(); i++) {
			Map<String, Object> map = hash.get(i);
			adbdService.insert(userId, Integer.parseInt(map.get("abz").toString()));
		}
		
		log.info(hash);
		return hash;
	}

}
