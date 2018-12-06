package com.one.doo.loan.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.one.doo.board.domain.Board;
import com.one.doo.board.domain.Criteria;
import com.one.doo.board.domain.Page;
import com.one.doo.loan.domain.LPBU;
import com.one.doo.loan.service.LPBUService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * 유저별 대출상담 예약, 조회를 위한 컨트롤러
 * @author 박의수
 */

@Controller
@Log4j
@RequestMapping("/loan")
@AllArgsConstructor
public class LPBUController{
	
	private LPBUService service;
	
	@PostMapping("/reserveLoan")
	public String register(LPBU lpbu, RedirectAttributes rttr) {
		
		log.info("예약확인 : " + lpbu);
		service.insertLPBU(lpbu);
		rttr.addFlashAttribute("list", service.listLPBU(lpbu.getUserId()));
		rttr.addFlashAttribute("result", "상담예약이 완료되었습니다.");
		return "redirect:/";
	}
	
	@GetMapping("/reservelist")
	public void list(String userId, Model model) {
		model.addAttribute("list", service.listLPBU(userId));
	}
}





