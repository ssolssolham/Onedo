package com.one.doo.storeperalleybiz.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class StorePerAlleybiz {
	private String SAP_DATE;
	private String AlleybizCode;
	// 상권업종코드
	private String COBB_code;
	private int Store_count;
	private int SimilStore_count;
	private double Open_percent;
	private int Open_count;
	private double Close_percent;
	private int Close_count;
}
