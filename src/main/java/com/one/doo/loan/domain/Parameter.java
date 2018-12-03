package com.one.doo.loan.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Parameter {

	private String loanCategory;
	private int requiredMoney;
	private double resultRate;
	private int targetNum;
	private int termService;
	private String securityType;
	
	public Parameter() {
		super();
	}

	public Parameter(String loanCategory, int requiredMoney, double resultRate, int targetNum, int termService, String securityType) {
		this.loanCategory = loanCategory;
		this.requiredMoney = requiredMoney;
		this.resultRate = resultRate;
		this.targetNum = targetNum;
		this.termService = termService;
		this.securityType = securityType;
	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
		.queryParam("loanCategory", this.getLoanCategory())
		.queryParam("requiredMoney", this.getRequiredMoney())
		.queryParam("resultRate", this.getResultRate())
		.queryParam("targetNum", this.getTargetNum())
		.queryParam("termService", this.getTermService())
		.queryParam("securityType", this.getSecurityType());
		return builder.toUriString();
	}

}
