package com.one.doo.loan.domain;

import lombok.Data;

@Data
public class LPBU {
	private int lpbuNo;
	private String userId;
	private int loanId;
	private String reserveTime;
	private int requestBM;
	private int rateId;
	private String requestTime;
	private String reasonLoan;
	private String userPhone;
	private boolean isAnswered;
	private String birthdate;
}
