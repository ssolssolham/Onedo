package com.one.doo.admin.common.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.doo.admin.home.service.AdminHomeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Log4j
@Controller
@RequestMapping("/admin")
@AllArgsConstructor
public class AdminHomeController {
	
	@Inject
	private AdminHomeService adminHomeService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping("/")
	public String home(Locale locale, Model model) {
		List<Object> list = adminHomeService.adminFirstStep();
		// 	
		model.addAttribute("statByDay",list);
		
		return "admin/index";
	}
	
	
	
}
