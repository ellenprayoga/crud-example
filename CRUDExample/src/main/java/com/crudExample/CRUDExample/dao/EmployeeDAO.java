package com.crudExample.CRUDExample.dao;

import java.util.List;

import com.crudExample.CRUDExample.dto.Employee;
import com.crudExample.CRUDExample.dto.ProgLang;

public interface EmployeeDAO {
	// Add new employee
	public boolean addEmployee(Employee employee);
	
	// Update employee
	public boolean updateEmployee(Employee employee);
	
	// Delete employee
	public boolean deleteEmployee(Employee employee);
	
	// Get single employee
	public Employee getSingleEmployee(int employeeId);
	
	// Get all employee
	public List<Employee> getAllEmployees();
	
	// Get all programing language
	public List<String> getAllProgLang();
}
