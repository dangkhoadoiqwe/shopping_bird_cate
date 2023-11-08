<%-- 
    Document   : allStaff
    Created on : 30-09-2023, 19:04:08
    Author     : Quang
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

﻿<!DOCTYPE html>
<html lang="en">
    <style>
        /* CSS cho popup container */
        .popup-container {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }

        /* CSS cho popup */
        .popup {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            z-index: 1000;
        }
    </style>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Bird Cate Dashboard Template</title>
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/css/feathericon.min.css">
        <link rel="stylesheet" href="assets/plugins/datatables/datatables.min.css">
        <link rel="stylesheet" href="assets/plugins/morris/morris.css">
        <link rel="stylesheet" href="assets/css/style.css"> </head>

    <body>
        <div class="main-wrapper">
            <div class="header">
                <div class="header-left">
                    <a href="home.jsp" class="logo"> <img src="assets/img/hotel_logo.png" width="50" height="70" alt="logo"> <span class="logoclass">FURNI</span> </a>
                    <a href="home.jsp" class="logo logo-small"> <img src="assets/img/hotel_logo.png" alt="Logo" width="30" height="30"> </a>
                </div>
                <a href="javascript:void(0);" id="toggle_btn"> <i class="fe fe-text-align-left"></i> </a>
                <a class="mobile_btn" id="mobile_btn"> <i class="fas fa-bars"></i> </a>
                <ul class="nav user-menu">
                    <li class="nav-item dropdown noti-dropdown">
                        <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown"> <i class="fe fe-bell"></i> <span class="badge badge-pill">3</span> </a>
                        <div class="dropdown-menu notifications">
                            <div class="topnav-dropdown-header"> <span class="notification-title">Notifications</span> <a href="javascript:void(0)" class="clear-noti"> Clear All </a> </div>
                            <div class="noti-content">
                                <ul class="notification-list">
                                    <li class="notification-message">
                                        <a href="#">
                                            <div class="media"> <span class="avatar avatar-sm">
                                                    <img class="avatar-img rounded-circle" alt="User Image" src="assets/img/profiles/avatar-02.jpg">
                                                </span>
                                                <div class="media-body">
                                                    <p class="noti-details"><span class="noti-title">Carlson Tech</span> has approved <span class="noti-title">your estimate</span></p>
                                                    <p class="noti-time"><span class="notification-time">4 mins ago</span> </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="notification-message">
                                        <a href="#">
                                            <div class="media"> <span class="avatar avatar-sm">
                                                    <img class="avatar-img rounded-circle" alt="User Image" src="assets/img/profiles/avatar-11.jpg">
                                                </span>
                                                <div class="media-body">
                                                    <p class="noti-details"><span class="noti-title">International Software
                                                            Inc</span> has sent you a invoice in the amount of <span class="noti-title">$218</span></p>
                                                    <p class="noti-time"><span class="notification-time">6 mins ago</span> </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="notification-message">
                                        <a href="#">
                                            <div class="media"> <span class="avatar avatar-sm">
                                                    <img class="avatar-img rounded-circle" alt="User Image" src="assets/img/profiles/avatar-17.jpg">
                                                </span>
                                                <div class="media-body">
                                                    <p class="noti-details"><span class="noti-title">John Hendry</span> sent a cancellation request <span class="noti-title">Apple iPhone
                                                            XR</span></p>
                                                    <p class="noti-time"><span class="notification-time">8 mins ago</span> </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="notification-message">
                                        <a href="#">
                                            <div class="media"> <span class="avatar avatar-sm">
                                                    <img class="avatar-img rounded-circle" alt="User Image" src="assets/img/profiles/avatar-13.jpg">
                                                </span>
                                                <div class="media-body">
                                                    <p class="noti-details"><span class="noti-title">Mercury Software
                                                            Inc</span> added a new product <span class="noti-title">Apple
                                                            MacBook Pro</span></p>
                                                    <p class="noti-time"><span class="notification-time">12 mins ago</span> </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="topnav-dropdown-footer"> <a href="#">View all Notifications</a> </div>
                        </div>
                    </li>
                    <li class="nav-item dropdown has-arrow">
                        <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown"> <span class="user-img"><img class="rounded-circle" src="assets/img/profiles/avatar-01.jpg" width="31" alt="Soeng Souy"></span> </a>
                        <div class="dropdown-menu">
                            <div class="user-header">
                                <div class="avatar avatar-sm"> <img src="assets/img/profiles/avatar-01.jpg" alt="User Image" class="avatar-img rounded-circle"> </div>
                                <div class="user-text">
                                    <h6>Soeng Souy</h6>
                                    <p class="text-muted mb-0">Administrator</p>
                                </div>
                            </div>  <a class="dropdown-item"  href="MainController?action=logout">Logout</a> </div>
                    </li>
                </ul>
            </div>
            <div class="sidebar" id="sidebar">
                <div class="sidebar-inner slimscroll">
                    <div id="sidebar-menu" class="sidebar-menu">
                        <ul>
                            <li class="list-divider"></li>
                            <li class="submenu"> <a href="MainController?action=MANAGE_ACCOUNT"><i class="fas fa-user"></i> <span> Customers </span> <span class="menu-arrow"></span></a>
                                <ul class="submenu_class" style="display: none;">
                                    <li><a href="MainController?action=MANAGE_ACCOUNT">All Custom</a></li>
                                </ul>
                            </li>
                            <li class="submenu"> <a href="#"><i class="fas fa-user"></i> <span> Staff </span> <span class="menu-arrow"></span></a>
                                <ul class="submenu_class" style="display: none;">
                                    <li><a href="MainController?action=AllSTAFF">All Staff </a></li>
