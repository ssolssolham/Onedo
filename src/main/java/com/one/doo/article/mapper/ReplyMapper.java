package com.one.doo.article.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.one.doo.article.domain.Criteria;
import com.one.doo.article.domain.Reply;

/**
 * 게시글에 달리는 댓글처리 매퍼
 * @author SiwonPark
 */
public interface ReplyMapper {
	// 댓글달기
	public int insert(Reply reply);
	
	// 댓글보기
	public Reply read(Long rno);
	
	// 댓글삭제
	public int delete(Long rno);
	
	// 댓글수정
	public int update(Reply reply);
	
	// 댓글보기(페이징처리까지)
	public List<Reply> getListWithPaging(@Param("cri") Criteria cri, @Param("article_num") Long article_num);
	
	// 게시글에 달린 모든 댓글 수
	public int getCountByArticleNum(Long article_num);
}
