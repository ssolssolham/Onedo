package com.one.doo.loan.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
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
