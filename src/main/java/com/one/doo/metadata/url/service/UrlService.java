package com.one.doo.metadata.url.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.one.doo.metadata.url.domain.Url;

/**
 * 메타데이터 url관리를 위한 서비스
 * @author siwonPark
 */
@Service
public interface UrlService {
	// url정보 리스트 get
	public List<Url> getUrlListWithParam();
}
