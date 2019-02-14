package com.crudExample.CRUDExample.daoImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crudExample.CRUDExample.dao.EmployeeDAO;
import com.crudExample.CRUDExample.dto.Employee;
import com.crudExample.CRUDExample.dto.ProgLang;

@Repository("employeeDAO")
public class EmployeeDAOImpl implements EmployeeDAO {
	
	@Autowired
	SessionFactory sessionFactory;

	public boolean addEmployee(Employee employee) {
		try {
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			session.persist(employee);
			session.getTransaction().commit();
			session.close();
			
			return true;
		}
		catch(Exception ex) {
			return false;
		}
	}

	public boolean updateEmployee(Employee employee) {
		try {
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			session.update(employee);
			session.getTransaction().commit();
			session.close();
			
			return true;
		}
		catch(Exception ex) {
			return false;
		}
	}

	public boolean deleteEmployee(Employee employee) {
		try {
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			session.delete(employee);
			session.getTransaction().commit();
			session.close();
			
			return true;
		}
		catch(Exception ex) {
			return false;
		}
	}

	public Employee getSingleEmployee(int employeeId) {
		return sessionFactory.openSession().get(Employee.class, employeeId);
	}

	public List<Employee> getAllEmployees() {
		return sessionFactory.openSession().createQuery("FROM Employee").getResultList();
	}

	public List<String> getAllProgLang() {
		return sessionFactory.openSession().createQuery("SELECT progLang FROM ProgLang").getResultList();
	}

}
