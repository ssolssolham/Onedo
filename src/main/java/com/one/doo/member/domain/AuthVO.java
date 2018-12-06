package com.one.doo.member.domain;
/**
 * 회원권한부여를 위한 vo객체
 * @author siwonPark
 */

import java.util.List;

import lombok.Data;
import lombok.Getter;
@Data
@Getter
public class AuthVO {
	private String userid;
	private List<String> authList;
}
