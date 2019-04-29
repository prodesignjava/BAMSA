package com.bamsa.db.impls.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;

import com.bamsa.db.beans.TaskDetails;

public class EmpTasksDetailsRowMapper implements RowMapper<TaskDetails>{

	private static Logger logger = Logger.getLogger(EmpTasksDetailsRowMapper.class);
	
		@Override
		public TaskDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
		
			logger.info("Enter into TaskDetails ");
			TaskDetails taskdetail = new TaskDetails();
			taskdetail.setPercentagecompleted(rs.getFloat("percentagecompleted"));
			taskdetail.setTasktype(rs.getString("tasktype").charAt(0));
			taskdetail.setGivendate(rs.getDate("givendate"));
			taskdetail.setTaskDescription(rs.getString("taskDescription"));
			taskdetail.setBacklogs(rs.getString("backlogs"));
			taskdetail.setQueries(rs.getString("queries"));
			taskdetail.setReason(rs.getString("reason"));
			taskdetail.setEmpid(rs.getString("empid"));
			taskdetail.setProjectname(rs.getString("projectname"));
			logger.info(taskdetail);
			logger.info("exit from TaskDetails");
			return taskdetail;
		}
	}

