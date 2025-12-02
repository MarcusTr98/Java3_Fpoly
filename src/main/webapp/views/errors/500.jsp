<%@ page isErrorPage="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Lỗi Hệ Thống</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body class="bg-light d-flex align-items-center justify-content-center"
	style="height: 100vh;">
	<div class="text-center">
		<h1 class="display-1 fw-bold text-danger">500</h1>
		<h2 class="mb-4">Oops! Có lỗi xảy ra.</h2>
		<p class="lead text-muted">Hệ thống đang gặp sự cố kỹ thuật. Vui
			lòng quay lại sau.</p>

		<div class="alert alert-warning mt-4 text-start"
			style="max-width: 600px; overflow: auto;">
			<strong>Technical Details:</strong> <br>
			<%=exception.getMessage()%>
		</div>

		<a href="${pageContext.request.contextPath}/login-lang"
			class="btn btn-primary mt-3">Quay về trang chủ</a>
	</div>
</body>
</html>