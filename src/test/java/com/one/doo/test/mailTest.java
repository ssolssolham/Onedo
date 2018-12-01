package com.one.doo.test;

import java.util.Random;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
					   "file:src/main/webapp/WEB-INF/spring/spring-security.xml"})
@Log4j
public class mailTest {

	@Inject
	private JavaMailSender mailSender;

	@Test
	public void test() {
		SimpleMailMessage message = new SimpleMailMessage();
		log.info("!!!"+mailSender);
		message.setFrom("hi");
		message.setTo("sw931110@naver.com");
		message.setSubject("인증메일테스트");
		message.setText("<h3>인증메일 <strong>테스트</strong> 내용</h3>");
		
		mailSender.send(message);
	}
	//@Test
	public void mkCodeTest() {
		StringBuffer key = new StringBuffer();
		Random rnd = new Random();
		
		for(int i=0; i<8; i++) {
			int idx = rnd.nextInt(3);
			
			switch (idx) {
			case 0:
				key.append((char)((int)(rnd.nextInt(26))+97));
				break;
			case 1:
				key.append((char)((int)(rnd.nextInt(26))+65));
				break;
			case 2:
				key.append((rnd.nextInt(10)));
				break;
			}
		}

		log.info("랜덤생성키: "+key.toString());
	}
}
