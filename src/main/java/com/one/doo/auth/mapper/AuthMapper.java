package com.one.doo.auth.mapper;

import com.one.doo.auth.domain.Auth;

public interface AuthMapper {
	// 가입시 인증부여 insert..(트랜잭션처리 예정..)
	public void insert(Auth auth);
	
}
