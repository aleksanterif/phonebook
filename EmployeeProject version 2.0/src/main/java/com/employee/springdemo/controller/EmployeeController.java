package com.employee.springdemo.controller;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.employee.springdemo.entity.Employee;
import com.employee.springdemo.service.EmployeeService;
import com.employee.springdemo.service.EmployeeServiceImpl;



@Controller
@RequestMapping("/employee")
public class EmployeeController {

	// employeeservicen injektointi
	@Autowired
	private EmployeeService employeeService;
	
	@GetMapping("/list")
	public String listEmployees(Model theModel) {
		
		// haetaan työntekijät servicestä
		List<Employee> theEmployees = employeeService.getEmployees();
				
		// lisätään työntekijät modeliin
		theModel.addAttribute("employees", theEmployees);
		
		return "list-employees";
	}
	
	@GetMapping("/showFormForAdd")
	public String showFormForAdd(Model theModel) {
		
		// luodaan modeli, johon voidaan lisätä uutta dataa
		Employee theEmployee = new Employee();
		
		theModel.addAttribute("employee", theEmployee);
		
		return "employee-form";
	}
	
	@PostMapping("/saveEmployee")
	public String saveEmployee(@ModelAttribute("employee") Employee theEmployee) {
		
		// tallennetaan käyttäjä servicen avulla
		employeeService.saveEmployee(theEmployee);	
		
		return "redirect:/employee/list";
	}
	
	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("employeeId") int theId,
									Model theModel) {
		
		// haetaan käyttäjä servicestä idn perusteella
		Employee theEmployee = employeeService.getEmployee(theId);	
		
		// asetetaan työntekijä esitäytetylle lomakkeelle
		theModel.addAttribute("employee", theEmployee);
		
		// lähetetään tämä käyttäjä lomakkeelle	
		return "employee-form";
	}
	
	@GetMapping("/delete")
	public String deleteEmployee(@RequestParam("employeeId") int theId) {
		
		// tehdään tietokantaan pyyntö poistaa käyttäjä idn perusteella
		employeeService.deleteEmployee(theId);
		
		return "redirect:/employee/list";
	}
	
	@GetMapping("/search")
	
	//tehdään pyyntö sukunimen perusteella
	public String findByLastName(Model model, @RequestParam(defaultValue="")  String lastName) {
		
		model.addAttribute("employee", lastName);
		return "search-result";
	}
	
}










