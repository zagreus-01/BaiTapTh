<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body class="bg-light">

	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-4">
				<div class="card shadow-lg">
					<div class="card-header text-center bg-primary text-white">
						<h4>Đăng nhập</h4>
					</div>
					<div class="card-body">
						<!-- Hiển thị lỗi nếu có -->
						<c:if test="${not empty error}">
							<div class="alert alert-danger">${error}</div>
						</c:if>

						<form action="${pageContext.request.contextPath}/login"
							method="post">
							<div class="mb-3">
								<label class="form-label">Tên đăng nhập</label> <input
									type="text" name="username" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Mật khẩu</label> <input
									type="password" name="password" class="form-control" required>
							</div>
							<div class="d-grid">
								<button type="submit" class="btn btn-primary">Đăng nhập</button>
							</div>
						</form>
					</div>
					<div class="card-footer text-center">
						<small>Chưa có tài khoản? <a
							href="${pageContext.request.contextPath}/register">Đăng ký</a>
						</small>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
