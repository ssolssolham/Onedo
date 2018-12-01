package com.one.doo.article.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.one.doo.article.domain.Article;
import com.one.doo.article.domain.Criteria;
import com.one.doo.article.mapper.ArticleMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ArticleServiceImpl implements ArticleService {
	
	@Inject
	private ArticleMapper mapper;

	// 게시글 생성
	@Override
	public void register(Article article) {
		log.info("게시글 생성 서비스: "+ article);
		mapper.insert(article);
	}
	
	// 게시글 조회(게시글번호로)
	@Override
	public Article get(Long article_num) {
		log.info(article_num+"번 게시글 조회 서비스");
		return mapper.read(article_num);
	}

	// 게시글 수정
	@Override
	public boolean modify(Article article) {
		log.info("게시글 수정서비스: "+article);
		return mapper.update(article)==1;
	}

	// 게시글삭제처리(enabled속성값 'N'로 수정)
	@Override
	public boolean remove(Long article_num) {
		log.info(article_num+"번 게시글 삭제처리 서비스");
		return mapper.delete(article_num)==1;
	}

	// 리뷰게시판의 모든 글 페이징처리와함께 get
	@Override
	public List<Article> getReviewList(Criteria cri) {
		log.info("리뷰게시글 리스트 with 페이징 서비스");
		return mapper.getListWithPaging(cri);
	}

	// 게시글 총 숫자..
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

}
