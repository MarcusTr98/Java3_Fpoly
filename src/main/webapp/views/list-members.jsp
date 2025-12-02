<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Members</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
</head>

<body class="container mt-4">
	<h3>List Members</h3>
	<a class="btn btn-outline-success" href="signup">Quay lại Sign up!</a>
	<table class="table table-bordered table-hover mt-4">
		<thead>
			<tr>
				<th>STT</th>
				<th>ID</th>
				<th>Full name</th>
				<th>Email</th>
				<th>Age</th>
				<th>Gender</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="mb" items="${list}" varStatus="i">
				<tr>
					<td>${i.count}</td>
					<td>${mb.id}</td>
					<td>${mb.fullName}</td>
					<td>${mb.email}</td>
					<td>${mb.age}</td>
					<td>${mb.gender ? 'Male' : 'Female'}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
