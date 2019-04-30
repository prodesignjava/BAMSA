 <%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@page import="com.bamsa.web.model.UserBean"%>
<%@page import="com.bamsa.web.model.EmployeeModel"%>
<%@page import="com.bamsa.web.model.ClientLeadModel"%>
<%@page import="com.bamsa.web.model.EmployeeDetailsModel" %>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<% 
UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);


if(userData == null)
{
	response.sendRedirect("/bamsa");	
}
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Client Lead Rise Ticket</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<% 

List<EmployeeModel> details=(List)request.getAttribute("leadReport");
String successmessage =(String)request.getAttribute("successmessage");
if(successmessage==null){
	successmessage="";
}
String message =(String)request.getAttribute("errormessage");
if(message==null){
	message="";
}

%>
<% 
EmployeeDetailsModel empModel = (EmployeeDetailsModel)request.getSession().getAttribute(ApplicationConstants.EMPLOYEE_REGISTRATION_DETAILS);

boolean  showall=false;
 
 if(null!=empModel && (empModel.getStreamId()==0|| empModel.getStreamId()==18)) {
 	 showall=true;
 }
 boolean showbranch = false;
	if (null!=empModel && (empModel.getStreamId() == 0 || empModel.getStreamId() == 18||empModel.getStreamId()==16||empModel.getStreamId()==17||empModel.getStreamId()==11)) {
		showbranch = true;
	}
 %>

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
		jQuery(document).ready(function() {
			$(".datepickers").datepicker({
				dateFormat : 'dd-mm-yy',
				changeMonth : true,
				changeYear : true,
				 yearRange: "-100:+100"
				
			});

		});
	</script>
	<script>
$( document ).ready(function() {
	$("#assets").addClass("act");
	$("#riseticket").addClass("actv");
});
function getperform() {

	var myWindow = window.open("../bamsa/createBranch", "window",
			"width=600,height=300");

}
</script>

	<div class="right_col" role="main">
          <h3 style="text-align: center; color: green"></h3><div class="">
            <div class="page-title">
  
  
  
              <div style="/*! margin-left: 161px; */" class="col col-xs-6">
       <div class="btn-group btn-breadcrumb">
             <%if(showall){ %>
            <a href="showClientLead" id="riseticket" class="btn btn-info">Raise Client Lead Ticket</a>
            <a href="viewClientLead" class="btn btn-info">Show Client Lead Ticket</a>
            <a href="licensedetails" class="btn btn-info">View All Client Lead Tickets</a>
            <%}else{ %>
             <a href="showClientLead" id="riseticket" class="btn btn-info">Raise Ticket</a>
            <a href="viewClientLead" class="btn btn-info">Ticket Show</a>
            <%} %>
        </div>
        
	</div>

<div class="title_left text-center">
                <h3>Raise ticket for
								Client Leads </h3>
              </div>
<div class="col-xs-12">
				
				<h3 style="text-align: center; color: green"><%=successmessage %></h3>
				<h3 style="text-align: center; color: red"><%=message %></h3>
				</div>
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
             <div class="x_panel" style="height: 663px;margin-top: 20px;">
                  <div class="x_content">


	
				<form:form action="riseClientLead" method="post"
					enctype="multipart/form-data" name="registration" id="registration"
					class="register">
					<div class="col-md-11 col-md-offset-1">
						<fieldset class="row1">

							<p>
								<label for="Client Name" class="col-md-4 control-label">
									Client Name</label> <input class="form-control long" type="text"
									name="client" id="client" value="" required />


							</p>

							<p>
								<label for="" class="col-md-6 control-label">
									Contact Person Name </label> <input class="form-control long" type="text"
									name="contactName" id="contactName" value="" required />
							</p>
							

                            <p>
								<label for="name" class="col-md-6 control-label">
									Contact Person No </label> <input class="form-control long" type="text"
									name="contactNo" id="contactNo" value="" required />
							</p>
							
						    <p>
								<label for="name" class="col-md-6 control-label">
									Contact Person EmailId </label> <input class="form-control long" type="text"
									name="emailId" id="emailId" value="" required />
							</p>

                              <p>
								<label for="name" class="col-md-6 control-label">
									Client Location </label> <input class="form-control long" type="text"
									name="location" id="location" value="" required />
							</p>
							<p>
								<label for="serial" class="col-md-4 control-label">Select
									Requesting to </label> <select class="form-control" name="requestingto" required="required">
									<option value="">Select</option>
									<%for(EmployeeModel det :details){%>
									<option value="<%=det.getUid()%>"><%=det.getEmpId()%></option>
									<% }%>
								</select>


							</p>
							
							<div id="warning" style="display:none">
							</div>
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
</div>
</div>
</div> 
</div>
</div>


	
<!-- JavaScript jQuery code from Bootply.com editor  -->
	
</body> 