package com.one.doo.admin.table.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.doo.metadata.table.service.TableService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * 영속 테이블관리를 위한 컨트롤러
 * @author siwonPark
 */
@Controller
@Log4j
@RequestMapping("/admin/table")
@AllArgsConstructor
public class AdminTableController {
	
	@Inject
	private TableService service;
	
	@RequestMapping("/")
	public String home(Model model) {
		log.info("table탭 메인");
		model.addAttribute("tables", service.getTableList());
		return "admin/table/table";
	}

}
