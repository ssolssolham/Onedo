package com.one.doo.article.domain;

import lombok.Data;
/**
 * 댓글수 증가 업데이트를 위한 vo객체
 * @author siwonPark
 */
@Data
public class ReplyCntVO {
	private Long article_num;
	private int replycnt;
}
