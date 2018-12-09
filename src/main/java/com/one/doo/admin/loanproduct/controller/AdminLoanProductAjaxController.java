package com.one.doo.admin.loanproduct.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.one.doo.loan.domain.Loan;
import com.one.doo.loan.service.LoanService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/admin/loanProductAjax")
@RestController
@Log4j
@AllArgsConstructor
public class AdminLoanProductAjaxController {
	private LoanService service;

	
	
/*	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody Loan loan) {

		log.info("LOAN : " + loan);
		int insertCount = service.insertLoan(loan);
		log.info("Reply INSERT COUNT: " + insertCount);
		return insertCount == 1  
				?  new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/{loanId}", 
			produces = { MediaType.APPLICATION_XML_VALUE,  MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<Loan> get(@PathVariable("loanId") int loanId) {
		log.info("get: " + lpbuNo);
		return null; 
				//new ResponseEntity<>(service.toString(), HttpStatus.OK);
	}


	@DeleteMapping(value = "/{lpbuNo}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("lpbuId") int lpbuId) {
		
		log.info("remove: " + lpbuId);

		return service.deleteLPBU(lpbuId) 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}*/

}

