<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload image</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
</head>
<body class="container mt-4">
	<h1 class="text-success">Form Update Avatar</h1>
	<form action="uploads" method="post" enctype="multipart/form-data">
		<div class="row mt-5">
			<div class="col-md-2">
				<label class="form-label mb-3">Ảnh đại diện</label>
			</div>
			<div class="col-md-6">
				<input type="file" name="avatar" class="form-control">
			</div>
			<div class="col-md-4">
				<button type="submit" class="btn btn-outline-primary center">Tải
					lên</button>
			</div>
		</div>
	</form>

	<hr>
	<c:if test="${not empty messenger}">
		<div class="alert alert-danger">${messenger }</div>
	</c:if>
	<c:if test="${not empty fileName}">
		<div class="card" style="width: 18rem;">
			<img src="${pageContext.request.contextPath}/uploads/${fileName}"
				class="card-img-top" alt="Avatar update">
			<div class="card-body">
				<p class="card-text">Tên file: ${fileName }</p>
			</div>
		</div>
	</c:if>
</body>
</html>