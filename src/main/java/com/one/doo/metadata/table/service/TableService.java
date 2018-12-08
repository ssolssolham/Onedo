package com.one.doo.metadata.table.service;
/**
 * 메타데이터 table관리를 위한 서비스
 * @author siwonPark
 */

import java.util.List;

import org.springframework.stereotype.Service;

import com.one.doo.metadata.table.domain.Table;
@Service
public interface TableService {
	//table정보 리스트 get
	public List<Table> getTableList();
}
