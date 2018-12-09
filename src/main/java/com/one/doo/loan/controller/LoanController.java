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
	
}






