package com.bamsa.db.dao.impl;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.bamsa.db.beans.ClientLeadBean;
import com.bamsa.db.dao.ClientLeadDAO;
@Repository
public class ClientLeadDAOImpl implements ClientLeadDAO {
	@Autowired
	private Properties dbProps;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private static Logger logger= Logger.getLogger(ClientLeadDAOImpl.class);
	@Override
	public ClientLeadBean createClientLead(ClientLeadBean bean) {
		logger.info("enter into createClientLead");
		DataSource dataSource= jdbcTemplate.getDataSource();
		if(bean!=null) {
			SimpleJdbcInsert jdbcInsert = new SimpleJdbcInsert(dataSource);
			jdbcInsert.withTableName("clientinfo").usingGeneratedKeyColumns("cid");
			
			Map<String,Object> recordParameters=new HashMap<String,Object>();
			recordParameters.put("client", bean.getClient());
			recordParameters.put("contactName",bean.getContactName());
			recordParameters.put("emailId",bean.getEmailId());
			recordParameters.put("location",bean.getLocation());
			recordParameters.put("status",bean.getStatus());
			recordParameters.put("feedbackStatus",bean.getFeedbackStatus());
			recordParameters.put("createdBy",bean.getCreatedBy());
			recordParameters.put("phoneNo", bean.getPhoneNo());
			recordParameters.put("meetingDetails",bean.getMeetingDetails());
			logger.info(recordParameters);
			bean.setCid(jdbcInsert.executeAndReturnKey(recordParameters).intValue());
			logger.info("Lead created");		
		}	
		return bean;
	}

}
