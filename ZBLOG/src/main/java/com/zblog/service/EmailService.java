package com.zblog.service;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.slf4j.LoggerFactory;

import com.zblog.util.Configer;

public class EmailService implements Runnable {
	
	private String title , content, targetAddr;// 标题， 内容， 目标地址
	
	
	public EmailService(String title, String content, String targetAddr) {
		super();
		this.title = title;
		this.content = content;
		this.targetAddr = targetAddr;
	}

	/**
	 * 发送邮件服务
	 * @param url
	 * @param email
	 * @throws Exception
	 */
	public static void send(String title,String conent, String targetAddr) 
			throws Exception {
		 
		//读取邮箱账户和密码
		String smtp = Configer.getInstance().getProperty("smtp_host");
		String account = Configer.getInstance().getProperty("email");
		String password = Configer.getInstance().getProperty("email_pwd");

		Properties props = new Properties();
		props.put("mail.smtp.host", smtp);
	 	props.put("mail.smtp.auth", "true");
	 	
	 	//基本的邮件会话
	 	Session session = Session.getInstance(props);
	 	//构造信息体
		 MimeMessage message = new MimeMessage(session); 
		 //发件地址
		 Address address = new InternetAddress(account);
		 message.setFrom(address);
		 //收件地址
		 Address toAddress = new InternetAddress(targetAddr);
		 message.setRecipient(MimeMessage.RecipientType.TO, toAddress);
		 
		 //主题
		 message.setSubject(title);
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
		 transport.connect(smtp, account, password);
		 //发送
		 transport.sendMessage(message, message.getAllRecipients());
		 transport.close(); 
		 return;
	}

	@Override
	public void run() {
		try {
			send(title, content, targetAddr);
		} catch (Exception e) {	
			LoggerFactory.getLogger(EmailService.class).
				error("EmailService.send():", e);
		}		
	}

}
