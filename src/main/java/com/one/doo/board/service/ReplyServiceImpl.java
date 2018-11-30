package com.one.doo.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.doo.board.domain.Criteria;
import com.one.doo.board.domain.Reply;
import com.one.doo.board.domain.ReplyPage;
import com.one.doo.board.mapper.BoardMapper;
import com.one.doo.board.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;

	@Override
	public int register(Reply reply) {
		log.info("register......" + reply);
		boardMapper.updateReplyCnt(reply.getBno(), 1);
		return mapper.insert(reply);

	}

	@Override
	public Reply get(Long rno) {
		log.info("get......" + rno);
		return mapper.read(rno);

	}

	@Override
	public int modify(Reply reply) {
		log.info("modify......" + reply);
		return mapper.update(reply);

	}

	@Override
	public int remove(Long rno) {
		log.info("remove...." + rno);
		Reply reply = mapper.read(rno);
		boardMapper.updateReplyCnt(reply.getBno(), -1);
		return mapper.delete(rno);

	}

	@Override
	public List<Reply> getList(Criteria cri, Long bno) {
		log.info("get Reply List of a Board " + bno);
		return mapper.getListWithPaging(cri, bno);

	}

	@Override
	public ReplyPage getListPage(Criteria cri, Long bno) {
		return new ReplyPage(mapper.getCountByBno(bno), mapper.getListWithPaging(cri, bno));
	}

}
