<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h1 class="mb-4">Trang chủ User</h1>

    <c:if test="${not empty user}">
        <div class="alert alert-info">
            Xin chào, <strong>${user.fullname}</strong>! <br>
            Tên đăng nhập: ${user.username} | Email: ${user.email} | SĐT: ${user.phone}
        </div>
    </c:if>

    <c:if test="${empty user}">
        <div class="alert alert-warning">
            Bạn chưa đăng nhập. <a href="${pageContext.request.contextPath}/login">Đăng nhập ngay</a>
        </div>
    </c:if>

    <hr>

    <h3>Danh sách Category</h3>
    <table class="table table-bordered table-hover bg-white shadow-sm">
        <thead class="table-dark text-center">
            <tr>
                <th>ID</th>
                <th>Tên</th>
                <th>Ảnh</th>
                <th>Trạng thái</th>
                <th>Xem chi tiết</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${categories}">
            <tr class="align-middle">
                <td class="text-center">${c.id}</td>
                <td>${c.name}</td>
                <td class="text-center">
                    <img src="${pageContext.request.contextPath}/image/${c.img}" 
                         class="img-thumbnail" style="max-height:70px;object-fit:cover">
                </td>
                <td class="text-center">
                    <span class="badge ${c.status ? 'bg-success' : 'bg-secondary'}">
                        ${c.status ? 'Active' : 'Inactive'}
                    </span>
                </td>
                <td class="text-center">
                    <button class="btn btn-sm btn-info"
                            data-bs-toggle="modal" data-bs-target="#viewModal${c.id}">
                        Xem
                    </button>
                </td>
            </tr>

            <!-- Modal Xem -->
            <div class="modal fade" id="viewModal${c.id}" tabindex="-1">
              <div class="modal-dialog modal-lg">
                <div class="modal-content">
                  <div class="modal-header bg-info text-white">
                    <h5 class="modal-title">Chi tiết Category</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                  </div>
                  <div class="modal-body">
                    <p><strong>ID:</strong> ${c.id}</p>
                    <p><strong>Tên:</strong> ${c.name}</p>
                    <p><strong>Ảnh:</strong><br>
                        <img src="${pageContext.request.contextPath}/image/${c.img}" class="img-fluid">
                    </p>
                    <p><strong>Trạng thái:</strong> 
                        <span class="badge ${c.status ? 'bg-success' : 'bg-secondary'}">
                            ${c.status ? 'Active' : 'Inactive'}
                        </span>
                    </p>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                  </div>
                </div>
              </div>
            </div>
        </c:forEach>
        </tbody>
    </table>

    <div class="mt-3">
        <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger">Đăng xuất</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
