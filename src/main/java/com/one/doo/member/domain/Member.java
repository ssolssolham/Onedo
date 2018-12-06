package com.one.doo.member.domain;

import java.util.Date;
import java.util.List;

import com.one.doo.auth.domain.Auth;

import lombok.Data;
import lombok.Getter;

@Data
@Getter
public class Member {
	private String userid;
	private String userpw;
	private String userName;
	private String enabled;
	private Date regDate;
	private Date updateDate;
	private List<Auth> authList;
	private String email;
	
}
