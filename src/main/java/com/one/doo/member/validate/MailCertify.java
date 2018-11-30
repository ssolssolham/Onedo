package com.one.doo.member.validate;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * smtp mime타입 메일 보내는 기능
 * @author SiwonPark
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Log4j
public class MailCertify {
	
	@Inject
	private JavaMailSender mailSender;

	// 메일보내는 메소드
	public String sendMail(String toMail) {
		String code = mkCode();
		log.info("메일보내"+toMail);
		try {
			
			// simpleMsg사용...(html 못보냄)
			SimpleMailMessage message = new SimpleMailMessage();
			
			message.setFrom("ONEDOO");
			message.setTo(toMail);
			message.setSubject("이메일 인증 메일입니다");
			message.setText("인증코드 "+code+"\r\n를 입력해 주세요");
			
			mailSender.send(message);
			
//		MimeMessage message = mailSender.createMimeMessage();
//		
//		message.setSubject("회원가입 인증 메일입니다.");
//		MimeMessageHelper helper = new MimeMessageHelper(message, false, "utf-8");
//		
//		String htmlMsg = "<div align='center' sytle='border:1px solid black; font-family:verdana'>";
//		htmlMsg += "<h3 style='color: blue;'>회원가입 인증코드 입니다.</h3>";
//		htmlMsg += "<div style='font-size: 130%'>";
//		htmlMsg += "회원가입 페이지로 돌아가 인증코드 <strong>";
//		htmlMsg += code+"</strong>를 입력해 주세요:)</div><br/>";
//		
//
//		
////		message.setFrom("하나두");
////		message.setTo(toMail);
//		message.setSubject("인증메일입니다.");
//		message.setText("인증메일!!!!");
//		
//		mailSender.send(message);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
//		message.setText("<h2>보내는메시지</h2>", "utf-8", "html");
//		message.setFrom(new InternetAddress("Onedoo"));
//		message.setRecipient(RecipientType.TO, toMail);
		return code;
		
	}
	
	// 임의 코드 생성 메소드
	public String mkCode() {
		StringBuffer code = new StringBuffer();
		Random rnd = new Random();
		
		// 10자리의 랜덤 코드를 생성
		for(int i=0; i<10; i++) {
			int idx = rnd.nextInt(3);
			
			switch (idx) {
			case 0:
				code.append((char)((int)(rnd.nextInt(26))+97));
				break;
			case 1:
				code.append((char)((int)(rnd.nextInt(26))+65));
				break;
			case 2:
				code.append((rnd.nextInt(10)));
				break;
			}
		}
		return code.toString();
	}
	
}
