package com.jwt.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.jboss.logging.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;

import com.jwt.dao.AuditParticipantsDAO;
import com.jwt.model.AuditArea;
import com.jwt.model.AuditCheckpoints;
import com.jwt.model.AuditParticipants;
import com.jwt.model.AuditTransaction;
import com.jwt.model.CheckPointsForm;
import com.jwt.model.Comment;
import com.jwt.model.Employee;
import com.jwt.model.Ncr;
import com.jwt.model.ParticipantsForm;
import com.jwt.model.ScheduleAudit;
import com.jwt.model.Task;
import com.jwt.model.User;
import com.jwt.service.AuditAreaServiceImpl;
import com.jwt.service.AuditCheckPointsServiceImpl;
import com.jwt.service.AuditParticipantsService;
import com.jwt.service.AuditTransServiceImpl;
import com.jwt.service.AuditcheckpointsService;
import com.jwt.service.CommentService;
import com.jwt.service.EmployeeService;
import com.jwt.service.NcrServiceImpl;
import com.jwt.service.ScheduleAuditServiceImpl;
import com.jwt.service.TaskService;
import com.jwt.service.UserServiceImpl;

import org.springframework.stereotype.Service;
@Controller
public class ScheduleAuditController {

	private static final Logger logger = Logger
			.getLogger(EmployeeController.class);

	public ScheduleAuditController() {
		System.out.println("ScheduleAuditController()");
	}


	@Autowired
    private JavaMailSender mailSender;
	@Autowired
	private ScheduleAuditServiceImpl scheduleAuditService;
	@Autowired
	private AuditTransServiceImpl auditTransService;
	
	@Autowired
	private UserServiceImpl userService;
	@Autowired
	private AuditAreaServiceImpl auditAreaService;
	@Autowired
	private NcrServiceImpl ncrServiceImpl;    
	@Autowired
	private AuditcheckpointsService auditCheckPointsServiceImpl;
	@Autowired
	private AuditParticipantsService auditParticipantsService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private CommentService commentService;
	@RequestMapping(value = "/addComment", method = RequestMethod.POST)
	public ModelAndView addComment(@ModelAttribute Comment comment,HttpServletRequest request) {
	
			
		if (comment.getID() == 0) { 
			commentService.addComment(comment);
		}
		return new ModelAndView("redirect:"+"taskDetail?id="+comment.getTICKET_ID());
	}
	@RequestMapping(value = "/InternalAudit")
	public ModelAndView internalAudit(ModelAndView model,HttpServletRequest request) throws IOException {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
        
		List<User> listUsers = userService.getAllUsers();
		List<AuditArea> listAuditAreas = auditAreaService.getAllAuditAreas();
		model.addObject("listUsers",listUsers );
		model.addObject("listAuditAreas",listAuditAreas );	
		int scheduleId = Integer.parseInt(request.getParameter("id"));
		ScheduleAudit schedule = scheduleAuditService.getSchedule(scheduleId);
		CheckPointsForm frm=new CheckPointsForm();
		ParticipantsForm PartForm=new ParticipantsForm();

		if(schedule.getSCHEDULE_STATE().equalsIgnoreCase("SUBMITTED")) {
			AuditTransaction tran= auditTransService.getAuditTransactionBySchedule(scheduleId);
			model.addObject("trans", tran);
		}
		else {
			
			AuditTransaction tran= auditTransService.getAuditTransactionBySchedule(scheduleId);
			if(tran==null) {
		 tran=new AuditTransaction();
		tran.setTrans_process_name("internal Audit");
		tran.setTrans_auditee_id(schedule.getSCHEDULE_AUDITOR_ID());
		tran.setTrans_date(schedule.getSCHEDULE_DATE());
		tran.setTrans_schedule_id(scheduleId);
		tran.setTrans_createdby_id(username);
		tran.setTrans_id(0);
			}
		model.addObject("trans", tran);
		}
		AuditParticipants NewParticipant=new AuditParticipants();
		NewParticipant.setAudit_id(scheduleId);
		
		AuditCheckpoints NewCheck=new AuditCheckpoints();
		NewCheck.setAudit_id(scheduleId);
		
	   List<AuditCheckpoints> checks=auditCheckPointsServiceImpl.getAllAuditCheckPoints(scheduleId);
	   frm.setLstCheckpoints(checks);
	   
	   List<AuditParticipants> Partis=auditParticipantsService.getAllAuditParticipants(scheduleId);
	   PartForm.setLstParticipants(Partis);
	   PartForm.setAudit_id(scheduleId);
	   Ncr nc1=new Ncr();
	   nc1.setNcr_status("NEW");
	   model.addObject("NCR", nc1);
		model.addObject("schedule", schedule);
		model.addObject("checkList",frm);
		model.addObject("NewCheck",NewCheck);
		model.addObject("Partis",PartForm);
		model.addObject("NewPartis",NewParticipant);
//		model.setViewName("AuditPlan");
    	model.setViewName("InternalAudit");
	//	model.setViewName("NCR");
		return model;
	}

