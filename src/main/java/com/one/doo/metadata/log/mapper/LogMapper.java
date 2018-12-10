package com.one.doo.metadata.log.mapper;

import org.apache.ibatis.annotations.Param;

import com.one.doo.metadata.log.domain.Log;

public interface LogMapper {
	
	public void insert(@Param("url_no") int url_no,@Param("log_day") String log_day);
	
	public int update(@Param("url_no") int url_no,@Param("log_day") String log_day);
	
	public int countTodayLog(@Param("url_no") int url_no,@Param("log_day") String log_day);
	
	public int logCnt();
}