<!--                                    <li><a href="MainController?action=Update&acc=${account.getId()}"> Edit Staff </a></li>-->
                                    <li><a href="addstaff.jsp"> Add Staff </a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="page-wrapper">
                <div class="content container-fluid">
                    <div class="page-header">
                        <div class="row align-items-center">
                            <div class="col">
                                <div class="mt-5">
                                    <h4 class="card-title float-left mt-2">All Staff</h4> <a href="addstaff.jsp" class="btn btn-primary float-right veiwbutton">Thêm nhân viên</a> </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <form action="MainController" method="post">
                                <div class="row formtype">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <input class="form-control" name="txtsearch" type="text" value=""  placeholder='Search Keyword'
                                                   onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search Keyword'">
                                            <input type="hidden" name="isSearch" value="true">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <select name="searchby" class="form-control">
                                                <option value="byName">Theo tên</option>
                                                <option value="byEmail">Theo Email</option>
                                                <option value="byPhone">Theo số điện thoại</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <input class="btn btn-success btn-block mt-0 search_button" type="submit" name="action" value="Searchs"   type="submit">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card card-table">
                                <div class="card-body booking_card">
                                    <div class="table-responsive">
                                        <table class="datatable table table-stripped table table-hover table-center mb-0">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Ảnh</th>
                                                    <th>Tên</th>
                                                    <th>Số điện thoại</th>
                                                    <th>Email</th>
                                                    <th>Địa chỉ</th>
                                                    <th>Vai trò</th>
                                                    <th>Trạng thái</th>
                                                    <th class="text-right">Chức năng</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="acc" items="${Staff}">
                                                    <tr>
                                                        <td>${acc.id}</td>
                                                        <td>
                                                            <h2 class="table-avatar">
                                                                <a  class="avatar avatar-sm mr-2">
                                                                    <img class="avatar-img rounded-circle" src="${acc.profilePhoto}" alt="User Image">
                                                                </a>

                                                            </h2>
                                                        </td>
                                                        <td>${acc.name}</td>
                                                        <td>${acc.phone}</td>
                                                        <td>${acc.email}</td>
                                                        <td>${acc.getAddress()}</td>
                                                        <td>
                                                            <div class="actions">
                                                                <c:choose>
                                                                    <c:when test="${acc.role == 1}">
                                                                        <a class="btn btn-sm bg-success-light mr-2">Quản lí</a>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <a class="btn btn-sm bg-danger-light mr-2">Nhân viên</a>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                        </td>

                                                        <td>
                                                            <div class="actions">
                                                                <c:choose>
                                                                    <c:when test="${acc.status == 1}">
                                                                        <a class="btn btn-sm bg-success-light mr-2">Đang hoạt động</a>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <a class="btn btn-sm bg-danger-light mr-2">Không hoạt động</a>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                        </td>
                                                        <td class="text-right">
                                                            <div class="dropdown dropdown-action"> <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v ellipse_color"></i></a>
                                                                <div class="dropdown-menu dropdown-menu-right">  
                                                                    <a class="dropdown-item" href="MainController?action=SearchByID&acID=${acc.id}"><i class="fas fa-trash-alt m-r-5"></i> Edit</a>
                                                                    <c:choose>
                                                                        <c:when test="${acc.status == 1}">
                                                                            <a class="dropdown-item" href="MainController?action=BAN_Staff&userId=${acc.id}&accountStatus=${acc.status}&lastSearchValue=${requestScope.lastSearchValue}&searchByValue=${requestScope.searchByValue}&isSearch=${requestScope.isSearch == null ? false : requestScope.isSearch}"><i class="fas fa-pencil-alt m-r-5"></i> Block</a>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <a class="dropdown-item" href="MainController?action=BAN_Staff&userId=${acc.id}&accountStatus=${acc.status}&lastSearchValue=${requestScope.lastSearchValue}&searchByValue=${requestScope.searchByValue}&isSearch=${requestScope.isSearch == null ? false : requestScope.isSearch}"><i class="fas fa-pencil-alt m-r-5"></i> Unblock</a>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--        <div id="popup" class="popup-container">
                    <div class="popup">
                        <form action="MainController" method="post">
                            <div class="row formtype">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Tên</label>
                                        <input class="form-control" type="text" name="ten" value="${ac.getName()}">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input class="form-control" type="text" name="email" value="${ac.getEmail()}">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Địa chỉ</label>
                                        <input class="form-control" type="text" name="diaChi" value="${ac.getAddress()}">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Số điện thoại</label>
                                        <input class="form-control" type="text" name="soDienThoai" value="${ac.getPhone()}">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Mật khẩu</label>
                                        <input class="form-control" type="password" name="matKhau" value="">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Vai trò</label>
                                        <select class="form-control" id="sel1" name="vaiTro"  value="${acc.getRole()}">
                                            <option value="3">Manager</option>
                                            <option value="1">Staff</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <button type="submit" name="action" value="Update" class="btn btn-primary buttonedit ml-2 ml-auto">Gửi</button>
                        </form>
                        <button id="close-popup-button" class="close-popup-button">Close</button>
                        <p>${errorMessage}</p>
                    </div>
                </div>-->
        <script data-cfasync="false" src="../../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="assets/js/jquery-3.5.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/plugins/raphael/raphael.min.js"></script>
        <script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="assets/plugins/datatables/datatables.min.js"></script>
        <script src="assets/js/script.js"></script>

    </body>

</html>
