package com.one.doo.article.domain;

import java.util.Date;
import lombok.Data;

@Data
public class Reply {

	private Long rno; 		 // 댓글번호
	private Long article_num;// 게시글번호
	
	private String reply;	 // 게시글내용
	private String replyer;	 // 게시글작성자
	private String replyDate;	 // 게시글등록일
	private String updateDate; // 게시글수정일
	
}
