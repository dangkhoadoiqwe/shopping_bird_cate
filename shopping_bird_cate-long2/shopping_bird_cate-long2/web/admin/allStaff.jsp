<%-- 
    Document   : allStaff
    Created on : 30-09-2023, 19:04:08
    Author     : Quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
﻿<!DOCTYPE html>
<html lang="en">

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
                            </div> <a class="dropdown-item" href="profile.html">My Profile</a> <a class="dropdown-item" href="settings.html">Account Settings</a> <a class="dropdown-item" href="login.html">Logout</a> </div>
                    </li>
                </ul>
            </div>
            <div class="sidebar" id="sidebar">
                <div class="sidebar-inner slimscroll">
                    <div id="sidebar-menu" class="sidebar-menu">
                        <ul>
                            <li class="list-divider"></li>
                            <li class="submenu"> <a href="#"><i class="fas fa-user"></i> <span> Customers </span> <span class="menu-arrow"></span></a>
                                <ul class="submenu_class" style="display: none;">
                                    <li><a href="allCus.jsp"> All customers </a></li>
                                </ul>
                            </li>
                            <li class="submenu"> <a href="#"><i class="fas fa-user"></i> <span> Staff </span> <span class="menu-arrow"></span></a>
                                <ul class="submenu_class" style="display: none;">
                                    <li><a href="allStaff.jsp">All Staff </a></li>
                                    <li><a href="editStaff.jsp"> Edit Staff </a></li>
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
                                    <h4 class="card-title float-left mt-2">All Staff</h4> <a href="add-staff.html" class="btn btn-primary float-right veiwbutton">Add Staff</a> </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <form>
                                <div class="row formtype">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label> ID</label>
                                            <input class="form-control" type="text" value="BKG-0001"> </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Search Type</label>
                                            <select name="searchBy" class="form-control">
                                                <option value="byName">By Name</option>
                                                <option value="byEmail">By ID</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Search</label>
                                            <a href="#" class="btn btn-success btn-block mt-0 search_button"> Search </a> </div>
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
                                                <tr>
                                                    <td>ST-001</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.html" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/profiles/avatar-03.jpg" alt="User Image"></a>
                                                            <a href="profile.html">Tommy Bernal <span>#0001</span></a>
                                                        </h2>
                                                    </td>
                                                    <td>001</td>
                                                    <td><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="ea9e85878793888f98848b86aa8d878b8386c4898587">[email&#160;protected]</a></td>

                                                    <td>2 abc</td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-success-light mr-2">Staff</a> </div>
                                                    </td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-success-light mr-2">Đang hoạt động</a> </div>
                                                    </td>
                                                    <td class="text-right">
                                                        <div class="dropdown dropdown-action"> <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v ellipse_color"></i></a>
                                                            <div class="dropdown-menu dropdown-menu-right"> <a class="dropdown-item" href="edit-staff.html"><i class="fas fa-pencil-alt m-r-5"></i> Sửa</a> <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_asset"><i class="fas fa-trash-alt m-r-5"></i> Delete</a> </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>ST-002</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.html" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/profiles/avatar-04.jpg" alt="User Image"></a>
                                                            <a href="profile.html">Richard Brobst <span>#0001</span></a>
                                                        </h2>
                                                    </td>
                                                    <td>1222</td>
                                                    <td><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="42302b212a23302620302d20313602252f232b2e6c212d2f">[email&#160;protected]</a></td>
                                                    <td>2 abc</td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-success-light mr-2">Staff</a> </div>
                                                    </td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-danger-light mr-2">Không hoạt động</a> </div>
                                                    </td>
                                                    <td class="text-right">
                                                        <div class="dropdown dropdown-action"> <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v ellipse_color"></i></a>
                                                            <div class="dropdown-menu dropdown-menu-right"> <a class="dropdown-item" href="edit-staff.html"><i class="fas fa-pencil-alt m-r-5"></i> Edit</a> <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_asset"><i class="fas fa-trash-alt m-r-5"></i> Delete</a> </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>ST-003</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.html" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/profiles/avatar-05.jpg" alt="User Image"></a>
                                                            <a href="profile.html">Ellen Thill <span>#0001</span></a>
                                                        </h2>
                                                    </td>
                                                    <td>ST-003</td>
                                                    <td><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="04616868616a706c6d6868446369656d682a676b69">[email&#160;protected]</a></td>
                                                    <td>2 abc</td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-success-light mr-2">Staff</a> </div>
                                                    </td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-success-light mr-2">Đang hoạt động</a> </div>
                                                    </td>
                                                    <td class="text-right">
                                                        <div class="dropdown dropdown-action"> <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v ellipse_color"></i></a>
                                                            <div class="dropdown-menu dropdown-menu-right"> <a class="dropdown-item" href="edit-staff.html"><i class="fas fa-pencil-alt m-r-5"></i> Edit</a> <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_asset"><i class="fas fa-trash-alt m-r-5"></i> Delete</a> </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>ST-004</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.html" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/profiles/avatar-06.jpg" alt="User Image"></a>
                                                            <a href="profile.html">Corina Kelsey <span>#0001</span></a>
                                                        </h2>
                                                    </td>
                                                    <td>262-260-1170</td>
                                                    <td><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="c9aaa6bba0a7a8a2aca5baacb089aea4a8a0a5e7aaa6a4">[email&#160;protected]</a></td>

                                                    <td>2 abc</td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-success-light mr-2">Staff</a> </div>
                                                    </td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-success-light mr-2">Đang hoạt động</a> </div>
                                                    </td>
                                                    <td class="text-right">
                                                        <div class="dropdown dropdown-action"> <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v ellipse_color"></i></a>
                                                            <div class="dropdown-menu dropdown-menu-right"> <a class="dropdown-item" href="edit-staff.html"><i class="fas fa-pencil-alt m-r-5"></i> Edit</a> <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_asset"><i class="fas fa-trash-alt m-r-5"></i> Delete</a> </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>ST-005</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.html" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/profiles/avatar-07.jpg" alt="User Image"></a>
                                                            <a href="profile.html">Carolyn Lane <span>#0001</span></a>
                                                        </h2>
                                                    </td>
                                                    <td>ST-005</td>
                                                    <td><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="95f6f4e7faf9ecfbf9f4fbf0d5f2f8f4fcf9bbf6faf8">[email&#160;protected]</a></td>
                                                    <td>2 abc</td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-success-light mr-2">Staff</a> </div>
                                                    </td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-success-light mr-2">Đang hoạt động</a> </div>
                                                    </td>
                                                    <td class="text-right">
                                                        <div class="dropdown dropdown-action"> <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v ellipse_color"></i></a>
                                                            <div class="dropdown-menu dropdown-menu-right"> <a class="dropdown-item" href="edit-staff.html"><i class="fas fa-pencil-alt m-r-5"></i> Edit</a> <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_asset"><i class="fas fa-trash-alt m-r-5"></i> Delete</a> </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>ST-006</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.html" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/profiles/avatar-08.jpg" alt="User Image"></a>
                                                            <a href="profile.html">David Alvarez <span>#0001</span></a>
                                                        </h2>
                                                    </td>
                                                    <td>ST-006</td>
                                                    <td><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="badedbccd3dedbd6ccdbc8dfc0faddd7dbd3d694d9d5d7">[email&#160;protected]</a></td>
                                                    <td>2 abc</td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-success-light mr-2">Staff</a> </div>
                                                    </td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-danger-light mr-2">Không hoạt động</a> </div>
                                                    </td>
                                                    <td class="text-right">
                                                        <div class="dropdown dropdown-action"> <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v ellipse_color"></i></a>
                                                            <div class="dropdown-menu dropdown-menu-right"> <a class="dropdown-item" href="edit-staff.html"><i class="fas fa-pencil-alt m-r-5"></i> Edit</a> <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_asset"><i class="fas fa-trash-alt m-r-5"></i> Delete</a> </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>ST-001</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.html" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/profiles/avatar-03.jpg" alt="User Image"></a>
                                                            <a href="profile.html">Tommy Bernal <span>#0001</span></a>
                                                        </h2>
                                                    </td>
                                                    <td>001</td>
                                                    <td><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="ea9e85878793888f98848b86aa8d878b8386c4898587">[email&#160;protected]</a></td>

                                                    <td>2 abc</td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-success-light mr-2">Staff</a> </div>
                                                    </td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-success-light mr-2">Đang hoạt động</a> </div>
                                                    </td>
                                                    <td class="text-right">
                                                        <div class="dropdown dropdown-action"> <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v ellipse_color"></i></a>
                                                            <div class="dropdown-menu dropdown-menu-right"> <a class="dropdown-item" href="edit-staff.html"><i class="fas fa-pencil-alt m-r-5"></i> Sửa</a> <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_asset"><i class="fas fa-trash-alt m-r-5"></i> Delete</a> </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>ST-002</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.html" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/profiles/avatar-04.jpg" alt="User Image"></a>
                                                            <a href="profile.html">Richard Brobst <span>#0001</span></a>
                                                        </h2>
                                                    </td>
                                                    <td>1222</td>
                                                    <td><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="42302b212a23302620302d20313602252f232b2e6c212d2f">[email&#160;protected]</a></td>
                                                    <td>2 abc</td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-success-light mr-2">Staff</a> </div>
                                                    </td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-danger-light mr-2">Không hoạt động</a> </div>
                                                    </td>
                                                    <td class="text-right">
                                                        <div class="dropdown dropdown-action"> <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v ellipse_color"></i></a>
                                                            <div class="dropdown-menu dropdown-menu-right"> <a class="dropdown-item" href="edit-staff.html"><i class="fas fa-pencil-alt m-r-5"></i> Edit</a> <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_asset"><i class="fas fa-trash-alt m-r-5"></i> Delete</a> </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>ST-003</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.html" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/profiles/avatar-05.jpg" alt="User Image"></a>
                                                            <a href="profile.html">Ellen Thill <span>#0001</span></a>
                                                        </h2>
                                                    </td>
                                                    <td>ST-003</td>
                                                    <td><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="04616868616a706c6d6868446369656d682a676b69">[email&#160;protected]</a></td>
                                                    <td>2 abc</td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-success-light mr-2">Staff</a> </div>
                                                    </td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-success-light mr-2">Đang hoạt động</a> </div>
                                                    </td>
                                                    <td class="text-right">
                                                        <div class="dropdown dropdown-action"> <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v ellipse_color"></i></a>
                                                            <div class="dropdown-menu dropdown-menu-right"> <a class="dropdown-item" href="edit-staff.html"><i class="fas fa-pencil-alt m-r-5"></i> Edit</a> <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_asset"><i class="fas fa-trash-alt m-r-5"></i> Delete</a> </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>ST-004</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.html" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/profiles/avatar-06.jpg" alt="User Image"></a>
                                                            <a href="profile.html">Corina Kelsey <span>#0001</span></a>
                                                        </h2>
                                                    </td>
                                                    <td>262-260-1170</td>
                                                    <td><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="c9aaa6bba0a7a8a2aca5baacb089aea4a8a0a5e7aaa6a4">[email&#160;protected]</a></td>

                                                    <td>2 abc</td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-success-light mr-2">Staff</a> </div>
                                                    </td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-success-light mr-2">Đang hoạt động</a> </div>
                                                    </td>
                                                    <td class="text-right">
                                                        <div class="dropdown dropdown-action"> <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v ellipse_color"></i></a>
                                                            <div class="dropdown-menu dropdown-menu-right"> <a class="dropdown-item" href="edit-staff.html"><i class="fas fa-pencil-alt m-r-5"></i> Edit</a> <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_asset"><i class="fas fa-trash-alt m-r-5"></i> Delete</a> </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>ST-005</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.html" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/profiles/avatar-07.jpg" alt="User Image"></a>
                                                            <a href="profile.html">Carolyn Lane <span>#0001</span></a>
                                                        </h2>
                                                    </td>
                                                    <td>ST-005</td>
                                                    <td><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="95f6f4e7faf9ecfbf9f4fbf0d5f2f8f4fcf9bbf6faf8">[email&#160;protected]</a></td>
                                                    <td>2 abc</td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-success-light mr-2">Staff</a> </div>
                                                    </td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-success-light mr-2">Đang hoạt động</a> </div>
                                                    </td>
                                                    <td class="text-right">
                                                        <div class="dropdown dropdown-action"> <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v ellipse_color"></i></a>
                                                            <div class="dropdown-menu dropdown-menu-right"> <a class="dropdown-item" href="edit-staff.html"><i class="fas fa-pencil-alt m-r-5"></i> Edit</a> <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_asset"><i class="fas fa-trash-alt m-r-5"></i> Delete</a> </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>ST-006</td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a href="profile.html" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/profiles/avatar-08.jpg" alt="User Image"></a>
                                                            <a href="profile.html">David Alvarez <span>#0001</span></a>
                                                        </h2>
                                                    </td>
                                                    <td>ST-006</td>
                                                    <td><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="badedbccd3dedbd6ccdbc8dfc0faddd7dbd3d694d9d5d7">[email&#160;protected]</a></td>
                                                    <td>2 abc</td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-success-light mr-2">Staff</a> </div>
                                                    </td>
                                                    <td>
                                                        <div class="actions"> <a href="#" class="btn btn-sm bg-danger-light mr-2">Không hoạt động</a> </div>
                                                    </td>
                                                    <td class="text-right">
                                                        <div class="dropdown dropdown-action"> <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v ellipse_color"></i></a>
                                                            <div class="dropdown-menu dropdown-menu-right"> <a class="dropdown-item" href="edit-staff.html"><i class="fas fa-pencil-alt m-r-5"></i> Edit</a> <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_asset"><i class="fas fa-trash-alt m-r-5"></i> Delete</a> </div>
                                                        </div>
                                                    </td>
                                                </tr>
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
