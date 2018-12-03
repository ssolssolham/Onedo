package com.one.doo.loan.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.one.doo.loan.domain.CreditRank;
import com.one.doo.loan.service.CreditRankService;
import com.one.doo.loan.service.LoanService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * 신용등급별 대출이율 비동기 통신을 위하 컨트롤러
 * @author 박의수
 */

@RestController
@Log4j
@RequestMapping("/loan")
@AllArgsConstructor
public class CreditRankController{
	
	private CreditRankService service;
	
	@GetMapping(value="/{rateId}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<CreditRank> getCreditRate(@PathVariable("rateId") int rateId) {
		System.out.println("비동기 들어옴 ?");
		log.info("get: " + rateId + "등급");
		System.out.println("비동기 나감 ?");
		return new ResponseEntity<>(service.readRate(rateId), HttpStatus.OK);
	}
}






