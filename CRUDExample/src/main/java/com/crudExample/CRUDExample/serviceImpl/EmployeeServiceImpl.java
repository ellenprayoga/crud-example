package com.crudExample.CRUDExample.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crudExample.CRUDExample.dao.EmployeeDAO;
import com.crudExample.CRUDExample.dto.Employee;
import com.crudExample.CRUDExample.dto.ProgLang;
import com.crudExample.CRUDExample.service.EmployeeService;

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeDAO employeeDAO;

	public boolean addEmployee(Employee employee) {
		return employeeDAO.addEmployee(employee);
	}

	public boolean updateEmployee(Employee employee) {
		return employeeDAO.updateEmployee(employee);
	}

	public boolean deleteEmployee(Employee employee) {
		return employeeDAO.deleteEmployee(employee);
	}

	public Employee getSingleEmployee(int employeeId) {
		return employeeDAO.getSingleEmployee(employeeId);
	}

	public List<Employee> getAllEmployees() {
		return employeeDAO.getAllEmployees();
	}

	public List<String> getAllProgLang() {
		return employeeDAO.getAllProgLang();
	}

}
