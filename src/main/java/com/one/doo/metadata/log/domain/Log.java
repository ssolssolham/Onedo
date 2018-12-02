package com.one.doo.metadata.log.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Log {
	private int url_no;
	private String log_day;
	private int log_cnt;
}
