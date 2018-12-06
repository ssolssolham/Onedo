package com.one.doo.auth.mapper;

import com.one.doo.auth.domain.Auth;

public interface AuthMapper {
	// 가입시 인증부여 insert..(트랜잭션처리 예정..)
	public void insert(Auth auth);
	
	// 권한삭제(회원탈퇴)
	public void deleteAuth(String userid);
	
	// 새 권한 부여
	public void addAuth(String userid, String auth);
	
}
