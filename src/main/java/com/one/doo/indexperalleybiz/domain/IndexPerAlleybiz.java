package com.one.doo.indexperalleybiz.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 상권별 지수지표
 * 
 * @author 박호준
 *
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class IndexPerAlleybiz {
	
	// 지수지표 날짜
	private String IPBD_DATE;
	// 상권코드
	private int AlleybizCode;
	// 상권업종코드명
	private String COBB_code;
	// 과밀지수 구간 코드
	private int OverIndexCode;
	// 활성도 지표 구간 코드
	private int ActivityIndexCode;
	// 성장성 지표 구간 코드
	private int GrowthIndexCode;
	// 안정성 지표 구간 코드
	private int StabilityIndexCode;
	// 과밀지수값
	private double OverIndex;
	// 활성도 지표값
	private double ActivityIndex;
	// 성장성 지표값
	private double GrowthIndex;
	// 안정성 지표값
	private double StabilityIndex;
}
