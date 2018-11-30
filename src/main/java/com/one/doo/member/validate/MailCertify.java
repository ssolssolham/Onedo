package com.one.doo.member.validate;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * smtp mime타입 메일 보내는 기능
 * @author SiwonPark
 */
@Data
@AllArgsConstructor
public class MailCertify {
	
	@Inject
	private JavaMailSender mailSender;

	// 메일보내는 메소드
	public void sendMail(String toMail) throws MessagingException {
		//MimeMessage message = mailSender.createMimeMessage();
		SimpleMailMessage message = new SimpleMailMessage();
		
		message.setFrom("하나두");
		message.setTo(toMail);
		message.setSubject("인증메일입니다.");
		message.setText("인증메일!!!!");
		
		mailSender.send(message);
		
//		message.setText("<h2>보내는메시지</h2>", "utf-8", "html");
//		message.setFrom(new InternetAddress("Onedoo"));
//		message.setRecipient(RecipientType.TO, toMail);
		
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
