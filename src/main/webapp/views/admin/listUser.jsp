<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin - Quản lý User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2 class="fw-bold">Danh sách User</h2>
        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addUserModal">+ Thêm User</button>
    </div>

    <table class="table table-bordered table-hover bg-white shadow-sm">
        <thead class="table-dark text-center">
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Họ tên</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Role</th>
                <th>Trạng thái</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="u" items="${users}">
            <tr class="align-middle text-center">
                <td>${u.id}</td>
                <td>${u.username}</td>
                <td>${u.fullname}</td>
                <td>${u.email}</td>
                <td>${u.phone}</td>
                <td>
                    <span class="badge ${u.role==2 ? 'bg-danger' : (u.role==1 ? 'bg-warning text-dark' : 'bg-info')}">
                        ${u.role==2 ? 'Admin' : (u.role==1 ? 'Manager' : 'User')}
                    </span>
                </td>
                <td>
                    <span class="badge ${u.status ? 'bg-success' : 'bg-secondary'}">
                        ${u.status ? 'Active' : 'Inactive'}
                    </span>
                </td>
                <td>
                    <button class="btn btn-sm btn-warning"
                            data-bs-toggle="modal" data-bs-target="#editUserModal${u.id}">Sửa</button>
                    <a href="${pageContext.request.contextPath}/admin/user/delete?id=${u.id}" 
                       class="btn btn-sm btn-danger"
                       onclick="return confirm('Xóa user này?')">Xóa</a>
                </td>
            </tr>

            <!-- Modal Sửa -->
            <div class="modal fade" id="editUserModal${u.id}" tabindex="-1">
              <div class="modal-dialog">
                <div class="modal-content">
                  <form action="${pageContext.request.contextPath}/admin/user/edit" method="post">
                      <div class="modal-header bg-warning">
                        <h5 class="modal-title">Sửa User</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                      </div>
                      <div class="modal-body">
                          <input type="hidden" name="id" value="${u.id}">
                          <div class="mb-3">
                              <label>Username</label>
                              <input type="text" class="form-control" name="username" value="${u.username}" required>
                          </div>
                          <div class="mb-3">
                              <label>Password</label>
                              <input type="password" class="form-control" name="password" value="${u.password}" required>
                          </div>
                          <div class="mb-3">
                              <label>Họ tên</label>
                              <input type="text" class="form-control" name="fullname" value="${u.fullname}" required>
                          </div>
                          <div class="mb-3">
                              <label>Email</label>
                              <input type="email" class="form-control" name="email" value="${u.email}" required>
                          </div>
                          <div class="mb-3">
                              <label>Phone</label>
                              <input type="text" class="form-control" name="phone" value="${u.phone}" required>
                          </div>
                          <div class="mb-3">
                              <label>Role</label>
                              <select class="form-select" name="role">
                                  <option value="0" ${u.role==0?"selected":""}>User</option>
                                  <option value="1" ${u.role==1?"selected":""}>Manager</option>
                                  <option value="2" ${u.role==2?"selected":""}>Admin</option>
                              </select>
                          </div>
                          <div class="form-check">
                              <input type="checkbox" class="form-check-input" name="status" ${u.status?"checked":""}>
                              <label class="form-check-label">Active</label>
                          </div>
                      </div>
                      <div class="modal-footer">
                          <button type="submit" class="btn btn-success">Lưu</button>
                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                      </div>
                  </form>
                </div>
              </div>
            </div>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Modal Thêm User -->
<div class="modal fade" id="addUserModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <form action="${pageContext.request.contextPath}/admin/user/add" method="post">
          <div class="modal-header bg-primary text-white">
            <h5 class="modal-title">Thêm User</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
          </div>
          <div class="modal-body">
              <div class="mb-3">
                  <label>Username</label>
                  <input type="text" class="form-control" name="username" required>
              </div>
              <div class="mb-3">
                  <label>Password</label>
                  <input type="password" class="form-control" name="password" required>
              </div>
              <div class="mb-3">
                  <label>Họ tên</label>
                  <input type="text" class="form-control" name="fullname" required>
              </div>
              <div class="mb-3">
                  <label>Email</label>
                  <input type="email" class="form-control" name="email" required>
              </div>
              <div class="mb-3">
                  <label>Phone</label>
                  <input type="text" class="form-control" name="phone" required>
              </div>
              <div class="mb-3">
                  <label>Role</label>
                  <select class="form-select" name="role">
                      <option value="0">User</option>
                      <option value="1">Manager</option>
                      <option value="2">Admin</option>
                  </select>
              </div>
              <div class="form-check">
                  <input type="checkbox" class="form-check-input" name="status" checked>
                  <label class="form-check-label">Active</label>
              </div>
          </div>
          <div class="modal-footer">
              <button type="submit" class="btn btn-primary">Thêm</button>
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
          </div>
      </form>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
