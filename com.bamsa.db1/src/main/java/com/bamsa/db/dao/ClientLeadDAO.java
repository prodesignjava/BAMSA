package com.bamsa.db.dao;

import java.util.List;

import com.bamsa.db.beans.ClientLeadBean;
import com.bamsa.db.exceptions.DBUpdateException;

public interface ClientLeadDAO {
	/**
	 * creates a client lead
	 * @param ClientLeadBean bean
	 * @return ClientLeadBean 
	 */
	public ClientLeadBean createClientLead(ClientLeadBean bean);

	public List<ClientLeadBean> getClientLeadTicket();
	public ClientLeadBean updateClientLeadStatus(ClientLeadBean bean) throws DBUpdateException;
	public int updateClientLeadFeedbackStatus(ClientLeadBean bean) throws DBUpdateException;

}
