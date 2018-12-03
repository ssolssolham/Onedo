package com.one.doo.article.service;

import java.util.List;

import com.one.doo.article.domain.Criteria;
import com.one.doo.article.domain.Reply;
import com.one.doo.article.domain.ReplyPage;

/**
 * 댓글처리를 위한 서비스 인터페이스
 * @author siwonPark
 */
public interface ReplyService {
	// 댓글등록서비스
	public int register(Reply reply);
	
	// 댓글 조회(1개)서비스
	public Reply get(Long rno);
	
	// 댓글수정
	public int modify(Reply reply);
	
	// 댓글삭제
	public int remove(Long rno);
	
	// 게시글에대한 모든댓글 조회
	public List<Reply> getList(Criteria cri, Long article_num);
	
	// 게시글에 대한 댓글 페이징까지
	public ReplyPage getListPage(Criteria cri, Long article_num);
	
	
	
}
