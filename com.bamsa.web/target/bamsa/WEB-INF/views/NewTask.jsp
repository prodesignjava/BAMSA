<%@page import="com.bamsa.web.model.EmployeeModel"%>
<%@page import="com.bamsa.web.model.EmployeeDetailsModel" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="com.bamsa.web.util.ApplicationConstants"%>
<%@page import="com.bamsa.web.model.UserBean"%>
<%@page import="com.bamsa.web.model.NewProjectModel"%>

<title>New Tasks</title>
<!DOCTYPE html>
<% 
UserBean userData = (UserBean) request.getSession().getAttribute(ApplicationConstants.LOGIN_BEAN);


if(userData == null)
{
	response.sendRedirect("/bamsa");	
}
%>

<%
EmployeeDetailsModel empModel = (EmployeeDetailsModel)request.getSession().getAttribute(ApplicationConstants.EMPLOYEE_REGISTRATION_DETAILS);

List<EmployeeModel> allEmployees = (List)request.getAttribute("Employees"); 
String streamname =(String)request.getAttribute("stream");
List<NewProjectModel> projdetails= (List)request.getAttribute("projectdetails");



boolean showmytask=true;

if(null!=empModel && empModel.getDesigId()==0){
	showmytask=false;
}
boolean showCreateproject=false;
if(null!=empModel && (empModel.getDesigId()==0||empModel.getDesigId()==6||empModel.getDesigId()==7||empModel.getDesigId()==8)){
	showCreateproject=true;
}
boolean showrdepartment = false;
if(null!=empModel && (empModel.getDesigId()==7 || empModel.getDesigId()==8 )){
	showrdepartment=true;
}
%>
<% 
 boolean Taskshow=false;
 boolean Projectshow=false;
 if(null!=empModel && empModel.getDesigId()==6){
 	 Taskshow=true;
 	 Projectshow=true;
 }
 %>
 
<script type="text/javascript" src='<c:url value="/static/js/jquery-1.11.1.min.js"/>'></script>
<script type="text/javascript" src='<c:url value="/static/js/jquery-ui.min.js"/>'></script>
<link rel="stylesheet" href='<c:url value="/static/css/jquery-ui.css" />'>
<style>
 .ui-dialog .ui-dialog-titlebar-close {
    position: absolute;
    right: .3em;
    top: 50%;
    width: 50px !important;
    margin: -10px 0 0 0;
    padding: 1px;
    height: 23px !important;
    color: gray !important;
    }
    .tabi {

    overflow-x: scroll !important;
}
    </style>
<script type="text/javascript">

$(function() {	
	 $( ".datepickers" ).datepicker({
		 
		 minDate: 0,
      	dateFormat: 'dd-mm-yy',
        changeMonth: true,//this option for allowing user to select month
        changeYear: true, //this option for allowing user to select from year range
        yearRange: "0:+100"
      });
	
	$("#dialogbox").dialog({
	    autoOpen: false,
	    width: "auto",
	     title:"Assign Task"  
	     
	   
	});
		
});





	
</script>
<script>

function opendialog(uid,empid){
	
	$("#dialogbox").dialog('open');
	$("#errorbox").empty();
	$("#taskd").val("");
	$("#deadlineof").val("");
	$("#projectname").val("");
	$("#tp").prop('checked', false);
	
	
	 
	var id=document.getElementById("userid").value=uid;
	var eid=document.getElementById("empid").value=empid;
	

	document.getElementById("tasktitle").innerHTML = "Task For "+eid;
	console.log(id);
	console.log(eid);
	
}
function assignTask(){
	var taskdescription = $("#taskd").val();
	var deadline =$("#deadlineof").val();
	var projectname=$("#projectname").val();
	var port = $("#tp:checked").val();
	console.log(port);
	if(projectname==""||taskdescription =="" ||deadline =="" || port==""){
			document.getElementById("errorbox").innerHTML="please fill the form";
			
			return false;
		}
	
	else
    {
    $("#projectnamee").val(projectname);
	$("#taskdescription").val(taskdescription);
	$("#deadline").val(deadline);
	$("#taskorproject").val(port);
	
	
	var formData = $("#taskform").serializeArray();
	
	$.ajax({
		type: "post",
		url: "/bamsa/assignTask",
		data:formData,
		success:function(){
			$("#dialogbox").dialog("close");
			alert("You successfully Assigned the Task");
		
		},
		error:function(){alert("Please verify the Details/You had already assigned this project to the same person")}
		 
	
	  });
	
	
	  return true;
	  }
	
}
	
	

</script>	

<script>
$( document ).ready(function() {
	$("#mytask").addClass("act");
	$("#assigntask").addClass("actv");
});
$(document).ready(function(){
    $('#myTable').DataTable();
});	

function getperform() {
  	
	 var myWindow = window.open("../bamsa/createProject", "window", "width=630,height=320");
   
  }      
