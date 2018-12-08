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
	
	@GetMapping("/list")
	public String list(Criteria cri, Model model) {
		log.info("문의게시판 list요청");
		
		model.addAttribute("list", service.getQnaList(cri));
		int totalNum = service.getQArticleNum();
		int total = service.getQnaTotal(cri); //with 검색조건
		model.addAttribute("pageMaker", new Page(cri, total));
		model.addAttribute("totalCnt", totalNum);
		return "qna/qna";
	}
	
	@GetMapping("/detail")
	public String get(@RequestParam("article_num") Long article_num, 
					 @ModelAttribute("cri") Criteria cri, 
					 Model model) {
		log.info("문의게시판 상셉기 요청 컨트롤러");
		model.addAttribute("qna", service.get(article_num));
		log.info("되돌아갑니당");
		return "qna/qnaDetail";
	}
	
	@GetMapping("/register")
	public String register(Article article, RedirectAttributes rttr) {
		log.info("문의 등록요청");
		service.register(article);
		rttr.addFlashAttribute("qnaRegiRes", "success");
		return "redirect:/qna/list";
	}
	
	@GetMapping("/modify")
	public String modify(Article article, RedirectAttributes rttr) {
		log.info("문의수정컨트롤러");
		log.info("수정 article객체: "+article);
		service.modify(article);
		rttr.addFlashAttribute("qnaModRes", "success");
		return "redirect:/qna/detail?article_num="+article.getArticle_num();
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("article_num")Long article_num, RedirectAttributes rttr) {
		log.info("문의삭제요청");
		service.remove(article_num);
		rttr.addFlashAttribute("qnaDelRes", "success");
		return "redirect:/qna/list";
	}
}
