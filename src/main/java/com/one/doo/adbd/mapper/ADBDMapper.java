package com.one.doo.adbd.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ADBDMapper {

	//게시판 글 작성
	public void insert(@Param(value = "userId") String userid, @Param(value="alleybiz") int alleyBizCode);
	
	public int loadAdbdCnt();
	
	public int ADBDCnt();
	
	public List<HashMap<String,Object>> topFiveADBD();
}