	@RequestMapping(value = "/newSchedule", method = RequestMethod.GET)
	public ModelAndView newSchedule(ModelAndView model) {
		
		List<User> listUsers = userService.getAllUsers();
		List<AuditArea> listAuditAreas = auditAreaService.getAllAuditAreas();
		model.addObject("listUsers",listUsers );
		model.addObject("listAuditAreas",listAuditAreas );
		ScheduleAudit schedule = new ScheduleAudit();
		schedule.setSCHEDULE_STATE("NEW");
		model.addObject("schedule", schedule);
		model.setViewName("AuditPlan");
		return model;
	}

	@RequestMapping(value = "/saveScheduleTrans", method = RequestMethod.POST)
	public ModelAndView saveScheduleTrans(@ModelAttribute AuditTransaction Audtrans) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		
		System.out.println("Operation is "+ Audtrans.getOperation());
		if(Audtrans.getTrans_id() == 0 &&Audtrans.getOperation().equalsIgnoreCase("Save")) {
			Audtrans.setTrans_audit_status("NEW");
			auditTransService.addAuditTransaction(Audtrans);
		}
		if(Audtrans.getTrans_id() == 0 &&Audtrans.getOperation().equalsIgnoreCase("SUBMIT")) {
			Audtrans.setTrans_audit_status("SUBMITTED");
	           auditTransService.addAuditTransaction(Audtrans);
	           
	           int scheduleId = Audtrans.getTrans_schedule_id();
	   		ScheduleAudit schedule = scheduleAuditService.getSchedule(scheduleId);
	   	    schedule.setSCHEDULE_STATE("SUBMITTED");
	   		scheduleAuditService.updateSchedule(schedule);
		}
		if(Audtrans.getTrans_id() > 0 &&Audtrans.getOperation().equalsIgnoreCase("Save")) {
			Audtrans.setTrans_audit_status("NEW");
			auditTransService.updateAuditTransaction(Audtrans);
		}
		if(Audtrans.getTrans_id() > 0 &&Audtrans.getOperation().equalsIgnoreCase("SUBMIT")) {
			Audtrans.setTrans_audit_status("SUBMITTED");
			auditTransService.updateAuditTransaction(Audtrans);
	           
	           int scheduleId = Audtrans.getTrans_schedule_id();
	   		ScheduleAudit schedule = scheduleAuditService.getSchedule(scheduleId);
	   	    schedule.setSCHEDULE_STATE("SUBMITTED");
	   		scheduleAuditService.updateSchedule(schedule);
		}
				
