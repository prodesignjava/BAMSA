package com.bamsa.web.builder;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.bamsa.db.beans.ClientLeadBean;
import com.bamsa.web.model.ClientLeadModel;

@Component
public class ClientLeadBuilder {
    private static 	Logger logger=Logger.getLogger(ClientLeadBuilder.class);
    public ClientLeadBean buildClientLeadBean(ClientLeadModel clientLeadModel) {
    	logger.info("enter into buildClientLeadBean");
    	ClientLeadBean bean = new ClientLeadBean();
    	bean.setClient(clientLeadModel.getClient());
    	bean.setContactName(clientLeadModel.getContactName());
    	bean.setDesignation(clientLeadModel.getDesignation());
    	bean.setEmailId(clientLeadModel.getEmailId());
    	bean.setPhoneNo(clientLeadModel.getPhoneNo());
    	bean.setCreatedBy(clientLeadModel.getCreatedBy());
    	bean.setLocation(clientLeadModel.getLocation());
    	bean.setStatus(clientLeadModel.getStatus());
    	bean.setRaisedDate(clientLeadModel.getRaisedDate());
    	bean.setRequestTo(clientLeadModel.getRequestTo());
    	bean.setMeetingDetails(clientLeadModel.getMeetingDetails());
    	bean.setRaisedBy(clientLeadModel.getRaisedBy());
    	logger.info(bean);
    	logger.info("exit from buildClientLeadBean");
    	return bean;
    }
    public ClientLeadModel buildClientLeadModel(ClientLeadBean clientLeadBean) {
    	logger.info("enter into buildClientLeadModel");
    	ClientLeadModel model= new ClientLeadModel();
    	model.setClient(clientLeadBean.getClient());
    	model.setContactName(clientLeadBean.getContactName());
    	model.setEmailId(clientLeadBean.getEmailId());
    	model.setPhoneNo(clientLeadBean.getPhoneNo());
    	model.setMeetingDetails(clientLeadBean.getMeetingDetails());
    	model.setCreatedBy(clientLeadBean.getCreatedBy());
    	model.setDesignation(clientLeadBean.getDesignation());
    	model.setFeedbackStatus(clientLeadBean.getFeedbackStatus());
    	model.setStatus(clientLeadBean.getStatus());
    	model.setRequestTo(clientLeadBean.getRequestTo());
    	model.setRaisedDate(clientLeadBean.getRaisedDate());
    	model.setRaisedBy(clientLeadBean.getRaisedBy());
    	logger.info(model);
    	logger.info("exit from build ClientLeadModel");
    	return model;
    }

}
