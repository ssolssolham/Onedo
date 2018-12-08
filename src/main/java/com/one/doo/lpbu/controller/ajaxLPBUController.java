package com.one.doo.lpbu.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.one.doo.loan.domain.LPBU;
import com.one.doo.loan.service.LPBUService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/lpbu")
@RestController
@Log4j
@AllArgsConstructor
public class ajaxLPBUController {
	private LPBUService service;

	@DeleteMapping(value = "/{lpbuNo}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> cancle(@PathVariable("lpbuNo") int lpbuNo) {
		
		log.info("remove: " + lpbuNo);

		return service.deleteLPBU(lpbuNo) 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

}

