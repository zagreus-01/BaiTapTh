<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<footer class="bg-dark text-light pt-5 pb-3 mt-5">
    <div class="container">
        <div class="row">
            <div class="col-md-4 mb-4">
                <h4 class="fw-bold text-primary">MyWebsite</h4>
                <p>Nền tảng học tập & quản lý hiện đại. Thiết kế bằng <strong>JSP / Servlet</strong>.</p>
            </div>

            <div class="col-md-4 mb-4">
                <h5 class="text-uppercase mb-3">Liên kết nhanh</h5>
                <ul class="list-unstyled">
                    <li><a href="${pageContext.request.contextPath}/home" class="text-light text-decoration-none">Trang chủ</a></li>
                    <li><a href="${pageContext.request.contextPath}/about" class="text-light text-decoration-none">Giới thiệu</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact" class="text-light text-decoration-none">Liên hệ</a></li>
                    <li><a href="${pageContext.request.contextPath}/faq" class="text-light text-decoration-none">Hỏi đáp</a></li>
                </ul>
            </div>

            <div class="col-md-4 mb-4">
                <h5 class="text-uppercase mb-3">Kết nối</h5>
                <a href="#" class="text-light me-3 fs-4"><i class="bi bi-facebook"></i></a>
                <a href="#" class="text-light me-3 fs-4"><i class="bi bi-twitter"></i></a>
                <a href="#" class="text-light me-3 fs-4"><i class="bi bi-instagram"></i></a>
                <a href="#" class="text-light fs-4"><i class="bi bi-linkedin"></i></a>
            </div>
        </div>
    </div>

    <div class="text-center mt-4 border-top border-secondary pt-3">
        <p class="mb-0">&copy; 2025 <strong>MyWebsite</strong>. All Rights Reserved.</p>
    </div>
</footer>
