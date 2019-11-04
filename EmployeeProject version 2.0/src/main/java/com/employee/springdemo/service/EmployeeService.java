package com.employee.springdemo.service;

import java.util.List;


import com.employee.springdemo.entity.Employee;




public interface EmployeeService {

	public List<Employee> getEmployees();

	public void saveEmployee(Employee theEmployee);

	public Employee getEmployee(int theId);

	public void deleteEmployee(int theId);

	public List	<Employee> findByLastName(Employee lastName);
	
}


