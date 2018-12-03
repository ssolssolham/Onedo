package com.one.doo.review.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.one.doo.article.domain.Article;
import com.one.doo.article.domain.Criteria;
import com.one.doo.article.domain.Page;
import com.one.doo.article.service.ArticleService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
/**
 * 리뷰게시판 컨트롤러
 * @author siwonPark
 *
 */
@Controller
@Log4j
@RequestMapping("/review")
@AllArgsConstructor
public class ReviewController {
	
	@Inject
	ArticleService service;
	
	// 후기 게시판 매핑...
	// /review/list                 : 후기글 전체목록
	// /review/regist               : 후기글 작성
	// /review/detail{num}          : 후기글상세
	// /review/modify{article(json)}: 후기수정
	// /review/remove{num}          : 삭제
	
	
	@GetMapping("/list")
	public String list(Criteria cri, Model model) {
		log.info("후기게시판 list요청..");
		
		model.addAttribute("list", service.getReviewList(cri));
		//model.addAttribute("pageMaker", new Page(cri, 123)); //임의로 123(total값)
		
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new Page(cri, total));
		return "review/review";
	}
	
	@GetMapping("/review")
	public String review() {
		return "review/review";
	}

	@GetMapping("/detail")
	public String get(@RequestParam("article_num") Long article_num, @ModelAttribute("cri")Criteria cri, Model model) {
		log.info("후기게시판 상세보기요청");
		model.addAttribute("review", service.get(article_num));
		return "review/reviewDetail";
		
	}
	
	// 후기등록
	@GetMapping("/register")
	public String register(Article article, RedirectAttributes rttr) {
		log.info("후기등록 요청..컨트롤러");
		log.info("들어온 후기글객체: "+article);
		service.register(article);
		rttr.addFlashAttribute("result", article.getArticle_num());
		//등록 후 보내주는거 다시좀봐야해..
		return "redirect:/review/list";
	}
	
	// 후기수정
	@GetMapping("/modify")
	public String modify(Article article, RedirectAttributes rttr) {
		log.info("후기수정요청");
		log.info("수정된 후기글객체: "+article);
		service.modify(article);
		rttr.addFlashAttribute("result", article.getArticle_num());
		return "redirect:/review/detail?article_num="+article.getArticle_num();
//		return "/review/reviewDetail?article_num="+article.getArticle_num();
	}
	
	// 후기삭제
	@GetMapping("/remove")
	public String remove(@RequestParam("article_num") Long article_num) {
		log.info("삭제요청");
		service.remove(article_num);
		return "redirect:/review/list";
	}
	
//	@RequestMapping("/")
//	public String home() {
//		return "review/review";
//	}
	

	
}
