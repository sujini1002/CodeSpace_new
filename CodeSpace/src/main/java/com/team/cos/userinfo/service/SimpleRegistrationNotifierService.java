package com.team.cos.userinfo.service;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.team.cos.userinfo.vo.UserInfoVo;

@Service
public class SimpleRegistrationNotifierService {

	@Autowired
	private JavaMailSender sender;

	public void sendMail(UserInfoVo userInfoVo) {
		MimeMessage message = sender.createMimeMessage();
		String homePage = "<div style=\"height:300px; margin:15% auto; width:20%\">\r\n"
				+ "        <h1 style=\"text-align:center;margin-bottom: 50px\">CODE SPACE</h1>\r\n"
				+ "        <div style=\"text-align:center; font-size: 17px;\">회원가입을 진심으로 감사드립니다!!</div>\r\n"
				+ "        <button style=\"border: 0px; margin: 10% 2%; height: 50px; width: 300px; align-items: center; border-radius: 5px; background-color: #007bff; border-color: #007bff; font-size: 20px; color: white; cursor: pointer;\"><a href=\"http://localhost:8080/cos/\" style=\"line-height:50px; color: white; text-decoration: none\">홈페이지로 이동하기</a></button>\r\n"
				+ "        <p style=\"text-align: center;color: gray;\">&copy; 2018-2019</p>\r\n" + "    </div>";
		try {
			/* message.setSubject("회원가입을 진심으로 감사합니다."); */
			message.setText(homePage, "UTF-8", "html");
			message.addRecipient(RecipientType.TO, new InternetAddress(userInfoVo.getUser_id()));
			sender.send(message);
		} catch (MessagingException e1) {
			e1.printStackTrace();
		}
	}
}