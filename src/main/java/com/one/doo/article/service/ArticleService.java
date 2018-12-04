package com.one.doo.article.service;

import java.util.List;

import com.one.doo.article.domain.Article;
import com.one.doo.article.domain.Criteria;

/**
 * 게시글 관련 서비스
 * @author SiwonPark
 */
public interface ArticleService {
	
	// 게시글등록
	public void register(Article article);
	
	// 게시글조회
	public Article get(Long article_num);
	
	// 게시글수정
	public boolean modify(Article article);
	
	// 게시글 삭제
	public boolean remove(Long article_num);
	
	// 후기게시글 리스트
	public List<Article> getReviewList(Criteria cri);
	
	// 공지글 리스트
	public List<Article> getNoticeList();
	
	// 게시글상태변경
	public int changeStatus(Long article_num);
	
	// 검색조건에 맞는 총 게시글수 
	public int getTotal(Criteria cri);
}
