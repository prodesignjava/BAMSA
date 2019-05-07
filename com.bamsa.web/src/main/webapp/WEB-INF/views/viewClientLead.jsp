<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="java.util.List"%>
<%@page import="com.bamsa.web.model.UserBean"%>
<%@page import="com.bamsa.web.model.ClientLeadModel"%>
<%@page import="com.bamsa.web.model.EmployeeModel"%>
<%@page import="com.bamsa.web.model.EmployeeDetailsModel"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>TicketDetails</title>
<% 
UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
if(userData == null)
{
	response.sendRedirect("/bamsa");	
}
%>
<%
EmployeeDetailsModel empModel = (EmployeeDetailsModel)request.getSession().getAttribute(ApplicationConstants.EMPLOYEE_REGISTRATION_DETAILS);

List<ClientLeadModel> ticketdetails=(List)request.getAttribute("clientDetails"); 
List<EmployeeModel> employeedetails = (List)request.getAttribute("empdetails"); 

%>
<% 

 boolean  showall=false;
 
 if(null!=empModel && (empModel.getStreamId()==0|| empModel.getStreamId()==18)) {
 	 showall=true;
 }
 
 %>
<script type="text/javascript" src='<c:url value="/static/js/jquery-1.11.1.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/static/js/jquery-ui.min.js"/>'></script>
<link rel="stylesheet" href='<c:url value="/static/css/jquery-ui.css" />'/>

<style>
.active {
	font-weight: bold;
	background-color: #fff !important;
}
.tabi {

    overflow-x: scroll !important;
}
</style>
<!-- HTML code from Bootply.com editor -->
<body class="nav-md">
    <div class="container body">
      <div class="main_container">
             <jsp:include page="header.jsp" />
<script>
$( document ).ready(function() {
/* 	$("#assets").addClass("act");
 */	$("#showClientLead").addClass("actv");
});


</script>
<script>
function updateClientLeadTicketStatus(cid,status){
	
	$.ajax({
		type:"post",
		url:"updateClientLeadTicketStatus?cid="+cid+"&status="+status,
		success: function(){alert("Approved");},
		error: function(){alert("Not updated");}
		
		
	});
};

</script>

