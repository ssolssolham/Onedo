package com.one.doo.common.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.log4j.Log4j;

/**
 * 로그인 성공 이후에 특정 동작 제어를 위한 핸들러
 * @author 박의수
 *
 */
@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{

	HashMap<String,String> members = new HashMap<String,String>();
	Date lastLogDate = new Date();
	boolean logFirstByDay = false; 
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		ObjectMapper om = new ObjectMapper();

		List<String> roleNames = new ArrayList<String>();
		Collection<? extends GrantedAuthority> collection = authentication.getAuthorities();
		collection.forEach(authority ->{
			roleNames.add(authority.getAuthority());
		});
		
		for (GrantedAuthority grantedAuthority : collection) {
				roleNames.add(grantedAuthority.getAuthority());
				log.info("등록된 권한 이름들 : " + roleNames);
		}
		
/*		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", true);
		
		if(roleNames.contains("ROLE_ADMIN")) {
			map.put("returnUrl", request.getContextPath() + "/admin/admin");
			
		}else if(roleNames.contains("ROLE_USER")) {
			map.put("returnUrl", request.getContextPath()+ "/");// 
			
		}else {
			map.put("returnUrl", request.getContextPath());
		}
		String jsonString = om.writeValueAsString(map);
		OutputStream out = response.getOutputStream();
		out.write(jsonString.getBytes());*/
		
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect(request.getContextPath() + "/admin/");
			System.out.println("관리자 접속");
		}else {
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
	        System.out.println("!"+ ip);
	        // 접속자 수 판단
	        
	        // 비교용 
	        Date logDate = new Date();
	        if(lastLogDate.getTime() / 1000 / 60 / 60 / 24 < logDate.getTime() / 1000 / 60 / 60 / 24) {
	        	// select문으로 일일단위 데이터 여부 확인
	        	
	        	// logService
	        	System.out.println("시험용");
	        	
	        	if(true) {
	        	// 있으면 insert 입력 
	        		
	        	// 입력용
	        	GregorianCalendar today = new GregorianCalendar();
	        	
	        	int Year = today.get(Calendar.YEAR);
	        	int Month = today.get(Calendar.MONTH);
	        	int Date = today.get(Calendar.DATE);
	        	
	        	System.out.println(Year + "," + Month + "," + Date);
	        	
		        members.put(ip, "member");
	        	}
	        } else {
	        	// 접속자 수 변화를 보고 일일단위 url의 숫자 증가
	        	int beforesize = members.size();
		        members.put(ip, "member");
		        
		        if(beforesize < members.size()) {
		        	// 전 보다 증가했을경우
		        	// update문으로 증가 
		        	System.out.println("새로운 로그인 접속자");
		        	
		        }
	        }
	        
			response.sendRedirect(request.getContextPath() + "/");
			return;
//			System.out.println("유저 접속");
		}
//		response.sendRedirect(request.getContextPath());
//		System.out.println("로그인 ----- 성공했니??");
	}

}
