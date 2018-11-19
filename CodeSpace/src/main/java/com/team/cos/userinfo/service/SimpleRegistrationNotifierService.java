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
      String homePage = "<a href=\"http://localhost:8080/cos/\">홈페이지로 이동</a>";

      try {
         message.setSubject("회원가입을 진심으로 감사합니다.");
         message.setText(homePage, "UTF-8", "html");
         message.addRecipient(RecipientType.TO, new InternetAddress(userInfoVo.getUser_id()));
         sender.send(message);
      } catch (MessagingException e1) {
         e1.printStackTrace();
      }
   }
}