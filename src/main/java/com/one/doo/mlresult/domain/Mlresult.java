package com.one.doo.mlresult.domain;

import com.one.doo.metadata.log.domain.Log;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Mlresult {
	private int MLR_DATE;
	private int ALLEYBIZCODE;
	private int ESTMT_SALES;
	private int ESTMT_SALES_RANK;
	private int ESTMT_ROF_VALUE;
	private int ESTMT_ROF_CODE;
	private int ESTMT_OI_VALUE;
	private int ESTMT_OI_CODE;
	private int ESTMT_AI_VALUE;
	private int ESTMT_AI_CODE;
	private int ESTMT_GI_VALUE;
	private int ESTMT_GI_CODE;
	private int ESTMT_SI_VALUE;
	private int ESTMT_SI_CODE;
}
