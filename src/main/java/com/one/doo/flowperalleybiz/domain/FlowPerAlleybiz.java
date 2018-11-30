package com.one.doo.flowperalleybiz.domain;

import com.one.doo.indexperalleybiz.domain.IndexPerAlleybiz;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 상권별 유동인구
 * 
 * @author 박호준
 * 날짜 : String 
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class FlowPerAlleybiz {
	
	// 날짜
    private String FPA_DATE;
    
    // 상권코드
    private int AlleybizCode;
    // 총 유동인구 수
    private int Total_flow;
    // 남성 유동인구 수
    private int Male_flow;
    // 여성 유동인구 수
    private int Female_flow;
    
    // 연령대 10 유동인구 수
    private int Flow10;
    // 연령대 20 유동인구 수
    private int Flow20;
    // 연령대 30 유동인구 수
    private int Flow30;
    // 연령대 40 유동인구 수
    private int Flow40;
    // 연령대 50 유동인구 수
    private int Flow50;
    // 연령대 60 유동인구 수
    private int Flow60;
    // 시간대 1 유동인구 수
    private int FlowTime1;
    // 시간대 2 유동인구 수
    private int FlowTime2;
    // 시간대 3 유동인구 수
    private int FlowTime3;
    // 시간대 4 유동인구 수
    private int FlowTime4;
    // 시간대 5 유동인구 수
    private int FlowTime5;
    // 시간대 6 유동인구 수
    private int FlowTime6;
    
    // 월요일 유동인구 수
    private int Flow_mon;
    // 화요일 유동인구 수
    private int Flow_tue;
    // 수요일 유동인구 수
    private int Flow_wed;
    // 목요일 유동인구 수
    private int Flow_thr;
    // 금요일 유동인구 수
    private int Flow_fri;
    // 토요일 유동인구 수
    private int Flow_sat;
    // 일요일 유동인구 수
    private int Flow_sun;
}
