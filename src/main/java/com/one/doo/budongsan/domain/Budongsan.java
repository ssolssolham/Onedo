package com.one.doo.budongsan.domain;

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
public class Budongsan {
	private int mamul_no;
	private String img_url;
	private String heating_type;
	private String mamul_type;
	private String elevator;
	// 보증
	private String bozeung;
	private String privilege_money;
	private String parking;
	private String manage_money;
	private String toilet;
	private String floor;
	private String interior;
	private String square;
	private String live_possible;
	private String recommand;
	private String made_date;
	private String options;
	private String agent_name;
	private String agent_address;
	private String phonenumber;
	
}
