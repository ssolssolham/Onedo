package com.one.doo.board.service;

import java.util.List;

import com.one.doo.board.domain.Board;
import com.one.doo.board.domain.Criteria;

public interface BoardService {
	

		public void register(Board board);

		public Board get(Long bno);

		public boolean modify(Board board);

		public boolean remove(Long bno);

		//public List<BoardDTO> getList();

		public List<Board> getList(Criteria cri);
		//추가
		public int getTotal(Criteria cri);

	
	
}
