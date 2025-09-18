<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2>Danh sách Video</h2>
        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addModal">+ Thêm Video</button>
    </div>

    <table class="table table-bordered table-hover bg-white shadow-sm">
        <thead class="table-dark text-center">
            <tr>
                <th>ID</th>
                <th>Tiêu đề</th>
                <th>Trạng thái</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="v" items="${videos}">
            <tr class="align-middle text-center">
                <td>${v.id}</td>
                <td>${v.title}</td>
                <td>
                    <span class="badge ${v.status ? 'bg-success' : 'bg-secondary'}">
                        ${v.status ? 'Active' : 'Inactive'}
                    </span>
                </td>
                <td>
                    <button class="btn btn-sm btn-info"
                            data-bs-toggle="modal" data-bs-target="#viewModal${v.id}">Xem</button>
                    <button class="btn btn-sm btn-warning"
                            data-bs-toggle="modal" data-bs-target="#editModal${v.id}">Sửa</button>
                    <a href="${pageContext.request.contextPath}/manager/video/delete?id=${v.id}" 
                       class="btn btn-sm btn-danger"
                       onclick="return confirm('Bạn có chắc muốn xóa?')">Xóa</a>
                </td>
            </tr>

            <!-- Modal Xem -->
            <div class="modal fade" id="viewModal${v.id}" tabindex="-1">
              <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                  <div class="modal-header bg-info text-white">
                    <h5 class="modal-title">Chi tiết Video</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                  </div>
                  <div class="modal-body text-center">
                    <h5>${v.title}</h5>
                    <video width="100%" controls autoplay>
                        <source src="${pageContext.request.contextPath}/video/${v.url}" type="video/mp4">
                        Trình duyệt không hỗ trợ video.
                    </video>
                    <p class="mt-3">Trạng thái:
                        <span class="badge ${v.status ? 'bg-success' : 'bg-secondary'}">
                            ${v.status ? 'Active' : 'Inactive'}
                        </span>
                    </p>
                  </div>
                </div>
              </div>
            </div>

            <!-- Modal Sửa -->
            <div class="modal fade" id="editModal${v.id}" tabindex="-1">
              <div class="modal-dialog">
                <div class="modal-content">
                  <form action="${pageContext.request.contextPath}/manager/video/edit" method="post" enctype="multipart/form-data">
                      <div class="modal-header bg-warning">
                        <h5 class="modal-title">Sửa Video</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                      </div>
                      <div class="modal-body">
                          <input type="hidden" name="id" value="${v.id}">
                          <div class="mb-3">
                              <label class="form-label">Tiêu đề</label>
                              <input type="text" class="form-control" name="title" value="${v.title}" required>
                          </div>
                          <div class="mb-3">
                              <label class="form-label">Chọn file mới (nếu muốn thay)</label>
                              <input type="file" class="form-control" name="file">
                          </div>
                          <div class="form-check">
                              <input type="checkbox" class="form-check-input" name="status" ${v.status ? "checked" : ""}>
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

<!-- Modal Thêm -->
<div class="modal fade" id="addModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <form action="${pageContext.request.contextPath}/manager/video/add" method="post" enctype="multipart/form-data">
          <div class="modal-header bg-primary text-white">
            <h5 class="modal-title">Thêm Video</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
          </div>
          <div class="modal-body">
              <div class="mb-3">
                  <label class="form-label">Tiêu đề</label>
                  <input type="text" class="form-control" name="title" required>
              </div>
              <div class="mb-3">
                  <label class="form-label">Chọn file video (.mp4)</label>
                  <input type="file" class="form-control" name="file" required>
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
