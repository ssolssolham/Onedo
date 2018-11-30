package com.one.doo.cobb.domain;

import com.one.doo.loanproduct.domain.LoanProduct;

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
public class Cobb {
	// 상권업종코드
    private String COBB_code;
    // 상권업종코드명
    private String COBB_TITLE;
}
