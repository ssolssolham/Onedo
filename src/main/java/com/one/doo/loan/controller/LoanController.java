package com.one.doo.loan.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.doo.loan.domain.Loan;
import com.one.doo.loan.domain.Parameter;
import com.one.doo.loan.service.LoanService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * 대출상품 추천 기능을 위한 세부컨트롤러
 * @author 박의수
 */

@Controller
@Log4j
@RequestMapping("/loan")
@AllArgsConstructor
public class LoanController{
	
	private LoanService service;
	
	/**
	 * 사용자 조건에 맞게 추천된 대출상품 리스트 반환
	 * @param param
	 * @param model
	 * @return 결과페이지
	 */
	@RequestMapping(value = "/loan", produces = "application/json; charset=utf8")
	public @ResponseBody Loan loan(@RequestParam(value="loanId") int loanId) {
		System.out.println("들어옴");
		return service.readLoan(loanId);
	}
	
	@GetMapping("/list")
	public String list(@ModelAttribute("param") Parameter param, Model model) {
		log.info("list : " + param);
		System.out.println(param instanceof Parameter);
		System.out.println(service.getLoanList(param));
		model.addAttribute("loanlist", service.getLoanList(param));
		model.addAttribute("param", param);
		return "/loanResult/loanResult";
	}
	
}






