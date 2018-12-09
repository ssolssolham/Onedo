package com.one.doo.admin.loanproduct.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.one.doo.board.domain.Criteria;
import com.one.doo.board.domain.Page;
import com.one.doo.loan.service.LoanService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/loanProduct")
@AllArgsConstructor
public class AdminLoanProductController {

	private LoanService service;
	
	@GetMapping("/")
	public String list(Criteria cri, Model model) {
		log.info("list : " + cri);
		int total = service.getTotal(cri);
		System.out.println(total);
		model.addAttribute("adminLoanList", service.getListWithPaging(cri));
		model.addAttribute("pageMaker", new Page(cri, total));
		System.out.println("들어왔니?");
		return "admin/loanProduct/product";
	}
}
