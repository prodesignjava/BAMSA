package com.bamsa.web.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.bamsa.db.exceptions.DBUpdateException;
import com.bamsa.web.exceptions.UserLoginException;
import com.bamsa.web.model.AssetTicketModel;
import com.bamsa.web.model.CandidateInfoModel;
import com.bamsa.web.model.ClientLeadModel;
import com.bamsa.web.model.ClockTimeModel;
import com.bamsa.web.model.CompanyAccessoryModel;
import com.bamsa.web.model.CompanyAssetModel;
import com.bamsa.web.model.CompanyComponentModel;
import com.bamsa.web.model.CompanyConsumableModel;
import com.bamsa.web.model.CompanyLicenseModel;
import com.bamsa.web.model.ContactModel;
import com.bamsa.web.model.EmployeeDetailsModel;
import com.bamsa.web.model.EmployeeModel;
import com.bamsa.web.model.EmployeeTaskModel;
import com.bamsa.web.model.GrievanceDetailsModel;
import com.bamsa.web.model.NewBranchModel;
import com.bamsa.web.model.NewProjectModel;
import com.bamsa.web.model.OpeningInfoModel;
import com.bamsa.web.model.TaskDetailsModel;
import com.bamsa.web.model.UserBean;

public interface UserService {

	public UserBean authenticateUser(UserBean user) throws UserLoginException;
	public ClockTimeModel saveClockInDetails(ClockTimeModel clockInDetails);
	public List<ClockTimeModel> getClockDetials(int uid);
	public ClockTimeModel saveClockOutDetails(ClockTimeModel clockOutDetails)throws DBUpdateException;
	public EmployeeDetailsModel registerEmployee(EmployeeDetailsModel regDetails,HttpServletRequest request);
	public EmployeeDetailsModel getEmployeeDetails(int uid);
	public EmployeeDetailsModel updateEmployeeDetails(EmployeeDetailsModel updatedDetails)  throws DBUpdateException;
	public List<EmployeeDetailsModel> getEmployees();
	public List<EmployeeTaskModel> getEmployeetask(int uid);
	public List<EmployeeModel> getEmployeesUnderUser(int uid);
	public List<EmployeeDetailsModel> presentEmployeeDetails();
	public List<EmployeeDetailsModel> getAllEmployees();
	public EmployeeTaskModel saveEmployeeTask(EmployeeTaskModel employeeTaskDetails);
	public List<TaskDetailsModel> getTaskDetails(int uid);
	public TaskDetailsModel updateTaskDetails(TaskDetailsModel updatedDetails)throws DBUpdateException;
	public EmployeeDetailsModel getEmplDetails(int uid);
	public List<TaskDetailsModel> getEmpMilestones();
	public float updatePercentage(int tid,float percentage,String status,String reason)throws DBUpdateException;
	public GrievanceDetailsModel registergrievance(GrievanceDetailsModel reggrievance,HttpServletRequest request );
    public List<GrievanceDetailsModel> getAllGrievances();
    public List<EmployeeTaskModel> getEmployeeTasksPerformance(String empid,int npid);
	public String resetPassword(UserBean ub) throws DBUpdateException;
	public List<EmployeeModel> getEmployeesDepartmentDetails();
	public CompanyAssetModel registerAsset(CompanyAssetModel model);
    public CompanyLicenseModel registerLicense(CompanyLicenseModel model);
    public CompanyConsumableModel registerConsumable(CompanyConsumableModel model);
    public CompanyAccessoryModel registerAccessoryDetails(CompanyAccessoryModel model);
	public CompanyComponentModel registerComponentDetails(CompanyComponentModel model);
	public List<EmployeeModel> getEmployeesReportingDetails();
	public List<CompanyLicenseModel> getCompanyLicensesDetails();
	public List<CompanyConsumableModel> getCompanyConsumableDetails();
	public List<CompanyAssetModel> getCompanyAsset();
	public List<CompanyAccessoryModel> getCompanyAccessory();
	public List<CompanyComponentModel> getCompanyComponent();
	public AssetTicketModel registerAssetTicket(AssetTicketModel model);
	public List<AssetTicketModel> getAssetTicket();
	public AssetTicketModel updateBstatusOfAssetTicket(AssetTicketModel model)throws DBUpdateException;
	public AssetTicketModel updateRstatusOfAssetTicket(AssetTicketModel model)throws DBUpdateException;	
	public AssetTicketModel updateAssetStatus(AssetTicketModel model)throws DBUpdateException;
    public List<String> getAllEmployeesEmails();
    public GrievanceDetailsModel updateGrievanceTicketStatus(GrievanceDetailsModel model)throws DBUpdateException;
    public EmployeeDetailsModel updateEmployeeReporttoDetails(EmployeeDetailsModel model)throws DBUpdateException;
    public NewProjectModel saveNewproject(NewProjectModel newProject);
    public List<NewProjectModel> getEmployeeProjectDetails();
    public List<TaskDetailsModel> getEmployeesUnderProject(int npid);
    public List<TaskDetailsModel> getProjectTypeDetails();
    public NewBranchModel saveBranchDetails(NewBranchModel branch);
    public List<String> getBranchNameDetails();
    public CandidateInfoModel saveCandidatedetails(CandidateInfoModel model);
    public List<EmployeeModel> getAssignedtodetails() ;
    public ContactModel saveContactdetails(ContactModel contactdetails);
    public OpeningInfoModel saveOpeningdetails(OpeningInfoModel openings);
    public List<ContactModel> getAccountDetails();
    public ContactModel getAccountOwnerdetails(String accountowner);
    public List<CandidateInfoModel> getHotlistdetails();
    public List<CandidateInfoModel> getCandidateDetails(); 
    public OpeningInfoModel getOpeningdetails(int rqid);
    public List<OpeningInfoModel> getAllOpeningdetails();
    public List<EmployeeModel> getEmployeeLeadReportingDetails();
    public CandidateInfoModel updateCandidateDetails(CandidateInfoModel candidatedetails)throws DBUpdateException;
    public OpeningInfoModel updatedOpeningDetails(OpeningInfoModel openingdetails)throws DBUpdateException;
    public CandidateInfoModel updateHotlistDetails(CandidateInfoModel hotlistdetails)throws DBUpdateException;
    public List<ContactModel> getSubcontractEmails();
    public ContactModel updateContactDetails(ContactModel contactdetails)throws DBUpdateException;
	public ClientLeadModel saveClientLead(ClientLeadModel clientLeadModel);
	public List<ClientLeadModel> getClientLeadTicket();

}
