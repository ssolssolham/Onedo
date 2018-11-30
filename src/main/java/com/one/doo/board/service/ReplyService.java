package com.one.doo.board.service;

import java.util.List;

import com.one.doo.board.domain.Criteria;
import com.one.doo.board.domain.Reply;
import com.one.doo.board.domain.ReplyPage;

public interface ReplyService {

	public int register(Reply reply);

	public Reply get(Long rno);

	public int modify(Reply reply);

	public int remove(Long rno);

	public List<Reply> getList(Criteria cri, Long bno);
	
	public ReplyPage getListPage(Criteria cri, Long bno);

}
