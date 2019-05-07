package com.bamsa.db.dao.impl;

import java.util.HashMap;
import java.util.List;
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
import com.bamsa.db.exceptions.DBUpdateException;
import com.bamsa.db.impls.mappers.ClientLeadTicketRowMapper;
import com.bamsa.db.impls.stmtsetters.ClientLeadFeedbackStatusStmtSetters;
import com.bamsa.db.impls.stmtsetters.ClientLeadStatusStmtSetter;
import com.bamsa.db.util.DBConstants;
import com.bamsa.db.util.ErrorConstants;
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
			recordParameters.put("designation", bean.getDesignation());
			recordParameters.put("feedbackStatus",bean.getFeedbackStatus());
			recordParameters.put("phoneNo", bean.getPhoneNo());
			recordParameters.put("meetingDetails",bean.getMeetingDetails());
			recordParameters.put("raisedBy",bean.getRaisedBy());
			recordParameters.put("raiseDate", bean.getRaisedDate());
			recordParameters.put("requestTo", bean.getRequestTo());
			recordParameters.put("meetingDetailsFile", bean.getMeetingDetailsFile());
			logger.info(recordParameters);
			bean.setCid(jdbcInsert.executeAndReturnKey(recordParameters).intValue());
			logger.info("Lead created");		
		}	
		return bean;
	}
	@Override
	public List<ClientLeadBean> getClientLeadTicket() {
		logger.info("enter into getClientLeadTicket");
		String getTicket=dbProps.getProperty(DBConstants.LOAD_CLIENT_LEAD_TICKETS);
		List<ClientLeadBean> details=jdbcTemplate.query(getTicket,new ClientLeadTicketRowMapper());
		logger.info(details);
		logger.info("exit from getClientLeadTicket");
			return details;
	}
	@Override
	public ClientLeadBean updateClientLeadStatus(ClientLeadBean bean) throws DBUpdateException {
		logger.info("Enter into updateClientLeadStatus");
		int cid=bean.getCid();
		logger.info(cid);
		String updateQuery=dbProps.getProperty(DBConstants.UPDATE_CLIENT_LEAD_STATUS);
		int numberRecordsUpdated =jdbcTemplate.update(updateQuery,new ClientLeadStatusStmtSetter(bean));
		 if(numberRecordsUpdated == 0){
			  DBUpdateException dbException = new DBUpdateException("Zero Records updated");
	            dbException.setErrorCode(ErrorConstants.UPDATE_THSTATUS_FAILED);
	            throw dbException;
	        }
	        logger.info("exit from updateClientLeadStatus ");
	        return bean;	
	}
	@Override
	public int updateClientLeadFeedbackStatus(ClientLeadBean bean) throws DBUpdateException {
		logger.info("enter into updateClientLeadFeedbackStatus");
		int cid=bean.getCid();
		logger.info(cid);
		String feedbackUpdateQuery= dbProps.getProperty(DBConstants.UPDATE_CLIENT_LEAD_FEEDBACKSTATUS);
		int numberRecordsUpdated= jdbcTemplate.update(feedbackUpdateQuery, new ClientLeadFeedbackStatusStmtSetters(bean));
		if(numberRecordsUpdated==0) {
			DBUpdateException dbException = new DBUpdateException("Zero records Updated");
			dbException.setErrorCode(ErrorConstants.UPDATE_THSTATUS_FAILED);
			throw dbException;
		}
		logger.info("exit from updateClientFeedBackStaus");
		return numberRecordsUpdated;
	}

}
