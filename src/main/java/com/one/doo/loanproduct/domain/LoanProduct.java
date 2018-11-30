package com.one.doo.loanproduct.domain;

import com.one.doo.loancompany.domain.LoanCompany;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 대출상품
 * 
 * @author 박호준
 *
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class LoanProduct {
	/*
	 * Date는 String으로 받습니다.
	 */

	// 상품번호
	private int loan_id;
	// 기관번호
	private int loanComp_id;
	// 대출대상 유형
	private int target_id;
	// 상품유형
	private String loan_division;
	// 상품구분
	private String loan_category;
	// 상품이름
	private String loan_name;
	// 상품내용
	private String loan_content;
	// 업데이트날짜
	private String loanUpdate_date;
	// 최소재직(사업)기간
	private String term_service;
	
	/* int -> String으로 바뀜(호준) */
	// 최소소득조건
	private int money_condition_min;
	// 최대소득조건
	private int money_condition_max;
	/* ***************************** */
	
	// 대출대상유형설명
	private String target_description;
	// 대출상세1
	private String target_detail1;
	// 대출상세2
	private String target_detail2;
	// 대출상세3
	private String target_detail3;
	// 금리구분
	private String interestRate_category;
	
	/* int -> String으로 바뀜(호준) */
	// 대출최저금리
	private double interestRate_min;
	// 대출최고금리
	private double interestRate_max;
	// 대출최저한도
	private int creditLine_min;
	// 대출최고한도
	private int creditLine_max;
	/* ***************************** */
	
	// 대출한도상세
	private String creditLine_desc;
	// 대출기간최소
	private String loanPeriod_min;
	// 대출기간최대
	private String loanPeriod_max;
	// 대출기간설명
	private String loanPeriod_desc;
	// 상환방식
	private String repayment_way;
	// 상세페이지URL
	private String detail_url;
}
