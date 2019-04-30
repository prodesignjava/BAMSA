package com.bamsa.db.impls.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;

import com.bamsa.db.beans.AssetTicketBean;
import com.bamsa.db.beans.ClientLeadBean;

public class ClientLeadTicketRowMapper implements RowMapper<ClientLeadBean> {
	private static Logger logger = Logger.getLogger(ClientLeadTicketRowMapper.class);


	@Override
	public ClientLeadBean mapRow(ResultSet rs, int rowNum) throws SQLException {
		logger.info("enter into ClientLeadBean");
		ClientLeadBean ticket= new ClientLeadBean();
		ticket.setCid(rs.getInt("cid"));
		ticket.setClient(rs.getString("client"));
		ticket.setContactName(rs.getString("contactName"));
		ticket.setPhoneNo(rs.getString("phoneNo"));
		ticket.setEmailId(rs.getString("emailId"));
		ticket.setLocation(rs.getString("location"));
		ticket.setDesignation(rs.getString("designation"));
		ticket.setFeedbackStatus(rs.getString("feedbackStatus"));
		ticket.setRequestTo(rs.getInt("requestTo"));
		ticket.setRaisedBy(rs.getInt("risedBy"));
		ticket.setRaisedDate(rs.getDate("risedDate"));
		ticket.setApprovedBy(rs.getInt("approvedBy"));
		ticket.setApprovedDate(rs.getDate("approvedDate"));
		ticket.setStatus(rs.getString("status"));
		ticket.setEmpId(rs.getString("empId"));
		logger.info(ticket);
        logger.info("exit from ClientLeadBeanBean");
        return ticket;
	}

}
