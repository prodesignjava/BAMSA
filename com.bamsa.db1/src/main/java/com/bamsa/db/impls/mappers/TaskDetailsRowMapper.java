package com.bamsa.db.impls.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;

import com.bamsa.db.beans.TaskDetails;


public class TaskDetailsRowMapper implements RowMapper<TaskDetails> {
	private static Logger logger = Logger.getLogger(TaskDetailsRowMapper.class);

	@Override
	public TaskDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
		logger.info("Enter into TaskDetails");

		TaskDetails taskdetail = new TaskDetails();
		taskdetail.setTid(rs.getInt("tid"));
		taskdetail.setEmpid(rs.getString("empid"));
		taskdetail.setProjectname(rs.getString("projectname"));
		taskdetail.setTaskDescription(rs.getString("taskDescription"));
		taskdetail.setTasktype(rs.getString("tasktype").charAt(0));
		taskdetail.setDeadline(rs.getDate("deadline"));
		taskdetail.setGivendate(rs.getDate("givendate"));
		taskdetail.setStatus(rs.getString("status"));
		taskdetail.setPercentagecompleted(rs.getFloat("percentagecompleted"));
		taskdetail.setBacklogs(rs.getString("backlogs"));
		taskdetail.setQueries(rs.getString("queries"));
		
		logger.info(taskdetail);
		logger.info("exit from TaskDetails");
		return taskdetail;
	}

}
