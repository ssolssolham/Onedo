package com.one.doo.metadata.table.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.one.doo.metadata.table.domain.Table;
import com.one.doo.metadata.table.mapper.TableMapper;

import lombok.AllArgsConstructor;
@Service
@AllArgsConstructor
public class TableServiceImpl implements TableService {

	@Inject
	private TableMapper mapper;
	
	@Override
	public List<Table> getTableList() {
		return mapper.getTableList();
	}

}
