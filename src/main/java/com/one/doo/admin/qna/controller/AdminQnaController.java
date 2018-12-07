package com.one.doo.admin.qna.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.one.doo.article.domain.Criteria;
import com.one.doo.article.service.ArticleService;
import com.one.doo.article.service.ReplyService;
import com.one.doo.article.domain.Page;
import com.one.doo.article.domain.Reply;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * 문의글 관리
 * @author kosta
 */
@Controller
@Log4j
@RequestMapping("/admin/qna")
@AllArgsConstructor
public class AdminQnaController {
	
	@Inject
	private ArticleService service;
	@Inject
	private ReplyService rService;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String home(Criteria cri, Model model) {
		log.info("관리자 문의관리 홈요청");
		model.addAttribute("qnas", service.getQnaList(cri));
		int total = service.getQnaTotal(cri);
		model.addAttribute("pageMaker", new Page(cri, total));
		return "admin/qna/qnas";
	}
	
	@GetMapping("/addReply")
	public String addReply(Reply reply, RedirectAttributes rttr) {
		log.info("답변등록");
		rService.register(reply);
		log.info("답변등록성공~~");
		rttr.addFlashAttribute("replyRes", "success");
		return "redirect:/admin/qna/";
	}
}
