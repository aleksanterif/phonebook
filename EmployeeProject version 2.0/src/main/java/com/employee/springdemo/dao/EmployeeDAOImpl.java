package com.employee.springdemo.dao;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.employee.springdemo.entity.Employee;



@Repository
public class EmployeeDAOImpl implements EmployeeDAO {

	// injektoidaan nykyinen session factory
	@Autowired
	private SessionFactory sessionFactory;
			
	@Override
	public List<Employee> getEmployees() {
		
		// haetaan nykyinen hibernate sessio
		Session currentSession = sessionFactory.getCurrentSession();
				
		// luoodaan query jonka avulla sortataan lista sukunimen perusteella
		Query<Employee> theQuery = 
				currentSession.createQuery("from Employee order by lastName",
											Employee.class);
		
		// suoritetaan query ja palautetaan tulokset = lista työntekijöistä
		List<Employee> employees = theQuery.getResultList();
				
		// return the results		
		return employees;
	}

	@Override
	public void saveEmployee(Employee theEmployee) {

		// haetaan nykyinen hibernate sessio
		Session currentSession = sessionFactory.getCurrentSession();
		
		// tallennetaan tai päivitetään työntekijän tiedot
		currentSession.saveOrUpdate(theEmployee);
		
	}

	@Override
	public Employee getEmployee(int theId) {

		// haetaan nykyinen hibernate sessio
		Session currentSession = sessionFactory.getCurrentSession();
		
		// haetaan työntekijä tietokannasta käyttäen hänen pääavainta
		Employee theEmployee = currentSession.get(Employee.class, theId);
		
		return theEmployee;
	}

	@Override
	public void deleteEmployee(int theId) {

		// haetaan nykyinen hibernate sessio
		Session currentSession = sessionFactory.getCurrentSession();
		
		// poistetaan objecti pääavaimen mukaan
		Query theQuery = 
				currentSession.createQuery("delete from Employee where id=:employeeId");
		theQuery.setParameter("employeeId", theId);
		
		theQuery.executeUpdate();		
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List <Employee> findByLastName(String lastName) {
		
		// haetaan nykyinen hibernate sessio
				Session currentSession = sessionFactory.getCurrentSession();
						
				// luodaan query jonka pitäisi hakea sukunimen perusteella
				Query theQuery = 
						currentSession.createQuery("from Employee where lastName=:lastName");
				
				theQuery.setParameter("lastName", lastName);
				  return (List <Employee>) theQuery.list().get(0);
			}

}











