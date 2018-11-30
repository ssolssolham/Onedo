package com.one.doo.main.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