</script>
<body class="nav-md">
    <div class="container body">
      <div class="main_container">
             <jsp:include page="header.jsp" />
             
             
             <div class="right_col" role="main">
          <h3 style="text-align: center; color: green"></h3><div class="">
          
  
  
  
              <div style="/*! margin-left: 161px; */" class="col col-xs-12">
      
 <div class="btn-group btn-breadcrumb">
          <%if(showmytask){ %>
          <a href="Mytask" class="btn btn-info">My Task</a>
            <%} %>
            <a href="Newtask" id="assigntask" class="btn btn-info">Assign Task</a>
            <a href="Taskstatus" class="btn btn-info">Task Status</a>
            <% if(showrdepartment){%>
          <a href="rdashboard" class="btn btn-info">Recruitment Activities</a>
          <%} %>
        </div>            
            
        </div>
  

	<div class=" col-xs-3 col-xs-offset-9">
	<%if(showCreateproject){ %>
				<button style="padding: 3px 5px;" class="btn btn-info btn-xs btn3d pull-right" onclick="getperform()"><b>Create Project</b></button>
				<%} %>
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
                <div class="x_panel" style="height: 1020px;">
                
                  <div class="x_content">
 
  
             
             
<div class="content-wrapper">

 
	<div>
	<h1></h1>
	</div>
       <div class="container-fluid">
		<div class="row" style="margin-right:0px">
            <div class="panel panel-primary panel-table">
              <div class="panel-heading">
                <div class="row">
                  <div >
                  
                  <% if (streamname != null){%>
                   <h2 class="panel-title text-center" style="font-size: 21px!important" ><b>New Task<%=streamname %></b></h2>
                    
                    <% }else{%>
                    <h2 class="panel-title text-center"><b>New Task</b></h2>
                    <%}%>
                  </div>
                  
                </div>
              </div>
               
               
              <div class="table-responsive tabi">
              <table id="myTable" class="table table-striped table-bordered table-list" style="text-align: center;" id="dev-table">
                  <thead>
                  <tr class="st1" style="text-align:center">
								
                                
                                <th class="info">S.No</th>
                                <th class="info" >Employee Id</th>
								<th class="info" >Name</th>
								<th class="info" >Branch</th>
							    <th class="info" >Task</th>
								
								
								
								
							</tr>
						</thead>
						<tbody>
							
								<%int i=1;
								if(null!= allEmployees){
								for(EmployeeModel emp :allEmployees) {
								%>
                                <tr class="st1">
                                 <td ><%=i %></td>
                                <td ><%=emp.getEmpId() %></td>
                                
                                <td ><%=emp.getName()%></td>
                                <td ><%=emp.getBranchname() %></td>
                                <td> <input type="button" id ="opener" class="btn btn-info btn-md" onclick="opendialog('<%=emp.getUid()%>','<%=emp.getEmpId()%>');" value="Task"/></td>
								
								
							</tr>
						 
								<% i++;}} %>
								<tbody>
      
   
        
 		
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

	<div class="col-md-6 alert alert-info" id="dialogbox">
		<div class="form-group ">
		<b><p id="tasktitle" style="text-align:center;color:#502145;font-size: 19px"></p></b>
		<b><p id="errorbox" style="text-align:center;color:#ff0000;font-size: 19px"></p></b>
	    <form id="taskform" method="post" action="assignTask">
	    	 
	    	<table>
	    	
	    	<tr>
	    	<%if(Taskshow) {%>
	        	
	    	<td><label><b>Task</b></label><input type="radio" id="tp" name="tp" value="T"  required>
	    	<label><b>Project</b></label><input type="radio" id="tp" name="tp" value="P"  required>
	    	</td> 
	    	<%} %>
	    	
				
	    	
	    	</tr>
	    	<tr style="height:50px;">
	    	<td><label><b>Select Project:</b></label></td>
	    	<td>
	    	<select id="projectname" name="projectname">
	    	<option value="">select Project Name</option>
	    	<%if(null!=projdetails){
	    	for(NewProjectModel project :projdetails){ %>
	    	<option value="<%=project.getNpid()%>"><%=project.getProjectname() %></option>
	    	
	    	<%}} %>
	    	
	    	</select>
	    	</td>
	    	</tr>
	    	
	    	<tr style="height:40px;">
	    	<td><label><b>Description:</b></label></td>
	    	<td><textarea id="taskd"rows="4" cols="20" placeholder="Give Validate Description" required></textarea></div><td>
	    	</td>
	    	</tr>
	    	
	    	
	    	
	    	<tr style="height:40px;">
	    	<td><label><b>DeadLine:</b></label></td>
	    	<td><input type="text" class ="datepickers" name =deadlineof" id ="deadlineof" required readonly/><td>
	    	</td>
	    	</tr>
	    
	    	</table>
		
			<div>
				<button type="button" onclick="assignTask()" class="btn btn-primary">Submit</button>
				<input type="hidden" id="userid" name="userid" value=""/>
				<input type="hidden" id="empid" name="empid" value=""/>
				<input type="hidden" id="taskdescription" name="taskdescription" value=""/>
				<input type="hidden" id="deadline" name="deadline" value=""/>
				<input type="hidden" id="projectnamee" name="projectnamee" value=""/>
				<input type="hidden" id="taskorproject" name="taskorproject" value="" />
				
				
						
			</div>
		</form>
		</div>
		



	</div>

<script type="text/javascript" src='<c:url value="/static/js/jquery.dataTables.min.js"/>'></script> 
<link rel="stylesheet" href='<c:url value="/static/css/jquery.dataTables.min.css"/>' />
</body>
		</html>
		
 