		return new ModelAndView("redirect:/allAcceptedSchedules");
	}

	
	@RequestMapping(value = "/SaveTask", method = RequestMethod.POST)
	public ModelAndView SaveTask(@ModelAttribute Task tsk) {
		System.out.print("save Task");
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		tsk.setTask_status("New");
		tsk.setCreated_by(username);
         taskService.addTask(tsk);
		
		return new ModelAndView("redirect:/ObjectiveManagerPlanning");
	}

	
	@RequestMapping(value = "/NCR")
	public ModelAndView listEmployee(ModelAndView model) throws IOException {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		List<User> listUsers = userService.getAllUsers();
		List<AuditArea> listAuditAreas = auditAreaService.getAllAuditAreas();
		model.addObject("listUsers",listUsers );
		model.addObject("listAuditAreas",listAuditAreas );
		Ncr ncr = new Ncr();
		ncr.setNcr_status("NEW");
		ncr.setNcr_initiator(username);
		model.addObject("schedule", ncr);
			model.setViewName("NCR");
		return model;
	}
	@RequestMapping(value = "/EditNCR")
	public ModelAndView EditNcr(ModelAndView model,HttpServletRequest request) throws IOException {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		List<User> listUsers = userService.getAllUsers();
		List<AuditArea> listAuditAreas = auditAreaService.getAllAuditAreas();
		model.addObject("listUsers",listUsers );
		model.addObject("listAuditAreas",listAuditAreas );
		int ncrId = Integer.parseInt(request.getParameter("id"));
		Ncr ncr = ncrServiceImpl.getNcr(ncrId);
		model.addObject("schedule", ncr);
			model.setViewName("NCR");
		return model;
	}
	
	@RequestMapping(value = "/saveSchedule", method = RequestMethod.POST)
	public ModelAndView saveSchedule(@ModelAttribute ScheduleAudit schedule) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();

		if (schedule.getSCHEDULE_ID() == 0) { // if employee id is 0 then creating the
            schedule.setSCHEDULE_STATE("NEW");
            schedule.setSCHEDULE_ADMIN_ID(authentication.getName());
			scheduleAuditService.addSchedule(schedule);
		} else {
            schedule.setSCHEDULE_STATE("NEW");
            schedule.setSCHEDULE_ADMIN_ID(authentication.getName());
			scheduleAuditService.updateSchedule(schedule);
		}
				

		// SimpleMailMessage message = new SimpleMailMessage();
		 try {
			 System.out.println("before Send HTML  Email ");
				MimeMessage mimeMessage = mailSender.createMimeMessage();
				
				 System.out.println(((org.springframework.mail.javamail.JavaMailSenderImpl)mailSender).getUsername());
				 System.out.println(((org.springframework.mail.javamail.JavaMailSenderImpl)mailSender).getPassword());

				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage,true, "utf-8");
			helper.setTo(new String[]{"m.ibrahim@mts-mea.com","memam.quality@gmail.com"});
			helper.setSubject("New Audit Has Been Created");
			 helper.setText("Dear All , kindly inform you that the  admin <b>"+username+"</b> arranged an audit at <b>"+schedule.getSCHEDULE_DATE()+"</b>  </br> "
		        		+"Auditor : <b>"+schedule.getSCHEDULE_AUDITOR_ID()+"</b>"+
		        		"</br>"+"Auditee : <b>"+schedule.getSCHEDULE_AUDITEE_ID()+"</br>"+
		        		"Audit Area : <b>"+schedule.getSCHEDULE_AUDITAREA()+"</br>",true);
		        mailSender.send(mimeMessage);
		        System.out.println("after Send HTML  Email ");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
	        

		return new ModelAndView("redirect:/allSchedules");
	}

	
	@RequestMapping(value = "/saveCheck", method = RequestMethod.POST)
	public ModelAndView saveCheck(@ModelAttribute AuditCheckpoints checkPoint) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
        auditCheckPointsServiceImpl.addCheckPoint(checkPoint);
		

		return new ModelAndView("redirect:/InternalAudit?"+"id="+checkPoint.getAudit_id());
	}
	
	@RequestMapping(value = "/saveParticipant", method = RequestMethod.POST)
	public ModelAndView SaveParti(@ModelAttribute AuditParticipants auditParticipants) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
        auditParticipantsService.addParticipants(auditParticipants);
		

		return new ModelAndView("redirect:/InternalAudit?"+"id="+auditParticipants.getAudit_id());
	}
	
	@RequestMapping(value = "/saveallChecks", method = RequestMethod.POST)
	public ModelAndView saveallChecks(@ModelAttribute CheckPointsForm checkPoint) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		Integer audit=0;
       for(int i=0;i<checkPoint.getLstCheckpoints().size();i++) {
    	  // System.out.println("Check Points is " + checkPoint.getLstCheckpoints().get(i).getRESULT());
    	   auditCheckPointsServiceImpl.addCheckPoint(checkPoint.getLstCheckpoints().get(i)); 
    	   audit=checkPoint.getLstCheckpoints().get(i).getAudit_id();
       }
		

		return new ModelAndView("redirect:/InternalAudit?"+"id="+audit);
	}
	
	
	@RequestMapping(value = "/saveNCR", method = RequestMethod.POST)
	public ModelAndView saveNCR(@ModelAttribute Ncr schedule) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
         System.out.println("Op is" +schedule.getOperation());
		if (schedule.getID()==null|| schedule.getID() == 0) { // if employee id is 0 then creating the
			schedule.setNcr_status("Under Investigation");
			 ncrServiceImpl.addNcr(schedule);
			//scheduleAuditService.addSchedule(ncr);
		} else  {
                if(schedule.getOperation().equalsIgnoreCase("SAVE")) {
                	ncrServiceImpl.addNcr(schedule);
                }
                else if(schedule.getOperation().equalsIgnoreCase("SOLVED")) {
                	schedule.setNcr_status("Under Revision");
                	ncrServiceImpl.addNcr(schedule);
                }
                else if(schedule.getOperation().equalsIgnoreCase("Return To Auditee")) {
                	schedule.setNcr_status("Under Investigation");
                	ncrServiceImpl.addNcr(schedule);
                }
                else {
                	schedule.setNcr_status("CLOSED");
                    	ncrServiceImpl.addNcr(schedule);
                    
                }
			//scheduleAuditService.updateSchedule(ncr);
		}
	
	        

		return new ModelAndView("redirect:/allNCRS");
	}

	
	@RequestMapping(value = "/saveNCRSchedule", method = RequestMethod.POST)
	public ModelAndView saveNCR2(@ModelAttribute Ncr schedule) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
         System.out.println("Op is" +schedule.getOperation());
		if (schedule.getID()==null|| schedule.getID() == 0) { // if employee id is 0 then creating the
			schedule.setNcr_status("Under Investigation");
			 ncrServiceImpl.addNcr(schedule);
			//scheduleAuditService.addSchedule(ncr);
		} else  {
                if(schedule.getOperation().equalsIgnoreCase("SAVE")) {
                	ncrServiceImpl.addNcr(schedule);
                }
                else if(schedule.getOperation().equalsIgnoreCase("SOLVED")) {
                	schedule.setNcr_status("Under Revision");
                	ncrServiceImpl.addNcr(schedule);
                }
                else {
                	schedule.setNcr_status("CLOSED");
                    	ncrServiceImpl.addNcr(schedule);
                    
                }
			//scheduleAuditService.updateSchedule(ncr);
		}
	
	       

		return new ModelAndView("redirect:/InternalAudit?id="+ schedule.getNcr_schedule_id());
	}

	
	@RequestMapping(value = "/deleteSchedule", method = RequestMethod.GET)
	public ModelAndView deleteSchedule(HttpServletRequest request) {
		int scheduleId = Integer.parseInt(request.getParameter("id"));
		scheduleAuditService.deleteSchedule(scheduleId);
		return new ModelAndView("redirect:/allSchedules");
	}

	@RequestMapping(value = "/editSchedule", method = RequestMethod.GET)
	public ModelAndView editSchedule(HttpServletRequest request) {
		int scheduleId = Integer.parseInt(request.getParameter("id"));
		ScheduleAudit schedule = scheduleAuditService.getSchedule(scheduleId);
	    System.out.println(schedule.getSCHEDULE_STATE());
		ModelAndView model = new ModelAndView("AuditPlan");
		model.addObject("schedule", schedule);
		List<User> listUsers = userService.getAllUsers();
		List<AuditArea> listAuditAreas = auditAreaService.getAllAuditAreas();
		model.addObject("listUsers",listUsers );
		model.addObject("listAuditAreas",listAuditAreas );
		System.out.println("After Add ListUsers");
		return model;
	}
	@RequestMapping(value = "/AcceptAuditor", method = RequestMethod.GET)
	public ModelAndView AcceptScheduleAuditor(HttpServletRequest request) {
		int scheduleId = Integer.parseInt(request.getParameter("id"));
		ScheduleAudit schedule = scheduleAuditService.getSchedule(scheduleId);
	    schedule.setSCHEDULE_STATE("AUDITOR_ACCEPTED");
		scheduleAuditService.updateSchedule(schedule);
		return new ModelAndView("redirect:/allSchedules");
		
	}
	@RequestMapping(value = "/RejectAuditor", method = RequestMethod.GET)
	public ModelAndView RejectScheduleAuditor(HttpServletRequest request) {
		int scheduleId = Integer.parseInt(request.getParameter("id"));
		String rejectionReason =request.getParameter("reject_reason");
		ScheduleAudit schedule = scheduleAuditService.getSchedule(scheduleId);
	    schedule.setSCHEDULE_STATE("AUDITOR_REJECT");
	    schedule.setAUDITOR_REJECT_REASON(rejectionReason);
		scheduleAuditService.updateSchedule(schedule);
		return new ModelAndView("redirect:/allSchedules");
	}
	
	@RequestMapping(value = "/AcceptAuditee", method = RequestMethod.GET)
	public ModelAndView AcceptScheduleAuditee(HttpServletRequest request) {
		int scheduleId = Integer.parseInt(request.getParameter("id"));
		ScheduleAudit schedule = scheduleAuditService.getSchedule(scheduleId);
	    schedule.setSCHEDULE_STATE("ACCEPTED");
		scheduleAuditService.updateSchedule(schedule);
		return new ModelAndView("redirect:/allSchedules");
	}
	@RequestMapping(value = "/RejectAuditee", method = RequestMethod.GET)
	public ModelAndView RejectScheduleAuditee(HttpServletRequest request) {
		int scheduleId = Integer.parseInt(request.getParameter("id"));
		String rejectionReason =request.getParameter("reject_reason");

		ScheduleAudit schedule = scheduleAuditService.getSchedule(scheduleId);
	    schedule.setSCHEDULE_STATE("AUDITEE_REJECTED");
	    schedule.setAUDITEE_REJECT_REASON(rejectionReason);

		scheduleAuditService.updateSchedule(schedule);
		return new ModelAndView("redirect:/allSchedules");
	}
	
	@RequestMapping(value = "/allSchedules", method = RequestMethod.GET)
	public ModelAndView allSchedules(ModelAndView model,SecurityContextHolderAwareRequestWrapper requestWrapper) throws IOException {
		List<ScheduleAudit> listSchedules=null;
		if(requestWrapper.isUserInRole("ROLE_ADMIN")) {
		 listSchedules = scheduleAuditService.getAllSchedules();
		}
		else {
			 listSchedules = scheduleAuditService.getAllCurrentUser(requestWrapper.getUserPrincipal().getName());

		}
        System.out.println("New One");
		model.addObject("listSchedules", listSchedules);
		// MAGED: create new page for all schedules like home page 
		model.setViewName("allSchedules");
		return model;
	}

	@RequestMapping(value = "/allSchedulesCal", method = RequestMethod.GET)
	public ModelAndView allSchedulesCal(ModelAndView model,SecurityContextHolderAwareRequestWrapper requestWrapper) throws IOException {
		List<ScheduleAudit> listSchedules=null;
		if(requestWrapper.isUserInRole("ROLE_ADMIN")) {
		 listSchedules = scheduleAuditService.getAllSchedules();
		}
		else {
			 listSchedules = scheduleAuditService.getAllCurrentUser(requestWrapper.getUserPrincipal().getName());

		}
       JSONArray js=new JSONArray();
       for(int i=0;i<listSchedules.size();i++) {
       JSONObject tmp=new JSONObject();
       try {
		tmp.put("date", listSchedules.get(i).getSCHEDULE_DATE());
		tmp.put("eventName", "Internal Audit For "+listSchedules.get(i).getSCHEDULE_AUDITAREA_NAME()+" Department");
		String ClassName="badge bg-success";
		String Badge="green";

		if(listSchedules.get(i).getSCHEDULE_DATE().before(new Date())&&!listSchedules.get(i).getSCHEDULE_STATE().equalsIgnoreCase("SUBMITTED")) {
			 ClassName="badge bg-danger";
			 Badge="red";
		}
		tmp.put("className", ClassName);
		tmp.put("dateColor", Badge);
		JSONObject tmp2=new JSONObject();
		tmp2.put("id", listSchedules.get(i).getSCHEDULE_ID());
		tmp2.put("status", listSchedules.get(i).getSCHEDULE_STATE());
		tmp.put("data", tmp2);
		 js.put(tmp);

	} catch (JSONException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
       }
       
		
		model.addObject("listSchedules", listSchedules);
		model.addObject("listSchedulesJSON", js);
       
       
       model.setViewName("Calendar");
		return model;
	}

	
	@RequestMapping(value = "/allAcceptedSchedules", method = RequestMethod.GET)
	public ModelAndView allAcceptedSchedules(ModelAndView model,SecurityContextHolderAwareRequestWrapper requestWrapper) throws IOException {
		List<ScheduleAudit> listSchedules=null;
		if(requestWrapper.isUserInRole("ROLE_ADMIN")) {
		 listSchedules = scheduleAuditService.getAllAcceptedSchedules();
		}
		else {
			 listSchedules = scheduleAuditService.getAllCurrentUser(requestWrapper.getUserPrincipal().getName());

		}
        System.out.println("New One");
        
		model.addObject("listSchedules", listSchedules);
		// MAGED: create new page for all schedules like home page 
		model.setViewName("allAcceptedSchedules");
		return model;
	}

	@RequestMapping(value = "/ObjectiveManagerPlanning", method = RequestMethod.GET)
	public ModelAndView ObjectiveManagerPlanning(ModelAndView model,SecurityContextHolderAwareRequestWrapper requestWrapper) throws IOException {
		List<Task> listTask=null;
		if(requestWrapper.isUserInRole("ROLE_ADMIN")) {
			listTask = taskService.getAllTask(requestWrapper.getUserPrincipal().getName());
		}
	    else {
			listTask = taskService.getAllTask(requestWrapper.getUserPrincipal().getName());

		}
		model.addObject("listTask", listTask);
	     
		model.setViewName("TaskManager");
		return model;
	}

	@RequestMapping(value = "/taskDetail", method = RequestMethod.GET)
	public ModelAndView editTask(HttpServletRequest request) {
		Integer taskId = Integer.parseInt(request.getParameter("id"));
		List<Comment> lstcomm=commentService.getAllCommentByTask(taskId);
		System.out.println(taskId);
		Task task = taskService.getTask(taskId);
		ModelAndView model = new ModelAndView("TaskDetails");
		
		model.addObject("Task", task);
		System.out.println("pir "+task.getTask_piriority());
		List<User> listUsers = userService.getAllUsers();
		model.addObject("listUsers",listUsers);
		model.addObject("lstcomments",lstcomm);
		Comment c=new Comment();
		c.setTICKET_ID(taskId);
		c.setCommented_by(request.getUserPrincipal().getName());
		model.addObject("NewComment",c);
		return model;
	}

	
	@RequestMapping(value = "/NewTask", method = RequestMethod.GET)
	public ModelAndView NewTask(HttpServletRequest request) {
		Task ts=new Task();
		ModelAndView model = new ModelAndView("TaskDetails");
		List<User> listUsers = userService.getAllUsers();
		List<Comment>lstcomm=new ArrayList<Comment>();
		model.addObject("lstcomments",lstcomm);
		
		model.addObject("Task", ts);
		model.addObject("listUsers",listUsers);
		Comment c=new Comment();
		c.setCommented_by(request.getUserPrincipal().getName());
		model.addObject("NewComment",c);
		
		return model;
	}
	
	@RequestMapping(value = "/allNCRS", method = RequestMethod.GET)
	public ModelAndView allNCRS(ModelAndView model,SecurityContextHolderAwareRequestWrapper requestWrapper) throws IOException {
		List<Ncr> listNCR=null;
		//if(requestWrapper.isUserInRole("ROLE_ADMIN")) {
		listNCR = ncrServiceImpl.getAllNcrs();
		//}
	//	else {
		//	 listSchedules = scheduleAuditService.getAllCurrentUser(requestWrapper.getUserPrincipal().getName());

		//}
        System.out.println("New One");
        
		model.addObject("listNCR", listNCR);
		// MAGED: create new page for all schedules like home page 
		model.setViewName("allNCRS");
		return model;
	}

	
}