package com.one.doo.metadata.url.domain;

import com.one.doo.metadata.log.domain.Log;

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
 private int url_no;
 private String url;
 private String url_summary;
 private String mvc_c_name;
 private String method;
}
