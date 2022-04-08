package com.vegan.recipe.user.mail;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MailService {

	@Autowired
	private JavaMailSender mailSender;
	
	private int rnum;
	
	//인증번호
	public void makeRn() {
		//숫자 범위 1111~9999
		Random r = new Random();
		int num = r.nextInt(8888)+1111;
		
		System.out.println("인증번호" + num);
		
		rnum = num;
	}
	
	//인증 이메일
	public String sendEmail(String email) {
		
		System.out.println("이메일 인증 메서드 실행");
		makeRn();
		
		//발송시 이메일
		String setFrom = "jobjobproject@gmail.com";
		String toMail = email;
		String title = "VeganRecipe 회원가입 인증번호";
		String content = "VeganRecipe 이메일 인증번호 입니다" + "<br><br>"+
		"인증번호: " + rnum + "<br>" + "인증번호를 확인란에 입력해 주세요";
		
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(rnum);
	}

	//이메일 전송 메서드
	public void mailSend(String setFrom, String toMail, String title, String content) {
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
}
