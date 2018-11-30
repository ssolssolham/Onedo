package com.one.doo.inputinfo.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.one.doo.board.domain.Board;
import com.one.doo.board.domain.Criteria;
import com.one.doo.board.domain.Page;
import com.one.doo.board.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/inputInfo")
@AllArgsConstructor
public class InputInfoController {
	
	@RequestMapping("/")
	public String home() {
		return "inputInfo/inputInfo";
	}
	
}
