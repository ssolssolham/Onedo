package com.one.doo.loancompany.domain;

import com.one.doo.realestate.domain.Realestate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 취급기관
 * 
 * @author 박호준
 *
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class LoanCompany {
	
	// 기관번호
	private int loanComp_id;
	// 기관명
	private String loanComp_name;
	// 대표번호
	private String present_num;
	// 서브번호
	private String sub_num;
}
