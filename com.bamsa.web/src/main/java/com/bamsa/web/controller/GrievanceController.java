package com.bamsa.web.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bamsa.web.model.ClockTimeModel;
import com.bamsa.web.model.EmployeeDetailsModel;
import com.bamsa.web.model.GrievanceDetailsModel;
import com.bamsa.web.model.UserBean;
import com.bamsa.web.service.UserService;
import com.bamsa.web.util.ApplicationConstants;

@Controller
public class GrievanceController {

	@Autowired
	UserService userServiceImpl;
	 @Autowired
	 private JavaMailSender mailSender;
	private static Logger logger = Logger.getLogger(GrievanceController.class);
	@RequestMapping("/complaintform")
	public String showGrievanceform(HttpServletRequest request)
	{
		
		return "complaint";
		
	}
	
	
	@RequestMapping("/complaint")
	public String registerComplaint(HttpServletRequest request)
	{
		logger.info("Enter into showcomplaintpage");
		GrievanceDetailsModel reggrievance = buildGrievanceDetails(request);
		try{
			userServiceImpl.registergrievance(reggrievance, request);
			request.setAttribute("successmessage", "complaint Registration successfull");
		}catch(Exception e){
			request.setAttribute("errormessage", "Grievence not sent successfully");
			logger.error(e.getMessage());
			return "complaint";
		}
		request.setAttribute("successmessage", "Grievance Sent successfully");
		
		logger.info("Exit From grievancecontoller RegisterComplaint");
		return "complaint";
		
	}
	
	public GrievanceDetailsModel buildGrievanceDetails(HttpServletRequest request)
	{
		logger.info("Enter into buildGrievanceDetails");
		UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
		int uid =userData.getUid();
		GrievanceDetailsModel regcomplaint = new GrievanceDetailsModel();
		regcomplaint.setUid(uid);
		regcomplaint.setGrievancetype(Integer.parseInt(request.getParameter("gtype")));
		regcomplaint.setGrievancesevere(Integer.parseInt(request.getParameter("severe")));
		regcomplaint.setMobileNo(request.getParameter("mob"));
		regcomplaint.setGrievancedetails(request.getParameter("dtc"));
		logger.info(regcomplaint);
		logger.info("exit from buildGrievanceDetails");
		return regcomplaint;
		
	}
	
	@RequestMapping("/Grievances")
	public String showAllgrievances(HttpServletRequest request,Model model)
	{
		logger.info("Enter into showAllgrievances");
		List<String> mails=new ArrayList<String>();
		mails=	userServiceImpl.getAllEmployeesEmails();
		request.setAttribute("Emails", mails);
		logger.info(mails);
		UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
		int uid=0;
		if(null!=userData){
		uid =userData.getUid();
		}
		List<GrievanceDetailsModel> allgrievances ;
		allgrievances =userServiceImpl.getAllGrievances();
		if(uid == 0){
		model.addAttribute("complaintlist", allgrievances);
		}
		else{
			List<GrievanceDetailsModel> individual = new ArrayList<GrievanceDetailsModel>();
			
			for(GrievanceDetailsModel grievance :allgrievances)
			{
				if(grievance.getUid() == uid)
				{
					individual.add(grievance);
				}
				model.addAttribute("complaintlist",individual);
			}
		}
		
		
		logger.info("Exit From showAllgrievances");
		return "grievancedetails";
		
	}
	@RequestMapping("/sendmail")
	public String sendEmail(HttpServletRequest request,Model model)
	{
		try{
		  // takes input from e-mail form
        String recipientAddress = request.getParameter("mail");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
        EmployeeDetailsModel empModel = (EmployeeDetailsModel)request.getSession().getAttribute(ApplicationConstants.EMPLOYEE_REGISTRATION_DETAILS);
        String from =empModel.getEmail();
       
       
        String [] mails = recipientAddress.split(",");
        MimeMessage mime = this.mailSender.createMimeMessage();
		  MimeMessageHelper helper = new MimeMessageHelper(mime, true);
        // prints debug info
        logger.info("To: " + recipientAddress);
        logger.info("Subject: " + subject);
        logger.info("Message: " + message);
         
        // creates a simple e-mail object
        SimpleMailMessage email = new SimpleMailMessage();
       
        	email.setBcc(mails);
        	email.setFrom(from);
            email.setSubject(subject);
            email.setText(message);
            helper.setTo(recipientAddress);
            
			  helper.setSubject(subject);
			 // helper.setBcc(bcc);
		        // helper.setCc(cc);
			 
            
            String htmlText = message;
		    helper.setText(htmlText,true);
		    this.mailSender.send(mime);
		    request.setAttribute("success", true);
             
            // sends the e-mail
            mailSender.send(email);
		}catch(Exception e){
			logger.info(e.getMessage());
			 request.setAttribute("success", false);
		}
            
       
         
        // forwards to the view named "Result"
		return "successorerror";
		}
	
	
	@RequestMapping("/fixgrievance")
	public String updateGrievanceTicketStatus(HttpServletRequest request) throws ParseException
	{
		try{
		GrievanceDetailsModel updatemodel = new GrievanceDetailsModel();
		int gid = Integer.valueOf(request.getParameter("gid"));
		logger.info(gid);
		updatemodel.setGid(gid);
		updatemodel=userServiceImpl.updateGrievanceTicketStatus(updatemodel);
		logger.info(gid);
		logger.info(updatemodel);
		}catch(Exception e)
		{
			e.getMessage();
		}
		
		return "forward:/Grievances";
	}
	
	
	
	
	
}
