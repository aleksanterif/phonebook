package com.employee.springdemo.dao;

import java.util.List;

import com.employee.springdemo.entity.Employee;



public interface EmployeeDAO {

	public List<Employee> getEmployees();

	public void saveEmployee(Employee theEmployee);

	public Employee getEmployee(int theId);

	public void deleteEmployee(int theId);
	
	public List <Employee> findByLastName(String lastName);
	
	
}
