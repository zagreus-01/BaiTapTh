<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý Category</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2>Danh sách Category</h2>
        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addModal">+ Thêm Category</button>
    </div>

    <table class="table table-bordered table-hover bg-white shadow-sm">
        <thead class="table-dark text-center">
            <tr>
                <th>ID</th>
                <th>Tên</th>
                <th>Ảnh</th>
                <th>Trạng thái</th>
                <th>Hành động</th>
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
                    <button class="btn btn-sm btn-warning"
                            data-bs-toggle="modal" data-bs-target="#editModal${c.id}">Sửa</button>
                    <button class="btn btn-sm btn-info"
                            data-bs-toggle="modal" data-bs-target="#viewModal${c.id}">Xem</button>
                    <a href="${pageContext.request.contextPath}/manager/category/delete?id=${c.id}" 
                       class="btn btn-sm btn-danger"
                       onclick="return confirm('Bạn có chắc muốn xóa?')">Xóa</a>
                </td>
            </tr>

            <!-- Modal Sửa -->
            <div class="modal fade" id="editModal${c.id}" tabindex="-1">
              <div class="modal-dialog">
                <div class="modal-content">
                  <form action="${pageContext.request.contextPath}/manager/category/edit" 
                        method="post" enctype="multipart/form-data">
                      <div class="modal-header bg-warning">
                        <h5 class="modal-title">Sửa Category</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                      </div>
                      <div class="modal-body">
                          <input type="hidden" name="id" value="${c.id}">
                          <div class="mb-3">
                              <label class="form-label">Tên</label>
                              <input type="text" class="form-control" name="name" value="${c.name}" required>
                          </div>
                          <div class="mb-3">
                              <label class="form-label">Ảnh hiện tại</label><br>
                              <img src="${pageContext.request.contextPath}/image/${c.img}" 
                                   class="img-thumbnail mb-2" width="100">
                              <input type="file" class="form-control" name="img">
                          </div>
                          <div class="form-check">
                              <input type="checkbox" class="form-check-input" name="status" ${c.status ? "checked" : ""}>
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
                    <p><strong>Trạng thái:</strong> ${c.status ? "Active" : "Inactive"}</p>
                  </div>
                </div>
              </div>
            </div>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Modal Thêm -->
<div class="modal fade" id="addModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <form action="${pageContext.request.contextPath}/manager/category/add" 
            method="post" enctype="multipart/form-data">
          <div class="modal-header bg-primary text-white">
            <h5 class="modal-title">Thêm Category</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
          </div>
          <div class="modal-body">
              <div class="mb-3">
                  <label class="form-label">Tên</label>
                  <input type="text" class="form-control" name="name" required>
              </div>
              <div class="mb-3">
                  <label class="form-label">Ảnh</label>
                  <input type="file" class="form-control" name="img">
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
