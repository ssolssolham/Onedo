package com.one.doo.admin.rest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * 데이터 전달 및 url매핑
 * @author siwonPark
 */
@Controller
@Log4j
@RequestMapping("/admin/rest")
@AllArgsConstructor
public class AdminRestController {
	
	@RequestMapping("/")
	public String home(Model model) {
		log.info("rest탭 메인");
		return "admin/rest/rest";
	}
}
