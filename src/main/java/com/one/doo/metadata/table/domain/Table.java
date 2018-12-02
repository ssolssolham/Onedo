package com.one.doo.metadata.table.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Table {
	private int tbl_no;
	private String tbl_name;
	private String tbl_summary;
	
}
