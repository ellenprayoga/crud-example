package com.crudExample.CRUDExample.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.crudExample.CRUDExample.dto.Employee;
import com.crudExample.CRUDExample.service.EmployeeService;

public class TestCase {
	private static AnnotationConfigApplicationContext context;
	private static EmployeeService employeeService;
	private Employee employee;
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.crudExample.CRUDExample");
		context.refresh();
		employeeService = context.getBean(EmployeeService.class);
	}
	
	@Test
	public void test() {
		employee = new Employee();
		employee.setName("Ellen Prayoga Pangestu");
		employee.setGender("Male");
		employee.setAddress("Jl. Babakan Ciparay RT04/RW08 Kel. Babakan Ciparay Kec. Babakan Ciparay Bandung Jawa Barat 40223");
		employee.setEmail("ellenprayoga@gmail.com");
		employee.setPhoneNumber("089603003790");
		employee.setSkill("JAVA");
		
		assertEquals("Adding employee successfully", true, employeeService.addEmployee(employee));
	}
}
