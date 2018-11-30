package com.one.doo.alleybiz.domain;

import com.one.doo.loanproduct.domain.LoanProduct;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 지역별 상권코드
 * 
 * @author 박호준
 *
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class AlleyBiz {
	
	// 상권코드
    private int AlleybizCode;
    // 상권코드명
    private String AlleybizCode_Name;
    // 행정동코드
    private int AreaCode;
}
