/*
 * Created on Jun 15, 2012
 * By Abdel-Moneim Emad
 */
package com.altagamo3.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Properties;
import java.sql.Date;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class Utils {
	
	// for email
	static Properties properties = new Properties();
	static final String from = "info@altagamo3.com";
	static final String password = "password";
	// for password generation
	final static String alphabet = "abcdefghijklmnopqrstuvwxyz";
	static {
		// GMail Settings...
//		properties.put("mail.smtp.host", "smtp.gmail.com");
//		properties.put("mail.smtp.socketFactory.port", "465");
//		properties.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
//		properties.put("mail.smtp.auth", "true");
//		properties.put("mail.smtp.port", "465");
		// Al Tagamo3 Settings...
		properties.put("mail.smtp.host", "mail.altagamo3.com");
		properties.put("mail.smtp.socketFactory.port", "2525");
		properties.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.port", "2525");
		
	}

/**
 * send an email to one or more recipients
 * @param from The account name or the email address this email sent from
 * @param password The account password
 * @param to A comma separated list of this email recipients
 * @param subject The message subject
 * @param body The message contents (body)
 * @throws Exception
 * @author amemad
 */
	public static void sendMail(final String from, final String password, String to, String subject, String body) throws Exception{
		Session session = Session.getDefaultInstance(properties,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(from, password);
					}
				});
		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress(from));
		message.setRecipients(Message.RecipientType.BCC,InternetAddress.parse(to));
		message.setSubject(subject);
		message.setText(body);
		message.setContent(body, "text/html");
		Transport.send(message);
		System.out.println("E-Mail sent successfully!");
	}

	public static void sendInternalMail(String to, String subject, String body) throws Exception{
		sendMail(from,password,to,subject,body);
	}	
	
	/**
	 * send an email to one or more recipients
	 * @param from The account name or the email address this email sent from
	 * @param password The account password
	 * @param to A comma separated list of this email recipients
	 * @param subject The message subject
	 * @param body The message contents (body)
	 * @throws Exception
	 * @author amemad
	 */
	public static void sendMailWithAttachments(final String from, final String password, String to, String subject, String body, Collection<String> files) throws Exception{
		Session session = Session.getDefaultInstance(properties,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(from, password);
					}
				});
		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress(from));
		message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
		message.setSubject(subject);
		message.setText(body);
		message.setContent(message, "text/html");
		// Attachment Part 1
		BodyPart messageBodyPart = new MimeBodyPart();
		messageBodyPart.setText(body);
		Multipart multipart = new MimeMultipart();
		multipart.addBodyPart(messageBodyPart);
		// Attachment Part 2
		for (String filename : files) {
			messageBodyPart = new MimeBodyPart();
			DataSource source = new FileDataSource(filename);
			messageBodyPart.setDataHandler(new DataHandler(source));
			messageBodyPart.setFileName(filename);
			multipart.addBodyPart(messageBodyPart);
		}
		message.setContent(multipart);
		Transport.send(message);
	}
	
	public static void sendInternalMailWithAttachment(String to, String subject, String body, Collection<String> files) throws Exception{
		final String from = "menememad";
		final String password = "emadm0neim";
		sendMailWithAttachments(from,password,to,subject,body,files);
	}	
		
	public static String generatePassword(int length){
		StringBuffer sb = new StringBuffer(length);
		for (int i = 0; i < length; i++) {
			sb.append(alphabet.charAt((int)(Math.random()*10)));
		}
		return sb.toString();
	}

	public static Date convertToSQLDate(String date){
		DateFormat formater = new SimpleDateFormat("dd/MM/yyyy");  
		try{
			java.util.Date parsedUtilDate = formater.parse(date);
			return new Date(parsedUtilDate.getTime());
		}catch(ParseException pe){
			return null;
		}
	}

	public static void main(String[] args) throws ParseException {
		//generatePassword(6);
	}
}