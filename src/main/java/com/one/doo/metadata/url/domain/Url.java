package com.one.doo.metadata.url.domain;

import java.util.List;

import com.one.doo.metadata.url.domain.Param;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Getter
public class Url {
	private Long url_no;
	private String url;
	private String url_summary;
	private String method;
	private String auth;
	private List<Param> paramList;
}
