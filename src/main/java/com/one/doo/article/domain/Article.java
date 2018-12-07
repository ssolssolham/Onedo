package com.one.doo.article.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Article {
	private Long article_num;
	private Long bno;
	private String userid;
	private String title;
	private String content;
	private String regdate;
	private String updateDate;
	
	private int replycnt;
	private String enabled; //공지: 게시여부, 리뷰: 삭제여부
	
	private String article_pw;
	// 파일추가시 추가됨
	// private List<ArticleAttach> attachList;
}
