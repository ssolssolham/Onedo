package com.one.doo.metadata.table.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Table {
	private Long tbl_no;
	private String tbl_log_name; //논리이름
	private String tbl_phy_name; //물리이름
	private String tbl_summary;  //테이블설명요약
	
	private List<Column> columnList; //테이블별 컬럼리스트
	
}
