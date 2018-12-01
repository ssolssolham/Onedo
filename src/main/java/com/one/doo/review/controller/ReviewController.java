package com.one.doo.review.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.one.doo.article.domain.Criteria;
import com.one.doo.article.service.ArticleService;
import com.one.doo.article.domain.Page;

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
		log.info("list: "+cri);
		
		model.addAttribute("list", service.getReviewList(cri));
		model.addAttribute("pageMaker", new Page(cri, 123)); //임의로 123(total값)
		
		int total = service.getTotal(cri);
		//model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "review/review";
	}

	@GetMapping("/detail")
	public void get(@RequestParam("article_num") Long article_num, Model model) {
		log.info("후기게시판 상세보기요청");
		
		
	}
	
//	@RequestMapping("/")
//	public String home() {
//		return "review/review";
//	}
	
	@RequestMapping("/detail")
	public String reviewDetail() {
		return "review/reviewDetail";
	}
	
}