<script>
$(document).ready(function(){
    $('#myTable').DataTable();
});	
</script>
</head>

             <div class="right_col" role="main">
          <h3 style="text-align: center; color: green"></h3><div class="">
            <div class="page-title">
  
  
  
              <div style="/*! margin-left: 161px; */" class="col col-xs-12">
       <div class="btn-group btn-breadcrumb">
             <%if(showall){ %>
            <a href="showClientLead" id="riseticket" class="btn btn-info">Raise Client Lead Ticket</a>
            <a href="viewClientLead" id="showticket" class="btn btn-info">Show Client Lead Ticket</a>
            <a href="viewClientLead" class="btn btn-info">View All Client Lead Tickets</a> 
            <a href="feedback" id="feedback"class="btn btn-info">Feedback</a>
            <%}else{ %>
             <a href="showClientLead" id="riseticket" class="btn btn-info">Raise Client Lead Ticket</a>
            <a href="viewClientLead" id="showticket"class="btn btn-info">Show Client Lead Ticket</a>
             <a href="feedback" id="feedback"class="btn btn-info">Feedback</a>
           
            <%} %>
        </div>
        
	</div>
	<%-- <div class=" col-xs-3 col-xs-offset-9">
	<a href="<%=request.getContextPath( )%>/TicketDetailsExcel"><button type="button" class="btn btn-primary"><i class="fa fa-file-excel-o" aria-hidden="true"><b>Excel</b></i></button></a>
    <a href="<%=request.getContextPath( )%>/TicketDetailsPdf"><button type="button" class="btn btn-success"><i class="fa fa-file-pdf-o" aria-hidden="true"><b>PDF</b></i></button></a>
	</div>
 --%>

				
				
				
            </div>
            
            
            
            <div class="right_col" role="main">
          <div class="row">
  
	</div>
	</div>
	<div>
	<h1></h1>
	</div>
            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel" style="height: 1020px;">
                
                  <div class="x_content">
				
             
             
	
					<div class="board-inner">
						
					</div>

					<div class="tab-content">
						<div class="tab-pane fade in active" id="home">				
		<div class="row" style="margin-right: auto;margin-left: 2px;">

            <div class="panel panel-primary panel-table">
              <div class="panel-heading">
                <div class="row">
                
                    <h2 class="panel-title text-center"><b>Client Lead Ticket Details</b></h2>
                
                  
                </div>
              </div>
               <div class="table-responsive tabi">
              <table id="myTable" class="table table-striped table-bordered table-list" style="text-align: center;" id="dev-table">
							<thead>
								<tr class="st1">
                                <th class="info" >S.No</th>
                                <th class="info" >Client</th>
                                <th class="info" >Contact Name</th>
                                <th class="info" >Contact No</th>
                                 <th class="info" >Contact Designation</th>
								<th class="info" >Contact EmailId</th>
								
								<th class="info" >Client Location</th>
								<th class="info">Meeting Confirmation</th>
								<th class="info" >Request To</th>
								<th class="info" >Raised By</th>
                                <th class="info" >Raised Date</th>
								<th class="info" >status</th>
                                <th class="info" >Approved By</th>
								<th class="info" >Approved Date</th>
								 <th class="info">Feedback Status</th>
								
								
							</tr>
						</thead>
						<tbody>
						
						<%
								int i=1;
								if(null!=ticketdetails){
                                 for(ClientLeadModel ticket:ticketdetails){
                                	
                                  %>
							<tr class="st1">
                                <td ><%=i%></td>
								<td ><%=ticket.getClient()%></td>
								<td ><%=ticket.getContactName()%></td>
								<td><%=ticket.getPhoneNo() %></td>
								<td><%=ticket.getDesignation()%></td>
								
								<td><%=ticket.getEmailId()%></td>
								<td><%=ticket.getLocation()%></td>
								<%if(null!=ticket.getMeetingDetails()){ %>
									<td><%=ticket.getMeetingDetails() %>
									<%}else{ %>
									<td><%=ticket.getMeetingDetailsFile()%></td>
									<%} %>
									
								<% for(EmployeeModel emp1:employeedetails){
									if(ticket.getRequestTo()==emp1.getUid())
									{%>
										<td ><%=emp1.getEmpId()%></td>
									<%}}%>
								<td><%=ticket.getEmpId()%></td>
								<td style='white-space:nowrap;'><%=ticket.getRaisedDate()%></td>																								
								<%
							      Date today=new Date();
								if(null!=ticket.getStatus()){ 
									
									if(ticket.getStatus().equals("NA"))  {%>
				                        <%if(empModel.getStreamId()==18){%>
										<td><button  class="btn btn-info btn-sm" onClick="updateClientLeadTicketStatus('<%=ticket.getCid()%>','<%=ticket.getStatus()%>')">APPROVE NOW</button></td>
								        <%}else{ %>
								       <td><span class="label label-danger ">NOT APRROVED</span></td>
								        <% }%>
								<% }%><%else{%>
										<td><span class="label label-success">APPROVED</span></td>
									<% }%>
								
								<%} %>
								
								<% if(ticket.getApprovedBy()!=0 && null!=ticket.getApprovedDate()){%>
								  <% for(EmployeeModel emp:employeedetails){
									if(ticket.getApprovedBy()==emp.getUid())
									{%>
								  <td ><%=emp.getEmpId()%></td>
								  <%}}%>
								<td style='white-space:nowrap;'><%=ticket.getApprovedDate()%></td>
								<%}else{ %>
								<td>---</td>
								<td>---</td>
								<%} %>
								<%if(null!=ticket.getFeedbackStatus()) {%>
									<td><%=ticket.getFeedbackStatus() %></td>
									
								<%}else{ %>
									<td>---</td>
								<%} %>					
							</tr>
						<%i++;}}%>	
						</tbody>

								</table>	
										
                             
					</div>
					</div>
					</div>
					</div>
               
             </div>
             </div>
             </div>
             </div>
             </div>
            
						
						 </div>
						  </div>
						  </div>
						  </div>
	</section>
	<!-- -- -->

<script type="text/javascript" src='<c:url value="/static/js/jquery.dataTables.min.js"/>'></script> 
<link rel="stylesheet" href='<c:url value="/static/css/jquery.dataTables.min.css"/>' />
</body>
</html>

