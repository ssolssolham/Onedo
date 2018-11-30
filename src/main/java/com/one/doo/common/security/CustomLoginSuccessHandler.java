package com.one.doo.common.security;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.log4j.Log4j;

/**
 * 로그인 성공 이후에 특정 동작 제어를 위한 핸들러
 * @author 박의수
 *
 */
@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{

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
			response.sendRedirect(request.getContextPath() + "/admin/admin");
			System.out.println("관리자 접속");
		}else {
			response.sendRedirect(request.getContextPath() + "/");
			return;
//			System.out.println("유저 접속");
		}
//		response.sendRedirect(request.getContextPath());
//		System.out.println("로그인 ----- 성공했니??");
	}

}
