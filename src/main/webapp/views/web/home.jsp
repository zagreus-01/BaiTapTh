<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Home</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/user/home">My Website</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <span class="navbar-text text-white">
                            Xin chào, <c:out value="${sessionScope.user.username}" />
                        </span>
                    </li>
                    <li class="nav-item ms-3">
                        <a class="btn btn-sm btn-outline-light" href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Nội dung chính -->
    <div class="container mt-4">
        <div class="text-center">
            <h1>Trang chủ User</h1>
            <p class="lead">Chào mừng bạn đến với hệ thống!</p>
        </div>

        <div class="row mt-5">
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Thông tin cá nhân</h5>
                        <p class="card-text">Xem và chỉnh sửa thông tin cá nhân của bạn.</p>
                        <a href="#" class="btn btn-primary">Xem chi tiết</a>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Thông báo</h5>
                        <p class="card-text">Xem các thông báo mới nhất từ hệ thống.</p>
                        <a href="#" class="btn btn-primary">Xem thông báo</a>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Hỗ trợ</h5>
                        <p class="card-text">Cần giúp đỡ? Liên hệ đội ngũ hỗ trợ.</p>
                        <a href="#" class="btn btn-primary">Liên hệ</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-primary text-white text-center py-3 mt-5">
        &copy; 2025 My Website. All rights reserved.
    </footer>
</body>
</html>
