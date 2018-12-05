package com.one.doo.admin.member.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.doo.article.domain.Criteria;
import com.one.doo.article.domain.Page;
import com.one.doo.member.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/member")
@Log4j 
public class AdminMemberController {
	
	private MemberService service;
	
	@RequestMapping("/")
	public String home(Criteria cri, Model model) {
		log.info("멤버관리 메인페이지 요청 컨트롤러");
		int total = service.getTotalCount();
		log.info("총회원수: "+total);
		model.addAttribute("users", service.getListWithCri(cri));
		model.addAttribute("pageMaker", new Page(cri, total));
		return "admin/member/member";
	}
	
	@RequestMapping("/list")
	public String list(Criteria cri, Model model) {
		log.info("admin member : " + cri);
		int total = service.getTotalCount();
		
		model.addAttribute("userlist", service.getListWithCri(cri));
		model.addAttribute("pageMaker", new Page(cri, total));
		return "admin/member/member";
	}
	
	//@RequestMapping("/modifyName")
	public String modifyName(Locale locale, Model model) {
		// 회원 이름 수정
		
		return "modifyForm";
	}
	
	//@RequestMapping("/modifyName")
	public String withdraw(Locale locale, Model model) {
		// 회원 강제 탈퇴
		
		return "withdraw";
	}
}
