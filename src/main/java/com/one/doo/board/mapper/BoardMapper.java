package com.one.doo.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.one.doo.board.domain.Board;
import com.one.doo.board.domain.Criteria;

public interface BoardMapper {

	// 게시판 목록 조회
	public List<Board> getList();
	
	// 페이징 처리한 게시판 목록
	public List<Board> getListWithPaging(Criteria cri);
	
	//전체 게시글 숫자
	public int getTotalCount(Criteria cri);
	
	//게시판 글 작성
	public void insert(Board board);
	
	//다음 작성되는 게시판 글 번호도확인 후 insert
	public void insertSelectKey(Board board);
	
	//글 읽기
	public Board read(Long bno);
	
	//글 삭제
	public int delete(Long bno);
	
	//글 수정
	public int update(Board board);
	
	
	//댓글 수 가져오기
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
}
