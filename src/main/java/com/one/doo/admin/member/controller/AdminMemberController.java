package com.one.doo.admin.member.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminMemberController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
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
