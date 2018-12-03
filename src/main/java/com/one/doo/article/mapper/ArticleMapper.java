package com.one.doo.article.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.one.doo.article.domain.Article;
import com.one.doo.article.domain.Criteria;

/**
 * 게시판에들어가는 article에 대한 mapper
 * @author SiwonPark
 */
public interface ArticleMapper {
	// 게시판별 게시글 목록 조회
	public List<Article> getList(Long bno);
	
	// 후기 페이징처리한 게시글 목록(enabled = 'Y')
	public List<Article> getListWithPaging(Criteria cri);
	
	// 후기게시판 검색조건에 맞는 게시글 숫자
	public int getTotalCount(Criteria cri);
	
	// 게시판별 게시글작성
	public void insert(Article article);
	
	// 다음작성되는 게시판 글 번호확인 후 insert???이게뭐지..?
//	public void insertSelectKey(Article article);
	
	// 게시글읽기
	public Article read(Long article_num);
	
	// 게시글 삭제-->글삭제를하면 update로 처리할 예정..(enabled값 변경)
	public int delete(Long article_num);
	
	// 게시글 수정
	public int update(Article article);
	
}
