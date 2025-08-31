package com.jwt.controller;

import javax.servlet.http.HttpServletRequest;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jwt.model.Attachment;
import com.jwt.model.Comment;
import com.jwt.service.AttachmentService;
import com.jwt.service.CommentService;

@Controller
public class AttachmentController {
	private static final Logger logger = Logger
			.getLogger(EmployeeController.class);
	@Autowired
	private AttachmentService attachmentService;
	@RequestMapping(value = "/saveAttachment", method = RequestMethod.POST)
	public ModelAndView saveAttachment(@ModelAttribute Attachment attachment,HttpServletRequest request) {
	
			//comment.setTICKET_ID(Integer.parseInt(request.getParameter("id")));
			System.out.println("coooo");
		if (attachment.getID() == 0) { // if employee id is 0 then creating the
			// employee other updating the employee
			attachmentService.addAttachment(attachment);
		
		}
	    String referer = request.getHeader("Referer");
		return new ModelAndView("redirect:"+"editEmployee?id="+attachment.getTICKET_ID());
	}
	@RequestMapping(value = "/deleteAttachment", method = RequestMethod.GET)
	public ModelAndView deleteEmployee(HttpServletRequest request) {
		int AttahmentID = Integer.parseInt(request.getParameter("id"));
		Attachment attachment=attachmentService.getAttachment(AttahmentID);
		attachmentService.deleteAttachment(AttahmentID);
		return new ModelAndView("redirect:"+"editEmployee?id="+attachment.getTICKET_ID());
	}
}
