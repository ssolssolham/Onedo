package com.one.doo.metadata.url.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.one.doo.metadata.url.domain.Url;

public interface UrlMapper {
	
	public int readUrlNo(@Param("url") String url,@Param("method") String method);
	
	// url매핑리스트(param포함)
	public List<Url> getUrlListWithParams();

}
