package com.one.doo.areacode.domain;

import com.one.doo.loantarget.domain.LoanTarget;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 지역코드
 * 
 * @author 박호준
 *
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class AreaCode {
	
	// 행정동코드
    private int AreaCode;
    // 행정동코드명
    private String AreaCode_Name; 
    // 시군구코드
    private int AdministrativeDistrictCode;
    // 시군구코드명
    private String AdministrativeDistrictCodeName;                  
}
