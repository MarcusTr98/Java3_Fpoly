<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin-Dashboard</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>

<body class="d-flex flex-column min-vh-100 bg-light">

	<jsp:include page="admin-header.jsp" />

	<main class="container flex-grow-1 py-5">
		<div class="row">
			<div class="col-md-12">
				<div class="card shadow border-0">
					<div class="card-header bg-primary text-white">
						<h4 class="mb-0">
							<i class="bi bi-shield-lock-fill"></i> KHU VỰC QUẢN TRỊ VIÊN
						</h4>
					</div>
					<div class="card-body p-5 text-center">

						<img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
							alt="Admin" width="100" class="mb-3">

						<h2 class="text-success">
							Xin chào sếp: <span class="fw-bold text-dark">${sessionScope.userInfo.fullname}</span>
						</h2>

						<p class="lead text-muted">
							Bạn đang đăng nhập với quyền: <span
								class="badge ${sessionScope.userInfo.role ? 'bg-danger' : 'bg-info'}">
								${sessionScope.user.admin ? 'Administrator' : 'Staff'} </span>
						</p>

						<hr>

						<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
							<button type="button"
								class="btn btn-outline-primary btn-lg px-4 gap-3">Quản
								lý User</button>
							<button type="button"
								class="btn btn-outline-secondary btn-lg px-4">Xem Báo
								Cáo</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<jsp:include page="admin-footer.jsp" />

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>