<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>

<head>
	<title>Search employees</title>
	
	<!-- reference our style sheet -->

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
		
	
			
			<!-- Etsitään käyttäjä -->
			
			<form action="/search" class="form-inline">
			
			<div>
			<input type="text" class="form-control" name="lastName" placeholder= "search employee">
			<input type ="button" value="Search employee" >
			</div>
			
			
			</form>
		
			<!--  add our html table here -->
		
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
				
				
				<!-- loop over and print our employees -->
				<c:forEach var="tempEmployee" items="${employees}">
				
					<!-- construct an "update" link with employee id -->
					<c:url var="updateLink" value="/employee/showFormForUpdate">
						<c:param name="employeeId" value="${tempEmployee.id}" />
					</c:url>					

					<!-- construct an "delete" link with employee id -->
					<c:url var="deleteLink" value="/employee/delete">
						<c:param name="employeeId" value="${tempEmployee.id}" />
					</c:url>					
					
					<tr>
						<td> ${tempEmployee.firstName} </td>
						<td> ${tempEmployee.lastName} </td>
						<td> ${tempEmployee.email} </td>
						
						<td>
							<!-- display the update link -->
							<a href="${updateLink}">Update</a>
							|
							<a href="${deleteLink}"
							   onclick="if (!(confirm('Are you sure you want to delete this employee?'))) return false">Delete</a>
						</td>
						
					</tr>
				
				</c:forEach>
						
			</table>
				
				<!-- put new button: Add Employee -->
		
			
			<a href="${pageContext.request.contextPath}/employee/list">Back to List</a>
		</div>
	
	</div>
	

</body>

</html>









