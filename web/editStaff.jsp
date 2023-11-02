<%-- 
    Document   : editStaff
    Created on : 30-09-2023, 19:10:49
    Author     : Quang
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Hotel Dashboard Template</title>
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="assets/css/feathericon.min.css">
        <link rel="stylesheet" href="assets/plugins/morris/morris.css">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="assets/css/style.css"> </head>

    <body>
        <div class="main-wrapper">
            <div class="header">
                <div class="header-left">
                    <a  class="logo"> <img src="assets/img/hotel_logo.png" width="50" height="70" alt="logo"> <span class="logoclass">FURNI</span> </a>
                    <a " class="logo logo-small"> <img src="assets/img/hotel_logo.png" alt="Logo" width="30" height="30"> </a>
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
                            </div> <a class="dropdown-item" href="MainController?action=logout">Logout</a> </div>
                    </li>
                </ul>
            </div>
            <div class="sidebar" id="sidebar">
                <div class="sidebar-inner slimscroll">
                    <div id="sidebar-menu" class="sidebar-menu">
                        <ul>
                            <!--<li> <a href="index.html"><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a> </li>-->
                            <li class="list-divider"></li>
                            <!--                                                <li class="submenu"> <a href="#"><i class="fas fa-suitcase"></i> <span> Booking </span> <span class="menu-arrow"></span></a>
                                                                                    <ul class="submenu_class" style="display: none;">
                                                                                        <li><a href="allBoking.jsp"> All Booking </a></li>
                                                                                        <li><a href="editBooking.jsp"> Edit Booking </a></li>
                                                                                            <li><a href="add-booking.html"> Add Booking </a></li>
                                                                                    </ul>
                                                                            </li>-->
                            <li class="submenu"> <a href="#"><i class="fas fa-user"></i> <span> Customers </span> <span class="menu-arrow"></span></a>
                                <ul class="submenu_class" style="display: none;">
                                    <li><a href="allCus.jsp"> All customers </a></li>
                                    <!--								<li><a href="edit-customer.html"> Edit Customer </a></li>
                                                                                                    <li><a href="add-customer.html"> Add Customer </a></li>-->
                                </ul>
                            </li>
                            <!--						<li class="submenu"> <a href="#"><i class="fas fa-key"></i> <span> Rooms </span> <span class="menu-arrow"></span></a>
                                                                                    <ul class="submenu_class" style="display: none;">
                                                                                            <li><a href="all-rooms.html">All Rooms </a></li>
                                                                                            <li><a href="edit-room.html"> Edit Rooms </a></li>
                                                                                            <li><a href="add-room.html"> Add Rooms </a></li>
                                                                                    </ul>
                                                                            </li>-->
                            <li class="submenu"> <a href="#"><i class="fas fa-user"></i> <span> Staff </span> <span class="menu-arrow"></span></a>
                                <ul class="submenu_class" style="display: none;">
                                    <li><a href="MainController?action=AllSTAFF">All Staff </a></li>
