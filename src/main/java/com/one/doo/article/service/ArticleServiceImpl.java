package com.one.doo.article.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.one.doo.article.domain.Article;
import com.one.doo.article.domain.Criteria;
import com.one.doo.article.mapper.ArticleMapper;
import com.one.doo.board.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ArticleServiceImpl implements ArticleService {
	
	@Inject
	private ArticleMapper mapper;
	@Inject
	private BoardMapper bMapper; // 트랜잭션처리를 위한 보드매퍼

	// 게시글 생성
	@Transactional
	@Override
	public void register(Article article) {
		log.info("게시글 생성 서비스: "+ article);
		Long bno = article.getBno();
		
		mapper.insert(article);
		bMapper.updateCnt(bno);
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
//		log.info("criteria값: "+cri);
//		log.info("불러온리스트\n"+mapper.getListWithPaging(cri));
		return mapper.getListWithPaging(cri);
	}

	// 게시글 총 숫자..
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<Article> getNoticeList() {
		log.info("공지글 리스트 with 페이징");
		return mapper.getList(1L);
	}

	@Override
	public int changeStatus(Long article_num) {
		log.info("공지글 상태 변경");
		
		return mapper.changeArticleStatus(article_num);
	}

	@Override
	public List<Article> getQnaList(Criteria cri) {
		log.info("문의게시판목록서비스");
		return mapper.getQnaListWithPaging(cri);
	}

	@Override
	public int getQnaTotal(Criteria cri) {
		log.info("문의게시글 총 갯수");
		return mapper.getTotalQnaCount(cri);
	}

	@Override
	public int getRArticleNum() {
		return mapper.totalRArticleNum();
	}

	@Override
	public int getQArticleNum() {
		return mapper.totalQArticleNum();
	}

}
