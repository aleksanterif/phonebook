<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>

<head>
	<title>List Employees</title>
	
	<!-- lisätään linkki tyylitiedostoihin -->

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css" />

</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>Phonebook</h2>
		</div>
	</div>
	
	<div id="container">
	
		<div id="content">
		
			
			
		
			<!--  lisätään html table tähän -->
		
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
				
				<!-- loopataan läpi ja tulostetaan työntekijät -->
				<c:forEach var="tempEmployee" items="${employees}">
				
					<!-- luodaan päivitysnappi jokaiselle riville -->
					<c:url var="updateLink" value="/employee/showFormForUpdate">
						<c:param name="employeeId" value="${tempEmployee.id}" />
					</c:url>					

					<!-- luodaan poistonappi jokaiselle riville -->
					<c:url var="deleteLink" value="/employee/delete">
						<c:param name="employeeId" value="${tempEmployee.id}" />
					</c:url>					
					
					<tr>
						<td> ${tempEmployee.firstName} </td>
						<td> ${tempEmployee.lastName} </td>
						<td> ${tempEmployee.email} </td>
						
						<td>
							<!-- näytetään päivitysnappi -->
							<a href="${updateLink}">Update</a>
							|<!-- näytetään poistonappi -->
							<a href="${deleteLink}"
							   onclick="if (!(confirm('Are you sure you want to delete this employee?'))) return false">Delete</a>
						</td>
						
					</tr>
				
				</c:forEach>
						
			</table>
			
			<!-- put new button: Add Employee -->
		
			<input type="button" value="Add Employee"
				   onclick="window.location.href='showFormForAdd'; return false;"
				   class="add-button"
			/>
			
			<input type="button" value="Search Employee"
				   onclick="window.location.href='search'; return false;"
				   class="add-button"
			/>
				
				
		</div>
	
	</div>
	

</body>

</html>









