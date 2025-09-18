<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="container mt-4">
    <h2>Danh sách Video</h2>

    <table class="table table-bordered table-hover bg-white shadow-sm">
        <thead class="table-dark text-center">
            <tr>
                <th>ID</th>
                <th>Tiêu đề</th>
                <th>Trạng thái</th>
                <th>Xem</th>
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
                </td>
            </tr>

            <!-- Modal Xem -->
            <div class="modal fade" id="viewModal${v.id}" tabindex="-1">
              <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                  <div class="modal-header bg-info text-white">
                    <h5 class="modal-title">${v.title}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                  </div>
                  <div class="modal-body text-center">
                    <video width="100%" controls autoplay muted>
                        <source src="${pageContext.request.contextPath}/video/${v.url}" type="video/mp4">
                        Trình duyệt không hỗ trợ video.
                    </video>
                  </div>
                </div>
              </div>
            </div>
        </c:forEach>
        </tbody>
    </table>
</div>
