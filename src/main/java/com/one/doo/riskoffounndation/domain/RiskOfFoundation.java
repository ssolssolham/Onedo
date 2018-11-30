package com.one.doo.riskoffounndation.domain;

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
public class RiskOfFoundation {
	
    private String ROFPD_DATE;     
    private int AreaCode;
    private double ROF;         
    private int ROF_code;
    private String ROF_name;
}
