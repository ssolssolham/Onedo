package com.one.doo.article.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.one.doo.article.domain.Criteria;
import com.one.doo.article.domain.Reply;
import com.one.doo.article.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
/**
 * 댓글서비스 구현
 * @author siwonPark
 */
@Service
@AllArgsConstructor
@Log4j
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyMapper mapper;
	
	@Override
	public int register(Reply reply) {
		log.info("댓글작성 서비스.."+reply);
		return mapper.insert(reply);
	}

	@Override
	public Reply get(Long rno) {
		log.info("특정댓글조회서비스"+rno);
		return mapper.read(rno);
	}

	@Override
	public int modify(Reply reply) {
		log.info("댓글수정서비스"+reply);
		return mapper.update(reply);
	}

	@Override
	public int remove(Long rno) {
		log.info("댓글삭제서비스"+rno);
		return mapper.delete(rno);
	}

	@Override
	public List<Reply> getList(Criteria cri, Long article_num) {
		log.info("게시글에따른 댓글목록조회서비스.."+article_num);
		return mapper.getListWithPaging(cri, article_num);
	}

}
