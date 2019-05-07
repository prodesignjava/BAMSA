package com.bamsa.db.impls.stmtsetters;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.bamsa.db.beans.ClientLeadBean;

public class ClientLeadFeedbackStatusStmtSetters implements PreparedStatementSetter {

	private static Logger logger =Logger.getLogger(ClientLeadFeedbackStatusStmtSetters.class);
	private ClientLeadBean bean;
	public ClientLeadFeedbackStatusStmtSetters(ClientLeadBean bean) {		
		this.bean = bean;
	}

	@Override
	public void setValues(PreparedStatement ps) throws SQLException {
		logger.info("enter into ClientLeadFeedbackStatusStmtSetters");
		ps.setString(1,bean.getFeedbackStatus());
		ps.setInt(2, bean.getCid());
		logger.info(ps);
		logger.info("exit from ClientLeadFeedbackStatus");
	}
}
