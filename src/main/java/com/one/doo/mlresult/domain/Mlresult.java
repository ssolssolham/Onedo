package com.one.doo.mlresult.domain;

import com.one.doo.metadata.log.domain.Log;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Mlresult {
	private int col_no;
	private String col_name;
	private String col_summary;
	private int tbl_no;
}
