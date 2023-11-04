<%-- 
    Document   : profile
    Created on : 03-10-2023, 17:07:47
    Author     : Quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
﻿<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Hotel Dashboard Template</title>
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/css/feathericon.min.css">
        <link rel="stylesheet" href="assets/plugins/morris/morris.css">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="assets/css/style.css"> </head>

    <body>
        <div class="main-wrapper">
            <div class="header">
                <div class="header-left">
                    <a href="index.html" class="logo"> <img src="assets/img/hotel_logo.png" width="50" height="70" alt="logo"> <span class="logoclass">HOTEL</span> </a>
                    <a href="index.html" class="logo logo-small"> <img src="assets/img/hotel_logo.png" alt="Logo" width="30" height="30"> </a>
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
                            </div> <a class="dropdown-item" href="profile.jsp">My Profile</a> <a class="dropdown-item" href="settings.html">Account Settings</a> <a class="dropdown-item" href="login.html">Logout</a> </div>
                    </li>
                </ul>
            </div>
            <div class="sidebar" id="sidebar">
                <div class="sidebar-inner slimscroll">
                    <div id="sidebar-menu" class="sidebar-menu">
                        <ul>
                            <li class="active"> <a href="MainController?action=pro"><i class="fas fa-cube"></i> <span>Sản phẩm</span></a> </li>
                            <li class="active"> <a href="MainController?action=orderslist"><i class="fas fa-cube"></i> <span>Đơn đặt hàng</span></a> </li>
                            <li class="active"> <a  href="MainController?action=vu"><i class="fas fa-cube"></i> <span>Vouchers</span></a> </li>
                            <li class="list-divider"></li>                        
                        </ul>
                    </div>
                </div>
            </div>
            <div class="page-wrapper">
                <div class="content container-fluid">
                    <div class="page-header mt-5">
                        <div class="row">
                            <div class="col">
                                <h3 class="page-title">Profile</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Profile</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <!--                            <div class="profile-header">
                                                            <div class="row align-items-center">
                                                                <div class="col-auto profile-image">
                                                                    <a href="#"> <img class="rounded-circle" alt="User Image" src="assets/img/profiles/avatar-02.jpg"> </a>
                                                                </div>
                                                                <div class="col ml-md-n2 profile-user-info">
                                                                    <h4 class="user-name mb-3">David Alvarez</h4>
                                                                    <h6 class="text-muted mt-1">Manager</h6>
                                                                    <div class="user-Location mt-1"><i class="fas fa-map-marker-alt"></i> Florida, United States</div>
                                                                    <div class="about-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</div>
                                                                </div>
                                                                <div class="col-auto profile-btn"> <a href="" class="btn btn-primary">
                                                                        Message
                                                                    </a> <a href="edit-profile.html" class="btn btn-primary">
                                                                        Edit
                                                                    </a> </div>
                                                            </div>
                                                        </div>-->
                            <div class="profile-menu">
                                <ul class="nav nav-tabs nav-tabs-solid">
                                    <li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#per_details_tab">About</a> </li>
                                    <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#password_tab">Password</a> </li>
                                </ul>
                            </div>
                            <div class="tab-content profile-tab-cont">
                                <div class="tab-pane fade show active" id="per_details_tab">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div >
                                                <form action="updateacc" method="post">
                                                    <div class="row mb-3">
                                                        <div class="col-sm-3">
                                                            <h6 class="mb-0">Tên</h6>
                                                        </div>
                                                        <div class="col-sm-9 text-secondary">
                                                            <input type="hidden" class="form-control" value="${id1.getId()}" id="id" name="id">
                                                            <input type="text" class="form-control" value="${id1.getName()}" id="fullName" name="name">
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-sm-3">
                                                            <h6 class="mb-0">Email</h6>
                                                        </div>
                                                        <div class="col-sm-9 text-secondary">
                                                            <input type="hidden" class="form-control" value="${id1.getProfilePhoto()}" id="profilePhoto" name="profilePhoto">
                                                            <input type="text" class="form-control" value="${id1.getEmail()}" id="email" name="email">
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-sm-3">
                                                            <h6 class="mb-0">Phone</h6>
                                                        </div>
                                                        <div class="col-sm-9 text-secondary">
                                                            <input type="text" class="form-control" value="${id1.getPhone()}" id="phone" name="phone">
                                                        </div>
                                                    </div>

                                                    <div class="row mb-3">
                                                        <div class="col-sm-3">
                                                            <h6 class="mb-0">Address</h6>
                                                        </div>
                                                        <div class="col-sm-9 text-secondary">
                                                            <input type="text" class="form-control" value="${id1.getAddress()}" name="address" id="address">
                                                        </div>
                                                    </div>
                                                  
                                                    <div class="row">
                                                        <div class="col-sm-3"></div>
                                                        <div class="col-sm-9 text-secondary">
                                                            <input type="submit" class="btn btn-primary px-4" value="Update" >
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                 
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h5 class="card-title d-flex justify-content-between">
                                                        <span>Ảnh đại diện</span>
                                                        <a class="edit-link" data-toggle="modal" href="#edit_personal"><i class="fa fa-edit mr-1"></i>Thay đổi</a>
                                                    </h5>
                                                    <img class="avatar-img rounded-circle" alt="User Image" src="assets/img/profiles/avatar-02.jpg">
                                                    <!--                                                    <div class="row mt-5">
                                                                                                            <p class="col-sm-3 text-sm-right mb-0 mb-sm-3">Name</p>
                                                                                                            <p class="col-sm-9">David Alvarez</p>
                                                                                                        </div>
                                                                                                        <div class="row">
                                                                                                            <p class="col-sm-3 text-sm-right mb-0 mb-sm-3">Date of Birth</p>
                                                                                                            <p class="col-sm-9">24 Jul 1983</p>
                                                                                                        </div>
                                                                                                        <div class="row">
                                                                                                            <p class="col-sm-3 text-sm-right mb-0 mb-sm-3">Email ID </p>
                                                                                                            <p class="col-sm-9"><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="385c594e515c59544e594a5d42785d40595548545d165b5755">[email&#160;protected]</a></p>
                                                                                                        </div>
                                                                                                        <div class="row">
                                                                                                            <p class="col-sm-3 text-sm-right mb-0 mb-sm-3">Mobile</p>
                                                                                                            <p class="col-sm-9">305-310-5857</p>
                                                                                                        </div>
                                                                                                        <div class="row">
                                                                                                            <p class="col-sm-3 text-sm-right mb-0">Address</p>
                                                                                                            <p class="col-sm-9 mb-0">4663 Agriculture Lane,
                                                                                                                <br> Miami,
                                                                                                                <br> Florida - 33165,
                                                                                                                <br> United States.</p>
                                                                                                        </div>-->
                                                </div>
                                            </div>
                                            <div class="modal fade" id="edit_personal" aria-hidden="true" role="dialog">
                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Ảnh đại diện</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
                                                        </div>
                                                        <div class="modal-body">

                                                            <form>
                                                                <div class="row form-row">
                                                                    <div class="col-12 col-sm-6">
                                                                        <div class="form-group">
                                                                            <!--                                                                            <label>First Name</label>
                                                                                                                                                        <input type="text" class="form-control" value="John"> </div>-->
                                                                            <input type="file" name="newAvatar" accept="image/*">

                                                                        </div>
                                                                        <!--                                                                    <div class="col-12 col-sm-6">
                                                                                                                                                <div class="form-group">
                                                                                                                                                    <label>Last Name</label>
                                                                                                                                                    <input type="text" class="form-control" value="Doe"> </div>
                                                                                                                                            </div>
                                                                                                                                            <div class="col-12">
                                                                                                                                                <div class="form-group">
                                                                                                                                                    <label>Date of Birth</label>
                                                                                                                                                    <div class="cal-icon">
                                                                                                                                                        <input type="text" class="form-control" value="24-07-1983"> </div>
                                                                                                                                                </div>
                                                                                                                                            </div>
                                                                                                                                            <div class="col-12 col-sm-6">
                                                                                                                                                <div class="form-group">
                                                                                                                                                    <label>Email ID</label>
                                                                                                                                                    <input type="email" class="form-control" value="johndoe@example.com"> </div>
                                                                                                                                            </div>
                                                                                                                                            <div class="col-12 col-sm-6">
                                                                                                                                                <div class="form-group">
                                                                                                                                                    <label>Mobile</label>
                                                                                                                                                    <input type="text" value="+1 202-555-0125" class="form-control"> </div>
                                                                                                                                            </div>
                                                                                                                                            <div class="col-12">
                                                                                                                                                <h5 class="form-title"><span>Address</span></h5> </div>
                                                                                                                                            <div class="col-12">
                                                                                                                                                <div class="form-group">
                                                                                                                                                    <label>Address</label>
                                                                                                                                                    <input type="text" class="form-control" value="4663 Agriculture Lane"> </div>
                                                                                                                                            </div>
                                                                                                                                            <div class="col-12 col-sm-6">
                                                                                                                                                <div class="form-group">
                                                                                                                                                    <label>City</label>
                                                                                                                                                    <input type="text" class="form-control" value="Miami"> </div>
                                                                                                                                            </div>
                                                                                                                                            <div class="col-12 col-sm-6">
                                                                                                                                                <div class="form-group">
                                                                                                                                                    <label>State</label>
                                                                                                                                                    <input type="text" class="form-control" value="Florida"> </div>
                                                                                                                                            </div>
                                                                                                                                            <div class="col-12 col-sm-6">
                                                                                                                                                <div class="form-group">
                                                                                                                                                    <label>Zip Code</label>
                                                                                                                                                    <input type="text" class="form-control" value="22434"> </div>
                                                                                                                                            </div>
                                                                                                                                            <div class="col-12 col-sm-6">
                                                                                                                                                <div class="form-group">
                                                                                                                                                    <label>Country</label>
                                                                                                                                                    <input type="text" class="form-control" value="United States"> </div>
                                                                                                                                            </div>-->
                                                                    </div>
                                                                </div>
                                                                <button type="submit" class="btn btn-primary btn-block">Lưu</button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="password_tab" class="tab-pane fade">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title">Thay đổi mật khẩu</h5>
                                            <div class="row">
                                                <div class="col-md-10 col-lg-6">
                                                    <form>
                                                        <div class="form-group">
                                                            <label>Mật khẩu cũ</label>
                                                            <input type="password" class="form-control"> </div>
                                                        <div class="form-group">
                                                            <label>Mật khẩu mới</label>
                                                            <input type="password" class="form-control"> </div>
                                                        <div class="form-group">
                                                            <label>Nhập lại mật khẩu</label>
                                                            <input type="password" class="form-control"> </div>
                                                        <button class="btn btn-primary" type="submit">Lưu</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--             avatar-->

        </div>
        <script data-cfasync="false" src="../../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="assets/js/jquery-3.5.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
        <script src="assets/js/script.js"></script>


    </body>

</html>