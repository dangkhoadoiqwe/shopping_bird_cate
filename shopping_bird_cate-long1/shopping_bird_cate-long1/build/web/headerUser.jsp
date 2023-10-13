<%-- 
    Document   : headerUser
    Created on : 26-09-2023, 21:56:06
    Author     : Quang
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="scss/login.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js">
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js">
        </script>
    </head>
    <body>
        <nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="Furni navigation bar">

            <div class="container">
                <a class="navbar-brand" href="homePage.jsp">Furni<span>.</span></a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni" aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarsFurni">
                    <ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
                        <li class="nav-item active">
                            <a class="nav-link" href="MainController?action=LOAD_HOME_PAGE">Trang chủ</a>
                        </li>
                        <li><a class="nav-link" href="MainController?action=shop">Cửa hàng</a></li>
                        <li><a class="nav-link" href="blog.jsp">Blog</a></li>
                        <li><a class="nav-link" href="contact.jsp">Liên hệ</a></li>
                    </ul>
                    <ul><!-- Thêm menu "Setting" -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="settingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="margin-top:15px;color:#ffffff; ">
                              Welcome  ${sessionScope.account.getName()}
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="settingDropdown">
                                <li><a class="dropdown-item" href="MainController?action=delivery&payid=${sessionScope.account.getId()}">Đơn hàng</a></li>
                                <li><a class="dropdown-item" href="MainController?action=logout">Logout</a></li>
                            </ul>
                        </li></ul>
                            
                             <ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
                        <li><a class="cd-signin" href="MainController?action=loadacc&id=${sessionScope.account.getId()}"><img style =" margin-top:12px" src="images/user.svg"></a></li>
                        <li><a class="nav-link" href="cart.jsp"><img src="images/cart.svg"></a></li>
                         <li style="width: 25px; height: 25px; background-color: red; border-radius: 50%; text-align: center; color: white; margin-top: 10px;">
                            ${sessionScope.cart.getItems().size()}
                        </li>    
                    </ul>
                  
                </div>
            </div>

        </nav>

 </html>
