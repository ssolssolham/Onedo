package com.one.doo.main.controller;


import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.one.doo.article.service.ArticleService;
import com.one.doo.member.service.MemberService;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
public class HomeController {
	
	HashMap<String,String> members = new HashMap<String,String>();
	Date lastLogDate = new Date(10000);
	boolean logFirstByDay = false;	
	
	@Inject
	MemberService memberService;
	
	/**
	 * 홈(메인)   페이지 요청
	 * @return  논리적 뷰이름
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request) {
		
		/* 
		 * 접속중복을 차단하기 위해
		 * 사용자의 ip를 추적, Map 객체에 담습니다.
		 */
        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null)
            ip = request.getRemoteAddr();
         
        /* 마지막 log날짜의 일자가 현재 날짜의 일자와 다를경우 
           오늘 날짜의 url이 있는지 여부를 DB에서 확인합니다.
           url이 있으면 boolean값을 true로 변경합니다! 
         *  */
        
        // ip 확인용
        log.info("!"+ ip);
        
        // 비교용 
        Date logDate = new Date();
        
    	GregorianCalendar today = new GregorianCalendar();
    	
    	int Year = today.get(Calendar.YEAR);
    	int Month = today.get(Calendar.MONTH) + 1;
    	int Date = today.get(Calendar.DATE);
    	
    	String formatMonth = "";
    	String formatDate = "";
    	
    	if(Month < 10) {
    		formatMonth = "0";
    	}
    	
    	if(Date < 10) {
    		formatDate = "0";
    	}
    	// log_day 매개변수 준비
    	String log_day = Year + formatMonth + Month + formatDate + Date;
    	
    	// url_no 준비
    	int url_no = memberService.getUrlNo("/", "GET");
    	
    	log.info(lastLogDate.getTime() / 1000 / 60 / 60 / 24);
    	log.info(lastLogDate);
    	
    	log.info(logDate);
    	log.info(logDate.getTime() / 1000 / 60 / 60 / 24);
    	log.info(lastLogDate.getTime() / 1000 / 60 / 60 / 24 < logDate.getTime() / 1000 / 60 / 60 / 24);
    	// 하루 이상이 지난 후 로그기록 
        if((lastLogDate.getTime() / 1000 / 60 / 60 / 24) < (logDate.getTime() / 1000 / 60 / 60 / 24)) {
        	// select문으로 일일단위 데이터 여부 확인
        	// 서버와 DB 시간 동기화
        	lastLogDate = logDate;
        	// Map 비우기
        	members.clear();
        	// DB 기록 확인
        	int logCnt = memberService.countTodayLog(url_no, log_day);
        	
        	if(logCnt == 0) {
        	// 없으면 insert 입력 
        	memberService.makeLoginLog(url_no, log_day);
        	// 서버에 접속자 등록
	        members.put(ip, "member");
        	}
        	
        	// DB 기록이 있다면 서버와 DB 시간 동기화로 끝
        	
        } else {
        	// 서버와 로그의 일자가 똑같다면
        	// 접속자 수 변화를 보고 일일단위 url의 숫자 증가
        	int beforesize = members.size();
        
	        members.put(ip, "member");
	        
	        if(beforesize < members.size()) {
	        	// 접속자 수가 증가했을경우(중복이 아닐 경우)
	        	// update문으로 증가 
	        	memberService.sumUpLoginLog(url_no, log_day);
	        }
        }
		
		return "index";
	}
	
	// 공지띄우기 위한 공지글을 불러오는 서비스 선언
	@Inject
	private ArticleService service;
	
	@RequestMapping("/noticePop")
	public String popup(Model model) {
		log.info("메인화면 요청 -- 공지팝업요청 컨트롤러");
		model.addAttribute("notices", service.getNoticeList());
		return "/includes/notices";
	}
	
	@RequestMapping("/guide")
	public String userguide() {
		log.info("이용 가이드 페이지 요청");
		return "/guide/userGuide";
	}
}
