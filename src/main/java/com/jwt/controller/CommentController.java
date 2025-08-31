package com.jwt.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jwt.model.Comment;
import com.jwt.model.Employee;
import com.jwt.service.CommentService;
import com.jwt.service.EmployeeService;

@Controller
public class CommentController {
	
	private static final Logger logger = Logger
			.getLogger(EmployeeController.class);
	@Autowired
	private CommentService commentService;

	@RequestMapping(value = "/newComment", method = RequestMethod.GET)
	public ModelAndView newContact(ModelAndView model,HttpServletRequest request) {
		Comment comment = new Comment();
		int commentID = Integer.parseInt(request.getParameter("id"));
        comment.setTICKET_ID(commentID);
		model.addObject("comment", comment);
		model.setViewName("CommentForm");
		System.out.println("vvv");
		return model;
	}
	
	@RequestMapping(value = "/saveComment", method = RequestMethod.POST)
	public ModelAndView saveEmployee(@ModelAttribute Comment comment,HttpServletRequest request) {
	
			//comment.setTICKET_ID(Integer.parseInt(request.getParameter("id")));
			System.out.println("coooo");
		if (comment.getID() == 0) { // if employee id is 0 then creating the
			// employee other updating the employee
			commentService.addComment(comment);
		
		}
	    String referer = request.getHeader("Referer");
		return new ModelAndView("redirect:"+"editEmployee?id="+comment.getTICKET_ID());
	}
	@RequestMapping(value = "/deleteComment", method = RequestMethod.GET)
	public ModelAndView deleteEmployee(HttpServletRequest request) {
		int commentID = Integer.parseInt(request.getParameter("id"));
		Comment comment=commentService.getComment(commentID);
		commentService.deleteComment(commentID);
		return new ModelAndView("redirect:"+"editEmployee?id="+comment.getTICKET_ID());
	}


}
