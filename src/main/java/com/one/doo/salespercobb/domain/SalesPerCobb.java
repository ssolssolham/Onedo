package com.one.doo.salespercobb.domain;

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
public class SalesPerCobb {
    private String SPC_DATE;     
    private int AlleybizCode;
    private String COBB_code;
    private double Avg_work;               
    private double Survival1;
    private double Survival1_2;
    private double Survival2_3;
    private double Survival3_5;
    private double Survival5;
}
