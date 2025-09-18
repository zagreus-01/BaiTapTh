<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title><sitemesh:write property="title" default="MyWebsite" /></title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Custom CSS (nếu có) -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body class="d-flex flex-column min-vh-100">

    <!-- Header -->
    <%@ include file="/commons/admin/header.jsp" %>

    <!-- Main Content -->
    <main class="flex-fill">
        <div class="container py-4">
            <sitemesh:write property="body" />
        </div>
    </main>

    <!-- Footer -->
    <%@ include file="/commons/admin/footer.jsp" %>

    <!-- Bootstrap JS (bundle gồm cả Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
