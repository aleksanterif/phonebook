<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>
	<title>Save Employee</title>
<!-- lisätään linkki tyylitiedostoihin -->
	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css">

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/add-employee-style.css">
</head>

<body>
	
	<div id="wrapper">
		<div id="header">
			<h2>Phonebook</h2>
		</div>
	</div>

	<div id="container">
		<h3>Save Employee</h3>
	
	<!-- määritetään formi actionin pääte -->
		<form:form action="saveEmployee" modelAttribute="employee" method="POST">

			<!-- liitetään kyseinen data employee id:hen -->
			<form:hidden path="id" />
					
			<table>
				<tbody>
					<tr>
						<td><label>First name:</label></td>
						<td><form:input path="firstName" /></td>
					</tr>
				
					<tr>
						<td><label>Last name:</label></td>
						<td><form:input path="lastName" /></td>
					</tr>

					<tr>
						<td><label>Email:</label></td>
						<td><form:input path="email" /></td>
					</tr>

					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Save" class="save" /></td>
					</tr>

				
				</tbody>
			</table>
		
		
		</form:form>
	
		<div style="clear; both;"></div>
		
		<p>
			<!-- luodaan polku takaisin listaan -->
			<a href="${pageContext.request.contextPath}/employee/list">Back to List</a>
		</p>
	
	</div>

</body>

</html>










