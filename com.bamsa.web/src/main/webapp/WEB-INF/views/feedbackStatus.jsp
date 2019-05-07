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
<title>Feedback</title>
<%
	UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);
	if (userData == null) {
		response.sendRedirect("/bamsa");
	}
%>
<%
	EmployeeDetailsModel empModel = (EmployeeDetailsModel) request.getSession()
			.getAttribute(ApplicationConstants.EMPLOYEE_REGISTRATION_DETAILS);

	List<ClientLeadModel> ticketdetails = (List) request.getAttribute("clientDetails");
	String successmessage = (String) request.getAttribute("successmessage");
	if (successmessage == null) {
		successmessage = "";
	}
	String message = (String) request.getAttribute("errormessage");
	if (message == null) {
		message = "";
	}
%>
<%
	boolean showall = false;

	if (null != empModel && (empModel.getStreamId() == 0 || empModel.getStreamId() == 18)) {
		showall = true;
	}
%>
<script type="text/javascript"
	src='<c:url value="/static/js/jquery-1.11.1.min.js"/>'></script>
<script type="text/javascript"
	src='<c:url value="/static/js/jquery-ui.min.js"/>'></script>
<link rel="stylesheet"
	href='<c:url value="/static/css/jquery-ui.css" />' />

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
   $(document).ready(function() {
	  
		 $("[required]").after("<span class='required'>*</span>");
		});
   </script>

	<script>
$( document ).ready(function() {
/* 	$("#assets").addClass("act");
 */	$("#feedback").addClass("actv");
});
</script>



			</head>

			<div class="right_col" role="main">
				<h3 style="text-align: center; color: green"></h3>
				<div class="">
					<div class="page-title">



						<div style="" class="col col-xs-12">
							<div class="btn-group btn-breadcrumb">
								<%
									if (showall) {
								%>
								<a href="showClientLead" id="riseticket" class="btn btn-info">Raise
									Client Lead Ticket</a> <a href="viewClientLead" id="showticket"
									class="btn btn-info">Show Client Lead Ticket</a> <a
									href="viewClientLead" class="btn btn-info">View All Client
									Lead Tickets</a>
								<a href="feedback" id="feedback" class="btn btn-info">Feedback</a>
									
								<%
									} else {
								%>
								<a href="showClientLead" id="riseticket" class="btn btn-info">Raise
									Client Lead Ticket</a> 
								<a href="viewClientLead" id="showticket"
									class="btn btn-info">Show Client Lead Ticket</a>
								<a href="feedback" id="feedback" class="btn btn-info">Feedback</a>
								<%
									}
								%>
							</div>

						</div>
						<%-- <div class=" col-xs-3 col-xs-offset-9">
							<a href="<%=request.getContextPath()%>/TicketDetailsExcel"><button
									type="button" class="btn btn-primary">
									<i class="fa fa-file-excel-o" aria-hidden="true"><b>Excel</b></i>
								</button></a> <a href="<%=request.getContextPath()%>/TicketDetailsPdf"><button
									type="button" class="btn btn-success">
									<i class="fa fa-file-pdf-o" aria-hidden="true"><b>PDF</b></i>
								</button></a>
						</div>
 --%>

						<div class="title_left text-center">
							<h3>Feedback</h3>
						</div>
						<div class="col-xs-12">

							<h3 style="text-align: center; color: green"><%=successmessage%></h3>
							<h3 style="text-align: center; color: red"><%=message%></h3>
						</div>
					</div>
				</div>
				<div class="right_col" role="main">
					<div class="row"></div>
				</div>
				<div class="clearfix"></div>
				<div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
             <div class="x_panel" style="height: 663px;margin-top: 20px;">
                  <div class="x_content">
                  <form:form action="updateFeedbackStatus" method="post"
					enctype="multipart/form-data" name="registration" id="registration"
					class="register">
					<div class="col-md-11 col-md-offset-1">
					<fieldset class="row1">
					<p>
								<label for="serial" class="col-md-4 control-label">Select
									Client</label> <select class="form-control" name="cid" required="required">
									<option value="">Select</option>
									<%for(ClientLeadModel det :ticketdetails){%>
														<option value="<%=det.getCid()%>"><%=det.getClient()%></option>
									<% }%>
								</select>

				<p>
				 <p>
								<label for="name" class="col-md-6 control-label">
									Feedback </label> <input class="form-control long" type="text"
									name="status" id="status" value="" required />
							</p>
							<div id="warning" style="display:none"/>
					</fieldset>
					</div>
					<div class="col-md-12">
					<center> <fieldset class="row1">
					<div><button  class="btn btn-primary btn-lg btn3d" type="submit">Submit &raquo;</button></div>
					<input type="hidden" value="0" id="uid" name="uid"/>
           			 </fieldset></center>
					</div>
					</form:form>

			</div>
		</div>
		</div>
		</div>

		</section>

		<script type="text/javascript"
			src='<c:url value="/static/js/jquery.dataTables.min.js"/>'></script>
		<link rel="stylesheet"
			href='<c:url value="/static/css/jquery.dataTables.min.css"/>' />
</body>
</html>