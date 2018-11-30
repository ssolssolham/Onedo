package com.one.doo.admin.stats.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/admin/stats")
public class AdminStatsController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminStatsController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "admin/stats/stats";
	}
	
	//@RequestMapping("/analysis")
	public String analysis(Locale locale, Model model) {
		
		return "home";
	}	
	
	//@RequestMapping("/consult")
	public String consult(Locale locale, Model model) {
		
		return "home";
	}
	
	//@RequestMapping("/connection")
	public String connection(Locale locale, Model model) {
		
		return "home";
	}
	
	@RequestMapping("/realestateRank")
	public String realestateRank(Locale locale, Model model) {
		
		return "home";
	}
	
	@RequestMapping("/loanProductRank")
	public String loanProductRank(Locale locale, Model model) {
		
		return "home";
	}
}
