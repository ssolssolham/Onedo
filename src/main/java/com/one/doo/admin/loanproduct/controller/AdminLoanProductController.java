package com.one.doo.admin.loanproduct.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.one.doo.board.domain.Criteria;
import com.one.doo.board.domain.Page;
import com.one.doo.loan.domain.Loan;
import com.one.doo.loan.service.LoanService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/loanproduct")
@AllArgsConstructor
public class AdminLoanProductController {

	private LoanService service;
	
	@GetMapping("/")
	public String list(Criteria cri, Model model) {
		log.info("list : " + cri);
		int total = service.getTotal(cri);
		
		model.addAttribute("list", service.getListWithPaging(cri));
		model.addAttribute("pageMaker", new Page(cri, total));
		return "admin/loanproduct/product";
	}
		
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String register(Loan loan, RedirectAttributes rttr) {
		log.info("등록된 글 : " + loan);
		service.insertLoan(loan);
		rttr.addFlashAttribute("result", loan.getLoanId());
		return "redirect:/board/list";
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("loanId") int loanId, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or modify");
		model.addAttribute("board", service.readLoan(loanId));
	}
	
	@PostMapping("/modify")
	public String modify(Loan loan, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("수정 게시글 : " + loan);
		
		if(service.updateLoan(loan)) {
			rttr.addFlashAttribute("result", "수정 성공");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/list" + cri.getListLink();
	}
	
	@PostMapping("/remove")
	public String remove (@RequestParam("loanId") int loanId, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("판매종료된 상품 : " + loanId);
		if(service.remove(loanId)) {
			rttr.addFlashAttribute("result", "success");
		}
		
/*		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());*/
		
		return "redirect:/board/list" + cri.getListLink();
	}
	
}
