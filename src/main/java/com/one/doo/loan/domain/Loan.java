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
public class Loan {
	private int loanId;
	private int loanCompId;
	private int targetId;
	private String loanDivision;
	private String loanCategory;
	private String loanName;
	private String loanContent;
	private String loanUpdateDate;
	private int termService;
	private int moneyConditionMin;
	private int moneyConditionMax;
	private String targetDescription;
	private String targetDetail1;
	private String targetDetail2;
	private String targetDetail3;
	private String interestRateCategory;
	private double interestRateMin;
	private double interestRateMax;
	private int creditLineMin;
	private int creditLineMax;
	private String creditLineDesc;
	private int loanPeriodMin;
	private int loanPeriodMax;
	private String loanPeriodDesc;
	private String repaymentWay;
	private boolean holding;
	private int holdingMin;
	private int holdingMax;
	private boolean repay1;
	private boolean repay2;
	private boolean repay3;
	private boolean repayM;
	private String detailUrl;
	private String securityType;
}

