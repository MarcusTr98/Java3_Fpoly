<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setBundle basename="resources.global" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><fmt:message key="login.title" /></title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container py-5 mb-3">
		<div class="text-end mb-2">
			<a href="?lang=vi" class="btn btn-sm btn-outline-danger">Tiếng
				Việt</a> <a href="?lang=en" class="btn btn-sm btn-outline-primary">English</a>
		</div>


		<c:url value="/login-lang" var="path" />

		<div class="card mx-auto shadow" style="max-width: 840px;">
			<div class="row g-0 mb-3">
				<div class="col-12 text-center pt-3">

					<h1 class="text-success">
						<fmt:message key="login.title" />
					</h1>
					<i class="text-danger">${message }</i> <i class="text-danger">${param.error}</i>
				</div>
				<c:url value="/img/signup.jpg" var="img" />
				<div class="col-md-4 d-flex align-items-center">
					<img src="${img }" class="img-fluid rounded-start m-3" alt="signup">
				</div>
				<div class="col-md-8">
					<div class="card-body">
						<form action="${pageContext.request.contextPath}/login-lang"
							method="post" class="m-3">
							<div class="mb-3">
								<label for="username" class="form-label"><fmt:message
										key="login.username" /></label> <input type="text"
									class="form-control" id="username" name="username">
							</div>
							<div class="mb-3">
								<label for="password" class="form-label"><fmt:message
										key="login.password" /></label> <input type="password"
									name="password" class="form-control" id="password">
							</div>
							<div class="d-grid gap-2 col-6 mx-auto mt-4">
								<button type="submit" class="btn btn-outline-primary center">
									<fmt:message key="login.button" />
								</button>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>