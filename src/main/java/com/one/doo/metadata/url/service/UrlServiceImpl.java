package com.one.doo.metadata.url.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.one.doo.metadata.url.domain.Url;
import com.one.doo.metadata.url.mapper.UrlMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UrlServiceImpl implements UrlService {

	@Inject
	private UrlMapper mapper;
	
	@Override
	public List<Url> getUrlListWithParam() {
		return mapper.getUrlListWithParams();
	}

}