<!--                                    <li><a href="MainController?action=Update&acc=${account.getId()}"> Edit Staff </a></li>-->
                                    <li><a href="addstaff.jsp"> Add Staff </a></li>
                                </ul>
                            </li>
                            <!--						<li> <a href="pricing.html"><i class="far fa-money-bill-alt"></i> <span>Pricing</span></a> </li>
                                                                            <li class="submenu"> <a href="#"><i class="fas fa-share-alt"></i> <span> Apps </span> <span class="menu-arrow"></span></a>
                                                                                    <ul class="submenu_class" style="display: none;">
                                                                                            <li><a href="chat.html"><i class="fas fa-comments"></i><span> Chat </span></a></li>
                                                                                            <li class="submenu"> <a href="#"><i class="fas fa-video camera"></i> <span> Calls </span> <span class="menu-arrow"></span></a>
                                                                                                    <ul class="submenu_class" style="display: none;">
                                                                                                            <li><a href="voice-call.html"> Voice Call </a></li>
                                                                                                            <li><a href="video-call.html"> Video Call </a></li>
                                                                                                            <li><a href="incoming-call.html"> Incoming Call </a></li>
                                                                                                    </ul>
                                                                                            </li>
                                                                                            <li class="submenu"> <a href="#"><i class="fas fa-envelope"></i> <span> Email </span> <span class="menu-arrow"></span></a>
                                                                                                    <ul class="submenu_class" style="display: none;">
                                                                                                            <li><a href="compose.html">Compose Mail </a></li>
                                                                                                            <li><a href="inbox.html"> Inbox </a></li>
                                                                                                            <li><a href="mail-veiw.html"> Mail Veiw </a></li>
                                                                                                    </ul>
                                                                                            </li>
                                                                                    </ul>
                                                                            </li>
                                                                            <li class="submenu"> <a href="#"><i class="fas fa-user"></i> <span> Employees </span> <span class="menu-arrow"></span></a>
                                                                                    <ul class="submenu_class" style="display: none;">
                                                                                            <li><a href="employees.html">Employees List </a></li>
                                                                                            <li><a href="leaves.html">Leaves </a></li>
                                                                                            <li><a href="holidays.html">Holidays </a></li>
                                                                                            <li><a href="attendance.html">Attendance </a></li>
                                                                                    </ul>
                                                                            </li>
                                                                            <li class="submenu"> <a href="#"><i class="far fa-money-bill-alt"></i> <span> Accounts </span> <span class="menu-arrow"></span></a>
                                                                                    <ul class="submenu_class" style="display: none;">
                                                                                            <li><a href="invoices.html">Invoices </a></li>
                                                                                            <li><a href="payments.html">Payments </a></li>
                                                                                            <li><a href="expenses.html">Expenses </a></li>
                                                                                            <li><a href="taxes.html">Taxes </a></li>
                                                                                            <li><a href="provident-fund.html">Provident Fund </a></li>
                                                                                    </ul>
                                                                            </li>
                                                                            <li class="submenu"> <a href="#"><i class="fas fa-book"></i> <span> Payroll </span> <span class="menu-arrow"></span></a>
                                                                                    <ul class="submenu_class" style="display: none;">
                                                                                            <li><a href="salary.html">Employee Salary </a></li>
                                                                                            <li><a href="salary-veiw.html">Payslip </a></li>
                                                                                    </ul>
                                                                            </li>
                                                                            <li> <a href="calendar.html"><i class="fas fa-calendar-alt"></i> <span>Calendar</span></a> </li>
                                                                            <li class="submenu"> <a href="#"><i class="fe fe-table"></i> <span> Blog </span> <span class="menu-arrow"></span></a>
                                                                                    <ul class="submenu_class" style="display: none;">
                                                                                            <li><a href="blog.html">Blog </a></li>
                                                                                            <li><a href="blog-details.html">Blog Veiw </a></li>
                                                                                            <li><a href="add-blog.html">Add Blog </a></li>
                                                                                            <li><a href="edit-blog.html">Edit Blog </a></li>
                                                                                    </ul>
                                                                            </li>
                                                                            <li> <a href="assets.html"><i class="fas fa-cube"></i> <span>Assests</span></a> </li>
                                                                            <li> <a href="activities.html"><i class="far fa-bell"></i> <span>Activities</span></a> </li>
                                                                            <li class="submenu"> <a href="#"><i class="fe fe-table"></i> <span> Reports </span> <span class="menu-arrow"></span></a>
                                                                                    <ul class="submenu_class" style="display: none;">
                                                                                            <li><a href="expense-reports.html">Expense Report </a></li>
                                                                                            <li><a href="invoice-reports.html">Invoice Report </a></li>
                                                                                    </ul>
                                                                            </li>
                                                                            <li> <a href="settings.html"><i class="fas fa-cog"></i> <span>Settings</span></a> </li>
                                                                            <li class="list-divider"></li>
                                                                            <li class="menu-title mt-3"> <span>UI ELEMENTS</span> </li>
                                                                            <li class="submenu"> <a href="#"><i class="fas fa-laptop"></i> <span> Components </span> <span class="menu-arrow"></span></a>
                                                                                    <ul class="submenu_class" style="display: none;">
                                                                                            <li><a href="uikit.html">UI Kit </a></li>
                                                                                            <li><a href="typography.html">Typography </a></li>
                                                                                            <li><a href="tabs.html">Tabs </a></li>
                                                                                    </ul>
                                                                            </li>
                                                                            <li class="submenu"> <a href="#"><i class="fas fa-edit"></i> <span> Forms </span> <span class="menu-arrow"></span></a>
                                                                                    <ul class="submenu_class" style="display: none;">
                                                                                            <li><a href="form-basic-inputs.html">Basic Input </a></li>
                                                                                            <li><a href="form-input-groups.html">Input Groups </a></li>
                                                                                            <li><a href="form-horizontal.html">Horizontal Form </a></li>
                                                                                            <li><a href="form-vertical.html">Vertical Form </a></li>
                                                                                    </ul>
                                                                            </li>
                                                                            <li class="submenu"> <a href="#"><i class="fas fa-table"></i> <span> Tables </span> <span class="menu-arrow"></span></a>
                                                                                    <ul class="submenu_class" style="display: none;">
                                                                                            <li><a href="tables-basic.html">Basic Table </a></li>
                                                                                            <li><a href="tables-datatables.html">Data Table </a></li>
                                                                                    </ul>
                                                                            </li>
                                                                            <li class="list-divider"></li>
                                                                            <li class="menu-title mt-3"> <span>EXTRAS</span> </li>
                                                                            <li class="submenu"> <a href="#"><i class="fas fa-columns"></i> <span> Pages </span> <span class="menu-arrow"></span></a>
                                                                                    <ul class="submenu_class" style="display: none;">
                                                                                            <li><a href="login.html">Login </a></li>
                                                                                            <li><a href="register.html">Register </a></li>
                                                                                            <li><a href="forgot-password.html">Forgot Password </a></li>
                                                                                            <li><a href="change-password.html">Change Password </a></li>
                                                                                            <li><a href="lock-screen.html">Lockscreen </a></li>
                                                                                            <li><a href="profile.html">Profile </a></li>
                                                                                            <li><a href="gallery.html">Gallery </a></li>
                                                                                            <li><a href="error-404.html">404 Error </a></li>
                                                                                            <li><a href="error-500.html">500 Error </a></li>
                                                                                            <li><a href="blank-page.html">Blank Page </a></li>
                                                                                    </ul>
                                                                            </li>
                                                                            <li class="submenu"> <a href="#"><i class="fas fa-share-alt"></i> <span> Multi Level </span> <span class="menu-arrow"></span></a>
                                                                                    <ul class="submenu_class" style="display: none;">
                                                                                            <li><a href="">Level 1 </a></li>
                                                                                            <li><a href="">Level 2 </a></li>
                                                                                    </ul>
                                                                            </li>-->
                        </ul>
                    </div>
                </div>
            </div>
            <div class="page-wrapper">
                <div class="content container-fluid">
                    <div class="page-header">
                        <div class="row align-items-center">
                            <div class="col">
                                <h3 class="page-title mt-5">Add Staff</h3> </div>
                        </div>
                    </div>
                    <c:set var="acID" value="${acID}"/>
                    <div class="row">
                        <div class="col-lg-12"> 
                            <form action="MainController" method="post">
                                <div class="row formtype">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Tên</label>
                                            <input class="form-control" type="text" name="ten" value="${acID.getName() }">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input class="form-control" type="text" name="email" value="${acID.getEmail()}">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Địa chỉ</label>
                                            <input class="form-control" type="text" name="diaChi" value="${acID.getAddress()}">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Số điện thoại</label>
                                            <input class="form-control" type="text" name="soDienThoai" value="${acID.getPhone()}">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Mật khẩu</label>
                                            <input  id="matKhauInput" class="form-control" type="password" name="matKhau" value="${acID.getPassword()}">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Vai trò</label>
                                            <select class="form-control" id="sel1" name="vaiTro"  value="${acID.getRole()}">

                                                <option  name="vaiTro" value="3">Staff</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="Avatar">Ảnh</label>
                                            <input type="file" name="Avatar" id="avatarInput" accept="images/">
                                            <img id="currentAvatar" src="${acID.getProfilePhoto()}" alt="Current Avatar">
                                            <input type="hidden" name="OAvatar" value="${acID.getProfilePhoto()}">
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" value="${acID.getId()}" name="acID">
                                <button type="submit" name="action" value="Update"   class="btn btn-primary buttonedit ml-2">Gửi</button>
                            </form>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        <script src="assets/js/jquery-3.5.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/plugins/raphael/raphael.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
        <script src="assets/js/script.js"></script>
        <script>
            $(function () {
                $('#datetimepicker3').datetimepicker({
                    format: 'LT'
                });
            });
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Đợi cho trang tải xong trước khi thực hiện việc ẩn mật khẩu
                var matKhauInput = document.getElementById("matKhauInput");
                var matKhauValue = "${acID.getPassword()}"; // Thay thế bằng cách tải dữ liệu mật khẩu thực tế

                // Ẩn mật khẩu sau khi tải
                matKhauInput.value = matKhauValue; // Đặt giá trị mật khẩu
                matKhauInput.type = "password"; // Đặt loại trường dữ liệu thành "password"
            });
        </script>
    </body>

</html>
