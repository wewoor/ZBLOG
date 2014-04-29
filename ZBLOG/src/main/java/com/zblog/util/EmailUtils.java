package com.zblog.util;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 * 邮件发送工具
 * @author Ziv
 *
 */
public class EmailUtils {
	
	
	/**
	 * 发送邮件服务
	 * @param url
	 * @param email
	 * @throws Exception
	 */
	public static void sendEmail(String conent, String email) throws Exception {
		 
		 Properties props = new Properties();
		 props.put("mail.smtp.host", "smtp.qq.com");
		 props.put("mail.smtp.auth", "true");
		 //读取邮箱账户和密码
		 String account = Configer.getInstance().getProperty("email");
		 String password = Configer.getInstance().getProperty("email_pwd");
		 //基本的邮件会话
		 Session session = Session.getInstance(props);
		 //构造信息体
		 MimeMessage message = new MimeMessage(session); 
		 //发件地址
		 Address address = new InternetAddress(account);
		 message.setFrom(address);
		 //收件地址
		 Address toAddress = new InternetAddress(email);
		 message.setRecipient(MimeMessage.RecipientType.TO, toAddress);
		 
		 //主题
		 message.setSubject("Title");
		 //正文
		 String htmlBody = conent;
		 //声明多媒体对象
		 Multipart mp = new MimeMultipart();
		 MimeBodyPart htmlPart = new MimeBodyPart();
		 htmlPart.setContent(htmlBody, "text/html;charset=utf-8");
		 //多媒体对象添加html内容
		 mp.addBodyPart(htmlPart);
		 //message对象设置html内容
		 message.setContent(mp);		
		 message.saveChanges(); 
		 session.setDebug(true);
		 Transport transport = session.getTransport("smtp");
		 transport.connect("smtp.qq.com", account, password);
		 //发送
		 transport.sendMessage(message, message.getAllRecipients());
		 transport.close(); 
		
	}
}
