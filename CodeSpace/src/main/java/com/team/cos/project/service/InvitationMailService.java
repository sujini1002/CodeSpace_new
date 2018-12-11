package com.team.cos.project.service;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.team.cos.userinfo.vo.UserInfoVo;

@Service
public class InvitationMailService {

	@Autowired
	private JavaMailSender sender;

	public void sendMail(int project_no, UserInfoVo userInfoVo) {
		MimeMessage message = sender.createMimeMessage();
		String homePage = "<div style=\"height:300px; margin:15% auto; width:20%\">\r\n";
			homePage += "	<h1 style=\"text-align:center;margin-bottom: 50px\">CODE SPACE</h1>\r\n";
			homePage += "	<div style=\"text-align:center; font-size: 17px;\">프로젝트 참여 초대 메일</div>\r\n";
			homePage += "	<button style=\"border: 0px; margin: 10% 2%; height: 50px; width: 300px; align-items: center; border-radius: 5px; background-color: #007bff; border-color: #007bff; font-size: 20px; color: white; cursor: pointer;\">";
			homePage += "	<a href=\"http://ec2-13-125-255-64.ap-northeast-2.compute.amazonaws.com:8080/cos/project/projectMemberAccept?project_no="+project_no+"&project_member_no="+userInfoVo.getUser_no()+"\" ";
			homePage += "style=\"line-height:50px; color: white; text-decoration: none\">프로젝트 수락</a></button>\r\n";
			homePage += "   <p style=\"text-align: center;color: gray;\">&copy; 2018-2019</p>\r\n </div>";
			
		try {
			message.setSubject("[코드스페이스] 프로젝트 참여 수락 안내 메일", "UTF-8");
			message.setText(homePage, "UTF-8", "html");
			message.addRecipient(RecipientType.TO, new InternetAddress(userInfoVo.getUser_id()));
			sender.send(message);
		} catch (MessagingException e1) {
			e1.printStackTrace();
		}
	}
}