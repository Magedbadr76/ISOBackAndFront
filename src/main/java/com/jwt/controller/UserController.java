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
import com.jwt.model.Employee;
import com.jwt.model.ScheduleAudit;
import com.jwt.model.User;
import com.jwt.model.UserRole;
import com.jwt.service.EmployeeService;
import com.jwt.service.RoleServiceImpl;
import com.jwt.service.ScheduleAuditServiceImpl;
import com.jwt.service.UserRoleServiceImpl;
import com.jwt.service.UserServiceImpl;

@Controller
public class UserController {

	private static final Logger logger = Logger
			.getLogger(UserController.class);

	public UserController() {
		System.out.println("UserController()");
	}

	@Autowired
	private UserServiceImpl userService;
	@Autowired
	private UserRoleServiceImpl roleService;

	@RequestMapping(value = "/newUser", method = RequestMethod.GET)
	public ModelAndView newUser(ModelAndView model) {
	
		User user = new User();
		user.setuSER_ACTIVE("1");
		user.setuSER_ID(0);
		model.addObject("user", user);
		model.setViewName("UserDetails");
		return model;
	}

	@RequestMapping(value = "/saveUser", method = RequestMethod.POST)
	public ModelAndView saveUser(@ModelAttribute User user) {
		System.out.println(user);
		if (user.getuSER_ID() == 0) { // if employee id is 0 then creating the
			Integer tmp=userService.addUser(user);
			UserRole role=new UserRole();
			if(user.getuSER_TYPE().equals("Admin")) {
				role.setRole_id(2);
				role.setRole_name("ROLE_ADMIN");
				role.setUser_name(user.getuSER_NAME());
				role.setUser_id(tmp);
			}
			else {
				role.setRole_id(1);
				role.setRole_name("APP_USER");
				role.setUser_name(user.getuSER_NAME());
				role.setUser_id(tmp);
			}
			roleService.addUserRole(role);
		} else {
			userService.updateUser(user);
			UserRole tmprole=roleService.getAllUserRolesByUser(user.getuSER_ID()).get(0);
			
			if(user.getuSER_TYPE().equals("Admin")) {
				tmprole.setRole_id(2);
				tmprole.setRole_name("ROLE_ADMIN");
				
			}
			else {
				tmprole.setRole_id(1);
				tmprole.setRole_name("APP_USER");
			}
			
		   roleService.updateUserRole(tmprole);
		}
		
		return new ModelAndView("redirect:/allUsers");
	}

	@RequestMapping(value = "/deleteUser", method = RequestMethod.GET)
	public ModelAndView deleteUSer(HttpServletRequest request) {
		int userId = Integer.parseInt(request.getParameter("id"));
		userService.deleteUser(userId);
		return new ModelAndView("redirect:/allUsers");
	}

	@RequestMapping(value = "/editUser", method = RequestMethod.GET)
	public ModelAndView editUser(HttpServletRequest request) {
		int userId = Integer.parseInt(request.getParameter("id"));
		User user = userService.getUser(userId);
		ModelAndView model = new ModelAndView("UserDetails");
		model.addObject("user", user);

		return model;
	}
	@RequestMapping(value = "/allUsers", method = RequestMethod.GET)
	public ModelAndView allUsers(ModelAndView model) throws IOException {
		List<User> listUsers = userService.getAllUsers();
		System.out.println("SIZeeeee : "+listUsers.size());
		model.addObject("listUsers", listUsers);
		// MAGED: create new page for all schedules like home page 
		model.setViewName("UserManager");
		return model;
	}

}