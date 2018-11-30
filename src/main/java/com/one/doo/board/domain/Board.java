package com.one.doo.board.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Board {
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updateDate;
	
	
	private int replyCnt;
	private List<BoardAttach> attachList;
}
