<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
</head>
<body class="container mt-4">
	<div>
	<h3>Table Student</h3>
		<table class="table table-bordered table-hover mt-4">
			<thead>
				<tr>
					<th>STT</th>
					<th>Tên</th>
					<th>Điểm</th>
					<th>#</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="st" items="${list}" varStatus="i">
					<tr>
						<td>${i.count}</td>
						<td>${st.name}</td>
						<td>${st.mark}</td>
						<c:if test="${st.mark < 5}">
							<td class="text-danger">Trượt</td>
						</c:if>
						<c:if test="${st.mark > 5}">
							<td class="text-success">Đạt</td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>

</html>