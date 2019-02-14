package com.crudExample.CRUDExample.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.crudExample.CRUDExample.dto.Employee;
import com.crudExample.CRUDExample.dto.ProgLang;
import com.crudExample.CRUDExample.service.EmployeeService;

@Controller
public class MainController {

	@Autowired
	private EmployeeService employeeService;

	// Main page handle
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("employee", new Employee());
		mv.addObject("employees", employeeService.getAllEmployees());
		mv.addObject("progLangList", employeeService.getAllProgLang());
		return mv;
	}

	// Update employee
	@RequestMapping(value = "/updateEmployee", method = RequestMethod.POST)
	public String updateEmployee(@ModelAttribute("employee") Employee employee) {
		
		employeeService.updateEmployee(employee);

		return "redirect:/";
	}

	// Delete employee
	@RequestMapping(value = "/deleteEmployee", method = RequestMethod.POST)
	public String deleteEmployee(@RequestParam("employeeId") int employeeId) {
		employeeService.deleteEmployee(employeeService.getSingleEmployee(employeeId));

		return "redirect:/";
	}
	
	// Add employee
	@RequestMapping(value = "/addEmployee", method = RequestMethod.POST)
	public String addEmployee(@ModelAttribute("employee") Employee employee) {
		employeeService.addEmployee(employee);
		
		return "redirect:/";
	}
}
