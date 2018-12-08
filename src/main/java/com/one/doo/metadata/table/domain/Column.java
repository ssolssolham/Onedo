package com.one.doo.metadata.table.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;

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
