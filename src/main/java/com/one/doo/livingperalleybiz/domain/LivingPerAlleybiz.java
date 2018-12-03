package com.one.doo.livingperalleybiz.domain;

import com.one.doo.facilitiesperalleybiz.domain.FacilitiesPerAlleybiz;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

// 상권별상주인구 테이블 생성 

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class LivingPerAlleybiz {
private String  LAP_DATE;     
    private int AlleybizCode;
    private int TotalLiving;
    private int MaleLiving;               
    private int FemaleLiving;
    private int Living10;
    private int Living20;
    private int Living30;
    private int Living40;
    private int Living50;
    private int Living60;
    private int TotalHousehold;
}
