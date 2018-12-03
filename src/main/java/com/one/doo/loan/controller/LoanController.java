package com.one.doo.loan.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.one.doo.board.domain.Board;
import com.one.doo.board.domain.Criteria;
import com.one.doo.board.domain.Reply;
import com.one.doo.loan.domain.CreditRank;
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
	
	@GetMapping("/list")
	public String list(@ModelAttribute("param") Parameter param, Model model) {
		log.info("list : " + param);
		System.out.println(param instanceof Parameter);
		System.out.println(service.getLoanList(param));
		model.addAttribute("loanlist", service.getLoanList(param));
		model.addAttribute("param", param);
		return "/loanResult/loanResult";
	}
	
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String registerLoan(Loan loan, RedirectAttributes rttr) {
		log.info("등록된 대출상품 : " + loan);
		service.insertLoan(loan);
		rttr.addFlashAttribute("result", loan.getLoanId());
		return "redirect:/admin/loanlist";
	}
	
	
	@PostMapping("/update")
	public String modifyLoan(Loan loan, RedirectAttributes rttr) {
		log.info("수정된 대출상품 : " + loan + "번");
		
		if(service.updateLoan(loan)) {
			rttr.addFlashAttribute("result", "수정 성공"); 
		}
		
		return "redirect:/admin/loanlist";
	}
	
	
	@GetMapping(value="/loan/{loanId}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<Loan> getCreditRate(@PathVariable("loanId") int loanId) {
		System.out.println("비동기 들어옴 ?");
		log.info("get: " + loanId + "등급");
		System.out.println("비동기 나감 ?");
		return new ResponseEntity<>(service.readLoan(loanId), HttpStatus.OK);
	}
}






