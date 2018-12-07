package com.one.doo.loan.controller;

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

@RequestMapping("/admin")
@RestController
@Log4j
@AllArgsConstructor
public class ajaxLoanController {
	private LPBUService service;

	@GetMapping(value = "/{rno}", 
			produces = { MediaType.APPLICATION_XML_VALUE,  MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<LPBU> get(@PathVariable("lpbuNo") int lpbuNo) {
		log.info("get: " + lpbuNo);
		return null; 
				//new ResponseEntity<>(service.toString(), HttpStatus.OK);
	}

	
	
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH }, 
								value = "/{lpbuNo}", consumes = "application/json", 
								produces = {MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> answerLpbu(@RequestBody LPBU lpbu,  @PathVariable("lpbuId") int lpbuId) {
		lpbu.setLpbuNum(lpbuId);

		return service.answerLPBU(lpbuId) == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

	@DeleteMapping(value = "/{lpbuNo}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("lpbuId") int lpbuId) {
		
		log.info("remove: " + lpbuId);

		return service.deleteLPBU(lpbuId) == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

}

