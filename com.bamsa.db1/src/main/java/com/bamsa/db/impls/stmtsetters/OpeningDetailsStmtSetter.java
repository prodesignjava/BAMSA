package com.bamsa.db.impls.stmtsetters;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.bamsa.db.beans.OpeningInfoBean;

public class OpeningDetailsStmtSetter implements PreparedStatementSetter {
	private static Logger logger = Logger.getLogger(OpeningDetailsStmtSetter.class);
	
 OpeningInfoBean openininginfobean;
 
 public OpeningDetailsStmtSetter(OpeningInfoBean openininginfobean){
	 this.openininginfobean=openininginfobean;
 }
	 
	@Override
	public void setValues(PreparedStatement ps) throws SQLException {
		logger.info("enter into OpeningDetailsStmtSetter");
		ps.setString(1, openininginfobean.getPositionid());
		ps.setString(2, openininginfobean.getPositiontitle());
		ps.setString(3, openininginfobean.getState());
		ps.setString(4, openininginfobean.getCity());
		ps.setString(5, openininginfobean.getPrimaryskill());
		ps.setString(6, openininginfobean.getSecondaryskill());
		ps.setString(7, openininginfobean.getDescription());
		ps.setFloat(8, openininginfobean.getRate());
		ps.setString(9, openininginfobean.getPrimevendor());
		ps.setString(10, openininginfobean.getEndclient());
		ps.setInt(11,openininginfobean.getBilltype() );
		ps.setString(12, openininginfobean.getContactperson());
		ps.setInt(13, openininginfobean.getRqid());
		logger.info(ps);
		logger.info("exit from OpeningDetailsStmtSetter");
	}
}
