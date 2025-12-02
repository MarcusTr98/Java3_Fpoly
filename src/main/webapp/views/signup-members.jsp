<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up Member</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
</head>
<body>
	<div class="container py-5 mb-3">

		<div class="row g-0 mb-3">
			<div class="col-12 text-center pt-3">
				<h1 class="text-success">FORM SIGN UP</h1>
				<i class="text-danger">${message }</i>
			</div>
		</div>

		<div class="card mx-auto shadow" style="max-width: 1240px;">
			<div class="row g-0 mb-3">
				<c:url value="/img/signup.jpg" var="img" />
				<div class="col-md-4 d-flex align-items-center">
					<img src="${img }" class="img-fluid rounded-start m-3" alt="signup">
				</div>

				<div class="col-8">
					<form action="list-members" method="post" class="m-3">
						<div class="mb-3 ">
							<label for="id" class="form-label text-primary">ID</label> <input
								type="number" class="form-control" id="id" name="id"
								placeholder="ID tự động" disabled>
						</div>
						<div class="mb-3">
							<label for="fullName" class="form-label text-primary">Full
								Name</label> <input type="text" class="form-control" id="fullName"
								name="fullName" placeholder="Nhập đủ họ tên" required>
						</div>
						<div class="mb-3">
							<label for="email" class="form-label text-primary">Email</label>
							<input type="email" class="form-control" id="email" name="email"
								placeholder="name@example.com" required>
						</div>
						<div class="mb-3">
							<label for="age" class="form-label text-primary">Age</label> <input
								type="number" class="form-control" id="age" name="age"
								placeholder="Nhập số tuổi" required>
						</div>

						<div class="mb-3 d-flex align-items-center">
							<div class="text-primary me-3">Gender</div>
							<div class="form-check me-3">
								<input class="form-check-input" type="radio" name="gender"
									value="true" id="male" checked> <label
									class="form-check-label" for="male">Male</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="gender"
									value="false" id="female"> <label
									class="form-check-label" for="female">Female</label>
							</div>
						</div>

						<div class="d-grid gap-2 col-6 mx-auto">
							<button type="submit" class="btn btn-outline-primary center">Đăng
								Ký</button>
							<a class="btn btn-outline-success" href="list-members">Xem
								list-member</a>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>