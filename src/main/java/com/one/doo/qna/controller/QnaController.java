package com.one.doo.qna.controller;

import javax.inject.Inject;

import org.springframework.jmx.export.annotation.ManagedAttribute;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.one.doo.article.service.ArticleService;
import com.one.doo.article.domain.Article;
import com.one.doo.article.domain.Criteria;
import com.one.doo.article.domain.Page;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
/**
 * 문의게시판 컨트롤러
 * @author siwonPark
 */
@Controller
@Log4j
@RequestMapping("/qna")
@AllArgsConstructor
public class QnaController {

	@Inject
	private ArticleService service;
	
	@RequestMapping("/")
	public String list(Criteria cri, Model model) {
		log.info("문의게시판 list요청");
		
		model.addAttribute("list", service.getQnaList(cri));
		int total = service.getQnaTotal(cri);
		model.addAttribute("pageMaker", new Page(cri, total));
		return "qna/qna";
	}
	
	@GetMapping("/detail")
	public String get(@RequestParam("article_num") Long article_num, 
					 @ModelAttribute("cri") Criteria cri, 
					 Model model) {
		log.info("문의게시판 상셉기 요청 컨트롤러");
		model.addAttribute("qna", service.get(article_num));
		return "qna/qnaDetail";
	}
	
	@GetMapping("/register")
	public String register(Article article, RedirectAttributes rttr) {
		log.info("문의 등록요청");
		service.register(article);
		rttr.addFlashAttribute("qnaRegiRes", "success");
		return "redirect:/qna/";
	}
	
}
