package com.one.doo.admin.member.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.one.doo.article.domain.Criteria;
import com.one.doo.article.domain.Page;
import com.one.doo.auth.domain.Auth;
import com.one.doo.member.domain.AuthVO;
import com.one.doo.member.domain.Member;
import com.one.doo.member.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/member")
@Log4j 
public class AdminMemberController {
	@Inject
	private MemberService service;
	
	// 전체 회원리스트 get(페이징처리까지)
	@GetMapping("/")
	public String home(Criteria cri, Model model) {
		log.info("멤버관리 메인페이지 요청 컨트롤러");
		
		int total = service.getMemCnt();
		log.info("총회원수: "+total);
		model.addAttribute("users", service.getListWithCri(cri));
		model.addAttribute("pageMaker", new Page(cri, total));
		return "admin/member/member";
	}
	
	// 회원이름 수정
	@GetMapping("/modName")
	public String modifyName(Member member) {
		log.info("이름수정요청");
		String username = member.getUserName();
		String userid = member.getUserid();
		log.info("바꿀이름: " +username+"\n바꿀userid: "+userid);
		service.modifyName(userid, username);
		return "redirect:/admin/member/";
	}
	
	// 회원탈퇴처리
	@GetMapping("/withdraw")
	public String withdraw(@RequestParam("userid") String userid) {
		System.out.println("회원탈퇴요청");
		log.info("회원강제탈퇴요청");
		log.info("탈퇴시킬 회원 아이디: "+userid);
		service.updateEnabled(userid);
		return "redirect:/admin/member/";
	}
	
	@GetMapping("/grantAuth")
	public String grantAuth(AuthVO vo) {
		log.info("권한부여 요청");
		String userid = vo.getUserid();
		List<String> authList = vo.getAuthList();
		for (String role : authList) {
			service.grantAuth(userid, role);
		}
		return "redirect:/admin/member/";
	}

	
/*	@GetMapping("/grantAuth")
	public String grantAuth(String userid, List<String> roles) {
		log.info("권한부여 요청");
		for (String role : roles) {
			service.grantAuth(userid, role);
		}
		return "redirect:/admin/member/";
	}
*/	
}
