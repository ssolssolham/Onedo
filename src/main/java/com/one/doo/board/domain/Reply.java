package com.one.doo.board.domain;

import java.util.Date;
import lombok.Data;

@Data
public class Reply {

	private Long rno; 		 // 댓글번호
	private Long article_num;// 게시글번호
	private String reply;	 // 게시글내용
	private String replyer;	 // 게시글작성자
	private Date replyDate;	 // 게시글등록일
	private Date updateDate; // 게시글수정일
	
}
