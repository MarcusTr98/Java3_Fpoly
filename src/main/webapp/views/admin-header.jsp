<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
	<div class="container">
		<a class="navbar-brand fw-bold text-warning"
			href="${pageContext.request.contextPath}/home"> <i
			class="bi bi-code-slash"></i> MARCUS SYSTEM
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarContent">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active" href="#">Trang
						chủ</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Nhân sự</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Báo cáo</a></li>
			</ul>

			<div class="d-flex align-items-center">
				<c:choose>
					<%-- Nếu đã đăng nhập (session có userInfo lấy ở servlet login/filter) --%>
					<c:when test="${not empty sessionScope.userInfo}">
						<span class="text-light me-3"> Xin chào, <strong
							class="text-warning">${sessionScope.userInfo.fullname}</strong>
						</span>
						<a href="${pageContext.request.contextPath}/logout"
							class="btn btn-outline-danger btn-sm"> Đăng xuất </a>
					</c:when>
					<%-- Nếu chưa đăng nhập --%>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/login"
							class="btn btn-primary btn-sm"> Đăng nhập </a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</nav>