package com.one.doo.workerperalleybiz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.one.doo.workerperalleybiz.domain.WorkerPerAlleybiz;

public interface WorkerPerAlleybizMapper {

	// 상권코드를 이용해 가져오기
	public List<WorkerPerAlleybiz> getWorkerPerAlleybizList(@Param("AlleyBizCode") String AlleyBizCode);
}
