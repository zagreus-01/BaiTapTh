<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!-- Navbar Manager -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/manager/home">
      Manager 
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#managerNav"
      aria-controls="managerNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="managerNav">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <!-- Quản lý Category -->
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/manager/home">Category</a>
        </li>
        <!-- Quản lý Video -->
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/manager/video">Video</a>
        </li>
      </ul>

      <!-- Nếu đã đăng nhập -->
      <c:if test="${not empty user}">
        <span class="navbar-text me-3 text-white">
          Xin chào, ${user.fullname}
        </span>
        <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-light btn-sm">
          Đăng xuất
        </a>
      </c:if>
    </div>
  </div>
</nav>
