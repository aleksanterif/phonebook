package com.employee.springdemo.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.employee.springdemo.dao.EmployeeDAO;
import com.employee.springdemo.entity.Employee;



@Service
public class EmployeeServiceImpl implements EmployeeService {

	// injektoidaan employeeDao
	@Autowired
	private EmployeeDAO employeeDAO;
	
	@Override
	@Transactional
	public List<Employee> getEmployees() {
		return employeeDAO.getEmployees();
	}

	@Override
	@Transactional
	public void saveEmployee(Employee theEmployee) {

		employeeDAO.saveEmployee(theEmployee);
	}

	@Override
	@Transactional
	public Employee getEmployee(int theId) {
		
		return employeeDAO.getEmployee(theId);
	}

	@Override
	@Transactional
	public void deleteEmployee(int theId) {
		
		employeeDAO.deleteEmployee(theId);
	}
	
	@Override
	@Transactional
	public List <Employee> findByLastName(Employee lastName) {
		
		return employeeDAO.findByLastName("%"+lastName+"%");
	}
	
}





