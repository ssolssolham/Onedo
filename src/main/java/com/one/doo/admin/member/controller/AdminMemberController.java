package com.one.doo.admin.member.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.one.doo.article.domain.Criteria;
import com.one.doo.article.domain.Page;
import com.one.doo.member.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/member")
@Log4j 
public class AdminMemberController {
	@Inject
	private MemberService service;
	
	@GetMapping("/")
	public String home(Criteria cri, Model model) {
		log.info("멤버관리 메인페이지 요청 컨트롤러");
		
		int total = service.getMemCnt();
		log.info("총회원수: "+total);
		model.addAttribute("users", service.getListWithCri(cri));
		model.addAttribute("pageMaker", new Page(cri, total));
		return "admin/member/member";
	}
	
	@GetMapping("/modName")
	public String modifyName(@RequestParam("username") String username, @RequestParam("userid") String userid) {
		log.info("이름수정요청");
		log.info("바꿀이름: " +username+"\n바꿀userid: "+userid);
		service.modifyName(userid, username);
		return "redirect:/admin/member/";
	}
	
	@GetMapping("/withdraw")
	public String withdraw(String userid) {
		log.info("회원강제탈퇴요청");
		log.info("탈퇴시킬 회원 아이디: "+userid);
		service.updateEnabled(userid);
		return "redirect:/admin/member/";
	}
	
	@GetMapping("/grantAuth")
	public String grantAuth(String userid, List<String> roles) {
		log.info("권한부여 요청");
		for (String role : roles) {
			service.grantAuth(userid, role);
		}
		return "redirect:/admin/member/";
	}
	
}
