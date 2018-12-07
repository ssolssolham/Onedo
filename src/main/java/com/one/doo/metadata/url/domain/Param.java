package com.one.doo.metadata.url.domain;

import lombok.Data;

@Data
public class Param {
	private Long param_no;
	private Long url_no;
	private String key;
	private String value;
	private String type;
	private String description;
}
