package com.one.doo.metadata.url.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Param {
	
	private Long param_no;
	private Long url_no;
	private String key;
	private String value;
	private String type;
	private String description;
	
	
}
