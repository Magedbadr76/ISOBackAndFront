package com.jwt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.EmployeeDAO;
import com.jwt.dao.RoleDAOImp;
import com.jwt.dao.ScheduleAuditDAOImp;
import com.jwt.dao.UserDAOImp;
import com.jwt.model.Employee;
import com.jwt.model.Role;
import com.jwt.model.ScheduleAudit;
import com.jwt.model.User;

@Service
@Transactional
public class RoleServiceImpl {

	@Autowired
	private RoleDAOImp roleDAO;


	@Transactional
	public void addRole(Role role) {
		roleDAO.addRole(role);
	}

	
	@Transactional
	public List<Role> getAllRoles() {
		return roleDAO.getAllRoles();
	}

	
	@Transactional
	public void deleteRole(Integer roleId) {
		roleDAO.deleteRole(roleId);
	}

	public Role getRole(int roleId) {
		return roleDAO.getRole(roleId);
	}

	public Role updateRole(Role role) {
		// TODO Auto-generated method stub
		return roleDAO.updateRole(role);
	}


	public RoleDAOImp getRoleDAO() {
		return roleDAO;
	}


	public void setRoleDAO(RoleDAOImp roleDAO) {
		this.roleDAO = roleDAO;
	}


}
