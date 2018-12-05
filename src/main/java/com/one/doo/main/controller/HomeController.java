package com.one.doo.main.controller;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.doo.article.service.ArticleService;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
public class HomeController {
	
	/**
	 * 홈(메인)   페이지 요청
	 * @return  논리적 뷰이름
	 */
	@RequestMapping("/")
	public String home() {
		return "index";
	}
	
	// 공지띄우기 위한 공지글을 불러오는 서비스 선언
	@Inject
	private ArticleService service;
	
	@RequestMapping("/noticePop")
	public String popup(Model model) {
		log.info("메인화면 요청시 공지팝업요청 컨트롤러");
		model.addAttribute("notices", service.getNoticeList());
		return "/includes/notices";
	}
}
