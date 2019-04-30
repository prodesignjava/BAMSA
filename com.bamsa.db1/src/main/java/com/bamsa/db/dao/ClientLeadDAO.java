package com.bamsa.db.dao;

import java.util.List;

import com.bamsa.db.beans.ClientLeadBean;

public interface ClientLeadDAO {
	/**
	 * creates a client lead
	 * @param ClientLeadBean bean
	 * @return ClientLeadBean 
	 */
	public ClientLeadBean createClientLead(ClientLeadBean bean);

	public List<ClientLeadBean> getClientLeadTicket();

}
