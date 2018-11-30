package com.one.doo.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.doo.board.domain.Board;
import com.one.doo.board.domain.Criteria;
import com.one.doo.board.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service 
@AllArgsConstructor
@Log4j
public class BoardServiceImpl implements BoardService{

/*	@Setter(onMethod_ = @Autowired)*/
	private BoardMapper mapper;

	@Override
	public void register(Board board) {
		log.info("register......" + board);
		mapper.insertSelectKey(board);
	}

	@Override
	public Board get(Long bno) {
		log.info("get......" + bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(Board board) {
		log.info("modify......" + board);
		return mapper.update(board) == 1; //삭제가 이뤄자면 1 반환해서 true (반대는 false)
	}

	@Override
	public boolean remove(Long bno) {
		log.info("remove...." + bno);
		return mapper.delete(bno) == 1; //true, false
	}

	@Override
	public List<Board> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}


	

}
