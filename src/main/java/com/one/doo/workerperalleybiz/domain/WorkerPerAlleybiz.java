package com.one.doo.workerperalleybiz.domain;

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
public class WorkerPerAlleybiz {
    private String WPA_DATE;     
    private int AlleybizCode;
    private int Total_work;               
    private int Male_work;
    private int Female_work;
    private int Work10;
    private int Work20;
    private int Work30;
    private int Work40;               
    private int Work50;
    private int Work60;
}
