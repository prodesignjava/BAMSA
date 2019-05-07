package com.bamsa.db.impls.stmtsetters;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.bamsa.db.beans.AssetTicketBean;
import com.bamsa.db.beans.ClientLeadBean;

public class ClientLeadStatusStmtSetter implements PreparedStatementSetter {

	private static Logger logger = Logger.getLogger(ClientLeadStatusStmtSetter.class);

	ClientLeadBean clientLeadDetails;
	
	public ClientLeadStatusStmtSetter(ClientLeadBean clientLeadDetails) {
		this.clientLeadDetails = clientLeadDetails;
	}

	@Override
	public void setValues(PreparedStatement ps) throws SQLException {
		logger.info("enter into prepared statement in ClientLeadStatusStmtSetter");
		ps.setInt(1,clientLeadDetails.getApprovedBy());
		ps.setDate(2,new java.sql.Date(clientLeadDetails.getApprovedDate().getTime()));
		ps.setInt(3,clientLeadDetails.getCid());
		logger.info(ps);
		logger.info("exit from ClientLeadStausSetter");
	}

}
