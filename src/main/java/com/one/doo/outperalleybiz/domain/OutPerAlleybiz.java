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
    private int Total_out;               
    private int Food_out;
    private int Wear_out;
    private int Living_out;
    private int Cure_out;
    private int Traffic_out;
    private int Leisure_out;               
    private int Culture_out;
    private int Edu_out;
    private int Enjoy_out;
}
