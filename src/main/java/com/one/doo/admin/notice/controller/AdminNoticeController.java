package com.one.doo.admin.notice.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.one.doo.article.domain.Article;
import com.one.doo.article.service.ArticleService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
@RequestMapping("/admin/notice")
@AllArgsConstructor
public class AdminNoticeController {
	
	@Inject
	private ArticleService service;
	
	// 공지리스트 get(공지탭 화면)
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		log.info("관리자 공지관리 메인홈");
		
		model.addAttribute("notices", service.getNoticeList());
		
		return "admin/notice/notice";
	}
	
	// 공지등록화면
	@RequestMapping("/enrollForm")
	public String enroll(Locale locale, Model model) {
		//logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "admin/notice/enroll";
	}
	// 공지 등록
	@GetMapping("/register")
	public String register(Article article, RedirectAttributes rttr) {
		log.info("공지등록");
		service.register(article);
		rttr.addFlashAttribute("result", article.getArticle_num());
		return "redirect:/admin/notice/";
	}
	
	// 공지확인(read)
	@GetMapping("/get")
	public String get(@RequestParam("article_num")Long article_num, Model model) {
		log.info("공지 상세보기"+article_num);
		model.addAttribute("notice", service.get(article_num));
		return "admin/notice/get";
		
	}
	
}
