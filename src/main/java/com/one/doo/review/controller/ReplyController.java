package com.one.doo.review.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.one.doo.article.domain.Criteria;
import com.one.doo.article.domain.Reply;
import com.one.doo.article.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * 댓글처리를 위한 rest컨트롤러
 * @author siwonPark
 */
@RestController
@Log4j
@RequestMapping("/replies")
@AllArgsConstructor
public class ReplyController {
	
	@Inject
	private ReplyService service;
	
	// 댓글작성
	@PostMapping(value="/new", consumes="application/json", 
							   produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody Reply reply){
		log.info("댓글작성컨트롤러.."+reply);
		int insertCount = service.register(reply);
		log.info("댓글작성 수: "+insertCount);
		return insertCount == 1 ?
				new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	// 게시물에대한 댓글목록
	@GetMapping(value="/pages/{article_num}/{page}",
				produces = {
						MediaType.APPLICATION_JSON_UTF8_VALUE,
						MediaType.APPLICATION_XML_VALUE	})
	public ResponseEntity<List<Reply>> getList(
				@PathVariable("page") int page,
				@PathVariable("article_num") Long article_num){
		
		log.info("댓글목록 요청컨트롤러");
		Criteria cri = new Criteria(page, 10);
		log.info("criteria값: "+cri);
		
		return new ResponseEntity<>(service.getList(cri, article_num), HttpStatus.OK);
	}
	
	// 조회
	@GetMapping(value="/{rno}",
				produces = {
						MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE
				})
	public ResponseEntity<Reply> get(@PathVariable("rno") Long rno){
		log.info("특정댓글조회요청 컨트롤러"+rno);
		return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
	}
	
	// 댓글삭제
	@DeleteMapping(value="/{rno}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno")Long rno){
		log.info("댓글삭제요청"+rno);
		return service.remove(rno) == 1 ?
				new ResponseEntity<>("success", HttpStatus.OK) :
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 댓글수정
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH},
					value="/{rno}",
					consumes="application/json",
					produces= { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(
				@RequestBody Reply reply, 
				@PathVariable("rno") Long rno) {
		
		reply.setRno(rno);
		log.info("댓글수정요청컨트롤러"+rno);
		log.info("수정할댓글: "+reply);
		
		return service.modify(reply) == 1?
				new ResponseEntity<>("success", HttpStatus.OK) :
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	
	
	
	
}
