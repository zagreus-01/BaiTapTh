<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng ký</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
        }
        .form-container {
            width: 350px;
            margin: 80px auto;
            padding: 25px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.15);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-container input {
            width: 100%;
            padding: 10px;
            margin: 6px 0 12px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .form-container button {
            width: 100%;
            padding: 10px;
            background: #007bff;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
        }
        .form-container button:hover {
            background: #0056b3;
        }
        small {
            display: block;
            text-align: center;
            margin-top: 12px;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Đăng ký</h2>

    <!-- Hiển thị lỗi nếu có -->
    <c:if test="${not empty error}">
        <p style="color: red; text-align:center;">${error}</p>
    </c:if>

    <form action="${pageContext.request.contextPath}/register" method="post">
        <input type="text" name="fullname" placeholder="Họ tên" required>
        <input type="text" name="username" placeholder="Tên đăng nhập" required>
        <input type="email" name="email" placeholder="Email" required>
        <input type="text" name="phone" placeholder="Số điện thoại" required>
        <input type="password" name="password" placeholder="Mật khẩu" required>
        <input type="password" name="confirm" placeholder="Nhập lại mật khẩu" required>
        <button type="submit">Đăng ký</button>
    </form>

    <small>Đã có tài khoản? <a href="${pageContext.request.contextPath}/login">Đăng nhập</a></small>
</div>
</body>
</html>
