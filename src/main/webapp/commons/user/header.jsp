<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <!-- Logo -->
    <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/user/home">Website Cua Tung </a>

    <!-- Toggle cho mobile -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#userNavbar"
      aria-controls="userNavbar" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Menu -->
    <div class="collapse navbar-collapse" id="userNavbar">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/user/category">Category</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/user/video">Video</a>
        </li>
      </ul>

      <!-- Thông tin login -->
      <c:if test="${empty user}">
        <a href="${pageContext.request.contextPath}/login" class="btn btn-light">Đăng nhập</a>
      </c:if>
      <c:if test="${not empty user}">
        <span class="navbar-text me-3 text-white">Xin chào, ${user.fullname}</span>
        <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-light">Đăng xuất</a>
      </c:if>
    </div>
  </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
