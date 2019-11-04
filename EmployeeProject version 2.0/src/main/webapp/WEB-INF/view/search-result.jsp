<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>

<head>
	<title>Search employees</title>
	


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
		
	
			
			
			<form action="/search" class="form-inline">
			
			<div>
			<input type="text" class="form-control" name="lastName" placeholder= "search employee">
			<input type ="button" value="Search employee" >
			</div>
			
			
			</form>
		
		
		
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
				
				
				
				<c:forEach var="tempEmployee" items="${employees}">
				
				
					<c:url var="updateLink" value="/employee/showFormForUpdate">
						<c:param name="employeeId" value="${tempEmployee.id}" />
					</c:url>					

					
					<c:url var="deleteLink" value="/employee/delete">
						<c:param name="employeeId" value="${tempEmployee.id}" />
					</c:url>					
					
					<tr>
						<td> ${tempEmployee.firstName} </td>
						<td> ${tempEmployee.lastName} </td>
						<td> ${tempEmployee.email} </td>
						
						<td>
						
							<a href="${updateLink}">Update</a>
							|
							<a href="${deleteLink}"
							   onclick="if (!(confirm('Are you sure you want to delete this employee?'))) return false">Delete</a>
						</td>
						
					</tr>
				
				</c:forEach>
						
			</table>
				
				
		
			
			<a href="${pageContext.request.contextPath}/employee/list">Back to List</a>
		</div>
	
	</div>
	

</body>

</html>









