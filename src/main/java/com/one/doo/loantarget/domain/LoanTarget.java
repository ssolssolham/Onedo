package com.one.doo.loantarget.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 대출대상 유형
 * 
 * @author 박호준
 *
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class LoanTarget {
	
	// 대출대상 유형
	private int target_id;
	// 대출대상 명칭
	private String target_name;
	
}
