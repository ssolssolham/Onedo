package com.one.doo.admin.LPBU.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.one.doo.loan.domain.LPBU;
import com.one.doo.loan.service.LPBUService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/admin/lpbu")
@RestController
@Log4j
@AllArgsConstructor
public class AdminLPBUAjaxController {
	private LPBUService service;

	@GetMapping(value = "/{lpbuNo}", 
			produces = { MediaType.APPLICATION_XML_VALUE,  MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<LPBU> read(@PathVariable("lpbuNo") int lpbuNo) {
		log.info("get: " + lpbuNo);
		return null; 
				//new ResponseEntity<>(service.answerLPBU(lpbuNo), HttpStatus.OK);
	}

	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH }, 
								value = "/{lpbuNo}", consumes = "application/json", 
								produces = {MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> answerLpbu(@RequestBody LPBU lpbu,  @PathVariable("lpbuNo") int lpbuNo) {
		lpbu.setLpbuNo(lpbuNo);
		return service.answerLPBU(lpbuNo) 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}
}

