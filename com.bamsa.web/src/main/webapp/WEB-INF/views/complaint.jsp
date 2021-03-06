<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@page import="com.bamsa.web.model.UserBean"%>
<%@page import="com.bamsa.web.model.EmployeeDetailsModel" %>

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

<title>Grievance cell</title>
<!-- NProgress -->
         <link rel="stylesheet" href='<c:url value="/static/css/dashboardcss/nprogress.css"/>' />
<% 
String successmessage =(String)request.getAttribute("successmessage");
if(successmessage==null){
	successmessage="";
}
String errormessage = (String) request.getAttribute("errormessage");
if (errormessage == null) {
	errormessage = "";
}
%>
<%
EmployeeDetailsModel empModel = (EmployeeDetailsModel)request.getSession().getAttribute(ApplicationConstants.EMPLOYEE_REGISTRATION_DETAILS);

boolean showgrievanceform=true;

if(null!=empModel && empModel.getDesigId()==0){
	showgrievanceform=false;
	%>
	<script>
$( document ).ready(function() {
	$("#complaint").addClass("act");
	$("#complaintform").addClass("actv");
	
});
	
</script>
	
<% } else{%>
<script>
$( document ).ready(function() {
	$("#complaint").addClass("act");
	$("#complaintform").addClass("actv");
	
});
	
</script>
<%} %>

 
 <body class="nav-md">
    <div class="container body">
      <div class="main_container">
             <jsp:include page="header.jsp" />
<script>
$( document ).ready(function() {
	$("#complaint").addClass("act");
	$("#complaintform").addClass("actv");
	
});
	
</script>

<script>
$(function () {
	 $('#mob').keydown(function (e) {
	 if (e.shiftKey || e.ctrlKey || e.altKey) {
	 e.preventDefault();
	 } else {
	 var key = e.keyCode;
	 if (!((key == 8) || (key == 46) || (key >= 35 && key <= 40) || (key >= 48 && key <= 57) || (key >= 96 && key <= 105))) {
	 e.preventDefault();
	 }
	 }
	 });
	 });
$(document).ready(function() {
	 $("[required]").after("<span class='required'>*</span>");
	});
</script>

	<div class="right_col" role="main">
          <h3 style="text-align: center; color: green"></h3><div class="">
            <div class="page-title">
  
  
  
              <div style="/*! margin-left: 161px; */" class="col col-xs-12">
       <div class="btn-group btn-breadcrumb">
       <%if(showgrievanceform){ %>
                 <a href="complaintform" id="complaintform" class="btn btn-info act" style="font-size: 15px!important">Grievance Form</a>
            <%} %>
            <a href="Grievances" class="btn btn-info" style="font-size: 15px!important">Grievance Details</a>
        </div>
        <h3 style="text-align: center; color: green"><%=successmessage %></h3>
				<h3 style="text-align: center; color: red"><%=errormessage %></h3>
	</div>
<div class="title_left text-center">
                <h3>Grievance Form</h3>
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
                <div class="x_panel" style="height: 663px;">
                
                  <div class="x_content">
                  
			<form id="command" class="register" action="complaint" method="post">
            <div class="col-md-6">
            <fieldset class="row2">     
               <legend>Grievance Form</legend>
                <p>
                    <label>Types of Grievance 
                    </label>
                    <select id="gtype" name="gtype" required="required">
                    <option value="">Select any one
                        </option>
                        <option value="1">Pay and Benefits</option>
                        <option value="2">Work Loads</option>
                        <option value="3">Work Conditions</option>
                        <option value="4">Union and Management Relations</option>
                        <option value="5">Harassment</option>
                        </select><span class="required">*</span>  
                </p>
                <p>
                    <label>Severity of Grievance
                    </label>
                    <select id="severe" name="severe" required="required">
                    <option value="">Select any one
                        </option>
                        <option value="1">1--Less severe 
                        </option>
                        <option value="2">2--Moderate
                        </option>
                         <option value="3">3--Normal
                        </option>
                        <option value="4">4--Severe
                        </option>
                         <option value="5">5--More Severe
                        </option>
                        </select>
                   
                   
                </p>
                 <p>
                    <label>Mobile No
                    </label>
                    <input type="text" class="long" value="" maxlength="10" name="mob" id="mob" pattern="[789][0-9]{9}" required/> 
                </p>
                 <p>
                    <label>Details Of the Complaint  
                    </label>
<textarea rows="8" cols="38" name="dtc" id="details" class="details" value="" required="" style="width: 247px; height: 257px;"></textarea>                </p>
                
            </fieldset>
            </div>
           <div class="col-md-6">
            
              <div class="row">
               <div class="main-content" style="margin-top: 56px;">

<div class="panel panel-primary">
<div class="panel-heading">
<h6 class="panel-title">Pay and Benefits</h6>
</div>
<div >
<p ><b>
These grievances may involve the amount and qualifications for pay increases,
 pay equity for comparable work within the organization, 
 and the cost and coverage of benefit programs. 
</b></p>
</div>
<div class="panel-heading">
<h6 class="panel-title">Work Loads</h6>
</div>
<p><b>
 Heavy workloads are a common employee and workplace grievance. 
 If you work for a company that is going through lean times,
  you may have been asked to take on more work without a pay increase.
</b></p>
<div class="panel-heading">
<h6 class="panel-title">Work Conditions</h6>
</div>
<div >
<p ><b>
A safe and clean work environment is crucial to employee satisfaction and motivation.
Employees who believe a company is not following applicable regulations and guidelines may decide to file a grievance. 
</b></p>
</div>
<div class="panel-heading">
<h6 class="panel-title">Union and Management Relation</h6>
</div>
<div >
<p><b>
When unions represent employees, both the union and management must avoid unfair labor practices. 
Employees may file grievances when they experience unfair labor practices. 
</b></p>
</div>
</div>
</div>
				</div>
					
				</div>
					
         <div class="col-md-12">
            <fieldset class="row1">
               <div><button  class="btn btn-primary btn-lg btn3d" type="submit">Register &raquo;</button></div>
               <input type="hidden" value="0" id="uid" name="uid"/>
            </fieldset>
            </div>
        </form>
				
			</div>
		</div>
		</div>
</div>
</div>
</div>
</div>
</div>
<!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- validator -->
</body>
</html>
