package com.one.doo.common.security;

import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.fasterxml.jackson.databind.ObjectMapper;


/**
 * 로그인 실패 이후에 특정 동작 제어를 위한 핸들러
 * @author 박의수
 *
 */
public class CustomLoginFailureHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception)
		throws IOException, ServletException {

		ObjectMapper om = new ObjectMapper();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", false);
		map.put("message", exception.getMessage());
		
		System.out.println("로그인 ----- 실패했니??");
		
		String jsonString = om.writeValueAsString(map);
		OutputStream out = response.getOutputStream();
		out.write(jsonString.getBytes());
	}
}