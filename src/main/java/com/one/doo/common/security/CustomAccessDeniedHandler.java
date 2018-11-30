package com.one.doo.common.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import lombok.extern.log4j.Log4j;

/**
 * 사용자 접근이 제한된 경우 접근제한핸들러
 * @author 김기정
 *
 */
@Log4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		log.error("액세스가 거부되어 에러페이지로 포워드합니다...");
		response.sendRedirect(request.getContextPath() + "/error/error_403");
	}

}
