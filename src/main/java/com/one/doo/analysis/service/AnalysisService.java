package com.one.doo.analysis.service;

import java.util.HashMap;
import java.util.List;

public interface AnalysisService {
	
	public String getVillageList(String selectedDistrict);
	
	public List<HashMap<String,Object>> firstStep(List<String> Areas,String regionType);
}
