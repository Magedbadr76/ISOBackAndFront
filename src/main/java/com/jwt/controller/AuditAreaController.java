package com.jwt.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jwt.model.AuditArea;
import com.jwt.model.Employee;
import com.jwt.model.ScheduleAudit;
import com.jwt.model.User;
import com.jwt.service.AuditAreaServiceImpl;
import com.jwt.service.EmployeeService;
import com.jwt.service.ScheduleAuditServiceImpl;
import com.jwt.service.UserServiceImpl;

@Controller
public class AuditAreaController {

	private static final Logger logger = Logger
			.getLogger(UserController.class);

	public AuditAreaController() {
		System.out.println("AuditAreaController()");
	}

	@Autowired
	private AuditAreaServiceImpl auditAreaService;

	@RequestMapping(value = "/newAuditArea", method = RequestMethod.GET)
	public ModelAndView newAuditArea(ModelAndView model) {
		// get all users by model and it's Dao , then model.add object w a7oot el all users ,,
		// ta2dar t add aktr mn object 3la nafs elmodel
		AuditArea auditArea = new AuditArea();
		model.addObject("auditArea", auditArea);
		model.setViewName("AuditPlan");
		return model;
	}

	@RequestMapping(value = "/saveAuditArea", method = RequestMethod.POST)
	public ModelAndView saveAuditArea(@ModelAttribute AuditArea auditArea) {
		if (auditArea.getAudit_area_id() == 0) { // if employee id is 0 then creating the
			// employee other updating the employee
			auditAreaService.addAuditArea(auditArea);
		} else {
			auditAreaService.updateAuditArea(auditArea);
		}
		return new ModelAndView("redirect:/allSchedules");
	}

	@RequestMapping(value = "/deleteAuditArea", method = RequestMethod.GET)
	public ModelAndView deleteAuditArea(HttpServletRequest request) {
		int auditAreaId = Integer.parseInt(request.getParameter("id"));
		auditAreaService.deleteAuditArea(auditAreaId);
		return new ModelAndView("redirect:/allSchedules");
	}

	@RequestMapping(value = "/editAuditArea", method = RequestMethod.GET)
	public ModelAndView editAuditArea(HttpServletRequest request) {
		int auditAreaId = Integer.parseInt(request.getParameter("id"));
		AuditArea auditArea = auditAreaService.getAuditArea(auditAreaId);
		ModelAndView model = new ModelAndView("AuditPlan");
		model.addObject("auditArea", auditArea);

		return model;
	}
	@RequestMapping(value = "/allAuditAreas", method = RequestMethod.GET)
	public ModelAndView allAuditAreas(ModelAndView model) throws IOException {
		List<AuditArea> listAuditAreas = auditAreaService.getAllAuditAreas();
		System.out.println("SIZeeeee : "+listAuditAreas.size());
		model.addObject("listAuditAreas", listAuditAreas);
		// MAGED: create new page for all schedules like home page 
		model.setViewName("allSchedules");
		return model;
	}

}