package com.one.doo.member.validate;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.one.doo.member.domain.Member;

import lombok.extern.log4j.Log4j;

@Log4j
public class MemberValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Member.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		log.info("---validate 진입-----");
		ValidationUtils.rejectIfEmpty(errors, "userid", "id.empty");
		Member member = (Member)target;
		log.info("타겟의 아이디: "+member.getUserid());
		member.setUserid(member.getUserid().trim());
		if(member.getUserid()==null) {
			log.info("id값이 없다!!!!!!!!!!!!!");
			errors.reject("필수 입력 사항입니다.");
		}
	}

}
