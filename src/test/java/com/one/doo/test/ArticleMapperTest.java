package com.one.doo.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.one.doo.article.domain.Article;
import com.one.doo.article.domain.Criteria;
import com.one.doo.article.mapper.ArticleMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/spring-security.xml"})
@Log4j
public class ArticleMapperTest {
	@Inject
	private ArticleMapper mapper;
	
	//@Test //게시판별 list걍 가져오기
	public void test() {
		log.info("------------");
		log.info("게시글매퍼: "+mapper);
		log.info("------------");
		List<Article> rList;
		rList = mapper.getList(2L);
		for (Article article : rList) {
			log.info(article);
		}
		log.info("----------");
	}
	
	//@Test
	public void test2() {
		log.info("페이지들어가는 getList-------");
		List<Article> list;
		Criteria cri = new Criteria(1, 3);
		cri.setKeyword("hi");
		cri.setType("W");
		list = mapper.getListWithPaging(cri);
		for (Article article : list) {
			log.info(article);
		}
		log.info("----------------------------");
	}
	
	//@Test
	public void test3() {
		log.info("게시판별 총 게시글 수");
		Criteria cri = new Criteria();
		cri.setType("TC");
		cri.setKeyword("서비스");
		int cnt = mapper.getTotalCount(cri);
		log.info("----"+cnt);
	}
	
	//@Test
	public void test4() {
		log.info("게시판 글 넣기");
		Article article = new Article();
		article.setBno(2L);
		article.setUserid("hi");
		article.setTitle("후기후기");
		article.setContent("후기글넣기 유닛테스트");
		article.setReplyCnt(0);
		log.info("----"+article);
		mapper.insert(article);
	}
	
	//@Test
	public void test5() {
		log.info("게시글1개조회(키값으로");
		Article article = mapper.read(14L);
		log.info("조회한 게시글: "+article);
	}
	
	//@Test
	public void test6() {
		log.info("게시글삭제->enabled를 N으로 수정");
		Article article = mapper.read(15L);
		log.info(article);
		log.info("게시글삭제(update)결과..: "+mapper.delete(15L));
		article = mapper.read(15L);
		log.info(article);
	}
	
	@Test
	public void test7() {
		log.info("게시글수정(제목, 내용)");
		Article article = mapper.read(2L);
		log.info(article);
		article.setContent("수정테스트를해볼까나");
		article.setTitle("수정수정");
		mapper.update(article);
		log.info(mapper.read(2L));
	}
}
