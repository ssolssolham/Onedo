package com.one.doo.analysis.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("/")
	public String home() {
		return "analysis/analysis";
	}
	
	@RequestMapping(value = "/getvillagelist/{selectedDistrict}", produces = "application/json; charset=utf8")
	public @ResponseBody String getVillageList(@PathVariable String selectedDistrict)  {
		
		log.info("들어옴?");
		log.info(selectedDistrict);
		
		
		String result = "{\"area\":\""+ analysisService.getVillageList(selectedDistrict) +"\"}";
		
		log.info(result);
		
		return result;
	}
	
}
