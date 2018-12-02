package com.one.doo.metadata.url.mapper;

import org.apache.ibatis.annotations.Param;

import com.one.doo.metadata.url.domain.Url;

public interface UrlMapper {
	
	public int readUrlNo(@Param("url") String url,@Param("method") String method);
	
}
