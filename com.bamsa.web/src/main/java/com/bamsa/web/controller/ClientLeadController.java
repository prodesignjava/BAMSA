package com.bamsa.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bamsa.web.model.AssetTicketModel;
import com.bamsa.web.model.ClientLeadModel;
import com.bamsa.web.model.EmployeeDetailsModel;
import com.bamsa.web.model.EmployeeModel;
import com.bamsa.web.model.UserBean;
import com.bamsa.web.service.UserService;
import com.bamsa.web.util.ApplicationConstants;

@Controller
public class ClientLeadController {
	
	
	@Autowired
	UserService userServiceImpl;
	@Autowired
    private JavaMailSender mailSender;
	private static Logger logger = Logger.getLogger(ClientLeadController.class);
	@RequestMapping("/riseClientLead")
	public String saveClientLead(HttpServletRequest request) {
		logger.info("enter into leadTicketRaise");
		try {
			ClientLeadModel model= buildClientLeadDetails(request);
			model= userServiceImpl.saveClientLead(model);
			EmployeeDetailsModel empModelDetails= userServiceImpl.getEmplDetails(model.getRaisedBy());
			 String recipientAddress = empModelDetails.getEmail();
		        String subject = "Client Lead Successfully ";
		        String message = "Hi, You had successfully raised the Client Lead.The concerned administration department"
		        		+ "person will contact you soon";
		        		
		       
		             
		        // prints debug info
		        logger.info("To: " + recipientAddress);
		        logger.info("Subject: " + subject);
		        logger.info("Message: " + message);
		         
		        // creates a simple e-mail object
		        SimpleMailMessage email = new SimpleMailMessage();
		       
		        	email.setTo(recipientAddress);
		        	email.setSubject(subject);
		            email.setText(message);
		      	             
		            // sends the e-mail
		            mailSender.send(email);
		      if(model!=null) {
		    	  request.setAttribute("successmessage", "Client lead Raised Successfully");
		      }
		      else  {
		    	  request.setAttribute("errormessage","Sorry! lead not raised");
		      }
		      logger.info(model);
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		
		return "forward:/showTicket";
	}
	public  ClientLeadModel buildClientLeadDetails(HttpServletRequest request) {
		logger.info("enter into buildClientLeadDetails");
		ClientLeadModel model= new ClientLeadModel();
		try {
			UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
			int uid =userData.getUid();
			
			model.setClient(request.getParameter("client"));
			model.setContactName(request.getParameter("contactName"));
			model.setLocation(request.getParameter("location"));
			model.setDesignation(request.getParameter("designation"));
			model.setEmailId(request.getParameter("emailId"));
			model.setPhoneNo(request.getParameter("phoneNo"));
			model.setRaisedBy(uid);
		}catch(Exception e) {
			logger.error(e.getMessage());		
		}
		logger.info(model);
		logger.info("exit from buildClientLeadDetails");
		return model;
	}
	
	@RequestMapping("/showClientLead")
	public String  showClientLeadTicket(HttpServletRequest request) {
		try {
			List<EmployeeModel> reportdetails = userServiceImpl.getEmployeesReportingDetails();
			 logger.info(reportdetails);
				request.setAttribute("leadReport",reportdetails );	

		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return "ticketforlead";
	}
	@RequestMapping("/viewClientLead")
	public String showRisedTickets(HttpServletRequest request){
		try{
		UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
		int uid =userData.getUid();
		EmployeeDetailsModel empModel = (EmployeeDetailsModel)request.getSession().getAttribute(ApplicationConstants.EMPLOYEE_REGISTRATION_DETAILS);
		int sid =empModel.getStreamId();
		 List<EmployeeModel> reportdetails = userServiceImpl.getEmployeesReportingDetails();
		List<AssetTicketModel> assetmodel = userServiceImpl.getAssetTicket();
		if(sid == 18){
			request.setAttribute("ticketDetails", assetmodel);
			}
		else{
			List<AssetTicketModel> individual = new ArrayList<AssetTicketModel>();
			
			for(AssetTicketModel ticket :assetmodel)
			{
				if(ticket.getRisedby()==uid)
				{
					individual.add(ticket);
				}
			request.setAttribute("ticketDetails",individual);
			}
		    }
		
	    request.setAttribute("empdetails",reportdetails);
}catch(Exception e){
			logger.error(e.getMessage());
		}
		return "viewticket";
		
	}

}
