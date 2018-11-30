package com.one.doo.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.one.doo.board.domain.Criteria;
import com.one.doo.board.domain.Reply;

public interface ReplyMapper {

	public int insert(Reply reply);

	public Reply read(Long bno);

	public int delete(Long bno);

	public int update(Reply reply);

	public List<Reply> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);

	public int getCountByBno(Long bno);
}
