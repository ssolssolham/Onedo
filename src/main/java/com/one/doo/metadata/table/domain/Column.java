package com.one.doo.metadata.table.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 하나의 테이블객체에 포함되는 컬럼객체
 * @author siwonPark
 */
@Data
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Column {
	private Long col_no;
	private Long tbl_no;
	private String col_log_name;
	private String col_phy_name;
	private String col_summary;
	
}
