package com.one.doo.loan.mapper;

import java.util.HashMap;
import java.util.List;

import com.one.doo.board.domain.Board;
import com.one.doo.board.domain.Criteria;
import com.one.doo.loan.domain.Loan;
import com.one.doo.loan.domain.Parameter;
public interface LoanMapper {
	
	//추천 대출 리스트 가져오기
	public List<HashMap<String, Object>> getLoanList(Parameter param);
	
	
	
	/* 관리자용 기능 */
	//새로운 대출상품 등록
	public void insertLoan(Loan loan);

	//대출상품 정보 수정
	public int updateLoan(Loan loan);
	
	//신용도에 따른 대출이율 읽기
	public Loan readLoan(int loanId);
	
	// 게시판의 게시글 카운트 업데이트
	public int updateCnt(int loanId);
	
	public List<HashMap<String, Object>> getListWithPaging(Criteria cri);
	
	//전체 게시글 숫자
	public int getTotalCount(Criteria cri);
}
