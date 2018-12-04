package com.one.doo.outperalleybiz.domain;

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
public class OutPerAlleybiz {
    private String OPA_DATE;     
    private int AlleybizCode;
    // SQL getInt에서 오버플로우 방지
    private long Total_out;               
    private long Food_out;
    private long Wear_out;
    private long Living_out;
    private long Cure_out;
    private long Traffic_out;
    private long Leisure_out;               
    private long Culture_out;
    private long Edu_out;
    private long Enjoy_out;
}
