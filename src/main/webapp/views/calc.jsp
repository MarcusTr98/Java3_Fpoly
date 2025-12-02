<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calculator</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<form action="CalcServlet" method="post" class="m-3">
			<div class="mb-3">
				<label class="form-label">Number A </label> <input
					type="number" class="form-control" name="a"
					placeholder="Số nguyên A" required>
			</div>

			<div class="mb-3">
				<label class="form-label">Number B </label> <input
					type="number" class="form-control" name="b"
					placeholder="Số nguyên B" required>
			</div>

			<div class="mb-3">
				<button type="submit" class="btn btn-outline-primary center"
					value="+" name="calc">To add</button>
				<button type="submit" class="btn btn-outline-success center"
					value="-" name="calc">To subtract</button>
			</div>

			<div class="mb-3">
				<label class="form-label text-success">Kết quả: ${kq } </label>
			</div>
		</form>


	</div>
</body>
</html>