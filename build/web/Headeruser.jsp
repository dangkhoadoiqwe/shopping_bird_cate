<%-- 
    Document   : Headeruser
    Created on : 27 thg 8, 2023, 23:57:12
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="css/tiny-slider.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <style>
            /* CSS để tạo kiểu cho popover */
            .popover {
                display: none;
                position: absolute;
                background-color: #006400;
                border: 1px solid #ccc;
                padding: 20px;

                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            }
        </style>
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="Furni navigation bar">

            <div class="container">
                <a class="navbar-brand" href="MainController?action=product">Furni<span>.</span></a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni" aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarsFurni">
                    <ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
                        <li class="nav-item ">
                            <a class="nav-link" href="MainController?action=product">Home</a>
                        </li>
                        <li><a class="nav-link" href="MainController?action=shop">Shop</a></li>
                        <li><a class="nav-link" href="about.jsp">About us</a></li>
                        <li><a class="nav-link" href="Order.jsp">Order</a></li>
                        <li><a class="nav-link" href="blog.html">Blog</a></li>
                        <li><a class="nav-link" href="contact.jsp">Contact us</a></li>
                            <c:set var="id1" value="${account}" />
                        <li><a class="nav-link" href="#">Welcome ${id1.getLastName()}</a></li>
                        
                    </ul>

                    <ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
                        <li><a class="nav-link" href="Profile.jsp" style="margin-top:18px"><img src="images/user.svg"></a></li>
                        <li>
                            <a class="nav-link" href="cart.jsp" style="margin-top: 18px">
                                <img src="images/cart.svg" id="productImage" onmouseover="showPopover()" onmouseout="hidePopover()">
                                <c:forEach var="cart" items="${sessionScope.cart.getItems()}"  varStatus="loop"> 

                                    <c:choose>
                                        <c:when test="${empty cart.getProduct().getId()}">
                                            <!-- Nếu không có hình ảnh, hiển thị thông báo -->
                                            <div id="popover" class="popover" style="right: 50px; margin-left: 1800px; background-color: #ccc; margin-top: 80px;">
                                                <p style="color: black">Không tồn tại sản phẩm</p>
                                                <button onclick="addToCart()" style="border-radius: 43px;">View All product</button>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${loop.last}">
                                                <c:set var="firstCartItem" value="${cart}" />
                                                <div id="popover" class="popover" style="right: 70px; margin-left: 1050px; background-color: #ccc; margin-top: 80px;border-radius: 23px;">
                                                    <p class="nav-link"><img src="images/check.svg" style="height: 50px"><span  style="color: black ;font-family: Cursive; height: 70px;">Add success</span ></p>
                                                    <img src="${firstCartItem.getProduct().getImg()}" style="height: 130px; width: 150px;">
                                                    <p style="color: black">${firstCartItem.getProduct().getName()} VND</p>
                                                    <p style="color: black">${firstCartItem.getProduct().getPrice()} VND</p>
                                                    <button onclick="addToCart()" style="border-radius: 23px;">View All product</button>
                                                </div>
                                            </c:if>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </a>
                        </li>
<!-- Thêm menu "Setting" -->


                        <div style="width: 23px; height: 25px; background-color: red; border-radius: 50%;text-align: center;  color: white; margin-top: 10px;">
                            ${sessionScope.cart.getItems().size()}
                        </div>

                        <li><a class="nav-link" href="MainController?action=logout" ><img src="images/logout.svg"></a></li>
                    </ul>
                </div>
            </div>
                            
        </nav>
        <script>
// JavaScript để hiển thị và ẩn popover
            function showPopover() {
                var popover = document.getElementById("popover");
                popover.style.display = "block";
            }

            function hidePopover() {
                var popover = document.getElementById("popover");
                popover.style.display = "none";
            }
            function closePopover() {
                var popover = document.getElementById("popover");
                popover.style.display = "none";
            }
// JavaScript để thực hiện các hành động khi thêm sản phẩm vào giỏ hàng
            function addToCart() {
// Thêm sản phẩm vào giỏ hàng

// Chuyển người dùng đến trang cart.jsp
                window.location.href = "cart.jsp";
            }

        </script>
    </body>
</html>
