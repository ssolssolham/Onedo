package com.one.doo.lpbu.controller;

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

@RequestMapping("/lpbu")
@RestController
@Log4j
@AllArgsConstructor
public class ajaxLPBUController {
	private LPBUService service;

	@GetMapping("/{lpbuNo}")
	public String cancle(@PathVariable("lpbuNo") int lpbuNo) {
		
		log.info("remove: " + lpbuNo);
		System.out.println("들어왔어유");

		// 지우기 전에 아이디 저장
		String userId = service.read(lpbuNo).getUserId();
		System.out.println(userId);
		
		// 지우기
		service.deleteLPBU(lpbuNo);
	
		
		return "<script>location.href = '/loan/reserveList?userId=" + userId +"'" +"</script>" ;
	}

}

