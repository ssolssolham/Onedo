package com.one.doo.adbd.service;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.one.doo.adbd.mapper.ADBDMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ADBDServiceImpl implements ADBDService {
	
	@Inject
	ADBDMapper adbdMapper;

	@Override
	public void insert(String userid, int alleyBizCode) {
		adbdMapper.insert(userid, alleyBizCode);
	}

}
