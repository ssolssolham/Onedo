package com.one.doo.loan.domain;

import lombok.Data;

@Data
public class CreditRank {
	private int rateId;
	private String rateName;
	private double rateLoan;
	private String rateDescription;
	private int kcbPointMin;
	private int kcbPointMax;
	private int nicePointMin;
	private int nicePointMax;
}
