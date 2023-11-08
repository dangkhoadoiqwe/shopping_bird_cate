<%-- 
    Document   : orders
    Created on : Oct 1, 2023, 10:35:41 PM
    Author     : hailo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="shortcut icon" type="image/x-icon" href="admin-staff/assets/img/favicon.png">
        <link rel="stylesheet" href="admin-staff/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="admin-staff/assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="admin-staff/assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="admin-staff/assets/css/feathericon.min.css">
        <link rel="stylehseet" href="https://cdn.oesmith.co.uk/morris-0.5.1.css">
        <link rel="stylesheet" href="admin-staff/assets/plugins/morris/morris.css">
        <link rel="stylesheet" href="admin-staff/assets/css/style.css">
        <link rel="stylesheet" href="admin-staff/assets/css/myStyle.css">
    </head>
    <body>
        <div class="main-wrapper">
            <div class="header">
                <div class="header-left">
                    <a href="index.html" class="logo"> <img src="admin-staff/assets/img/hotel_logo.png" width="50" height="70" alt="logo"> <span class="logoclass">FURNI</span> </a>
                    <a href="index.html" class="logo logo-small"> <img src="admin-staff/assets/img/hotel_logo.png" alt="Logo" width="30" height="30"> </a>
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
                                    <!--                                    <li class="notification-message">
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
                                                                        </li>-->
                                </ul>
                            </div>
                            <div class="topnav-dropdown-footer"> <a href="#">View all Notifications</a> </div>
                        </div>
                    </li>
                    <li class="nav-item dropdown has-arrow">
                        <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown"> <span class="user-img"><img class="rounded-circle" src="admin-staff/assets/img/profiles/avatar-01.jpg" width="31" alt="Soeng Souy"></span> </a>
                        <div class="dropdown-menu">
                            <div class="user-header">
                                <div class="avatar avatar-sm"> <img src="admin-staff/assets/img/profiles/avatar-01.jpg" alt="User Image" class="avatar-img rounded-circle"> </div>
                                <div class="user-text">
                                    <h6>Soeng Souy</h6>
                                    <p class="text-muted mb-0">Staff</p>
                                </div>
                            </div> <a class="dropdown-item" href="profile.html">My Profile</a> <a class="dropdown-item" href="settings.html">Account Settings</a> <a class="dropdown-item" href="MainController?action=logout">Logout</a> </div>
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
                             <li class="active"> <a  href="MainController?action=desgin"><i class="fas fa-cube"></i> <span>Quản lý vẩn chuyển đơn thiết kế </span></a> </li>
                         <li class="list-divider"></li>                        
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
                                    <h4 class="card-title float-left mt-2">Đơn đặt hàng</h4></div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card card-table">
                                <div class="card-body booking_card">
                                    <div class="table-responsive">
                                        <table class="datatable table table-stripped">
                                            <thead>
                                                <tr>
                                                    <th>Mã đơn hàng</th>
                                                    <th>Khách hàng</th>
                                                    <th> Số điện thoại</th> 
                                                    <th>Ngày đặt hàng</th>
                                                    <th>Tiền giao hàng</th>
                                                    <th>Tổng giá</th>
                                                    <th>Trạng thái đơn</th>
                                                    <th>Xác nhận </th>
                                                    <th>Hủy Đơn </th>
                                                </tr>
                                            </thead>
                                            <c:forEach var="c" items="${orders}">
                                                <tr>
                                                    <td>${c.getId()}</td>
                                                    <td>${c.getName()}</td>
                                                    <td>${c.getCusPhone()}</td>
                                                    <td>${c.getCreateTime()}</td>
                                                    <td>30.000VND</td>
                                                    <td>${c.getTotal() + 30}.000VND</td>
                                                    <td>
                                                        <div class="actions">
                                                            <form id="statusForm" action="updateStatus" method="post">
                                                                <c:choose>
                                                                    <c:when test="${c.getDelivery().getStatus() == 1}">
                                                                        <select name="newStatus" class="btn btn-sm bg-success-light mr-2">
                                                                            <option value="1" selected>Đang xử lí</option>
                                                                            <option value="2">Xác nhận </option>
                                                                        </select>
                                                                    </c:when>
                                                                    <c:when test="${c.getDelivery().getStatus() == 2}">
                                                                        <select name="newStatus" class="btn btn-sm bg-success-light mr-2">
                                                                            <option value="2" selected>Xác nhận</option>
                                                                            <option value="3">Đang giao </option>
                                                                        </select>
                                                                    </c:when>
                                                                    <c:when test="${c.getDelivery().getStatus() == 3}">
                                                                        <select name="newStatus" class="btn btn-sm bg-success-light mr-2">
                                                                            <option value="3" selected>Đang giao</option>
                                                                            <option value="4">Hoàn thành </option>
                                                                        </select>


                                                                    </c:when>
                                                                    <c:when test="${c.getDelivery().getStatus() == 4}">
                                                                        <a  class="btn btn-sm bg-success-light mr-2" value="3" selected>Hoàn thành</a>
                                                                    </c:when>
                                                                </c:choose>
                                                                <input type="hidden" name="cartID" value=" ${c.getDelivery().getId()}">

                                                                <c:choose>
                                                                    <c:when test="${c.getDelivery().getStatus() == 5}">
                                                                        <!-- Trường hợp status == 4, hiển thị thông báo "Đơn đã hủy" -->
                                                                        <td>  <a>Đơn đã hủy</a></td> 
                                                                    </c:when>
                                                                    <c:when test="${c.getDelivery().getStatus() == 4}">
                                                                        <!-- Trường hợp status == 4, hiển thị thông báo "Đơn đã hủy" -->
                                                                        <td> </td>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <!-- Trường hợp khác, hiển thị nút "Cập nhật" -->
                                                                        <td>
                                                                            <button type="submit" class="btn btn-sm bg-success-light mr-2">Cập nhật</button>
                                                                        </td>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </form>
                                                        </div>
                                                    </td>
                                                    
                                                    <td>
                                                        
                                                            <c:if test="${c.getDelivery().getStatus() == 5}">
                                                            
                                                                <button type="button" class="btn btn-sm bg-danger-light mr-2" data-toggle="modal" data-target="#delete_asset_${c.getId()}">

                                                                   Lý do 

                                                                </button>

                                                            </c:if>
                                                       
                                                    </td>
                                                     
                                                </tr>

                                                <!-- Modal -->
                                                <div id="delete_asset_${c.getId()}" class="modal fade delete-modal" role="dialog">
                                                    <div class="modal-dialog modal-dialog-centered">
                                                        <div class="modal-content">

                                                            <div class="modal-body text-center">
                                                               
                                                                <h3 class="delete_class">
                                                                    <c:choose>
                                                                        <c:when test="${c.getNote() == '1'}"> 
                                                                            <p>Chọn nhầm món hàng</p>
                                                                        </c:when>
                                                                             <c:when test="${c.getNote() == '2'}"> 
                                                                            <p>Chọn nhầm địa điểm</p>
                                                                        </c:when>
                                                                             <c:when test="${c.getNote() == '3'}"> 
                                                                            <p>Áp dụng sai voucher</p>
                                                                        </c:when>
                                                                            
                                                                        <c:otherwise>
                                                                             
                                                                            <p>Lý do khác ...</p>
                                                                        </c:otherwise>
                                                                    </c:choose>

                                                                </h3>

                                                                <div class="m-t-20">
                                                                    <a href="#" class="btn btn-white" data-dismiss="modal">Đóng</a>
                                                                        
                                                                    </div>
                                                                </div>
                                                           
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>


                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <script src="admin-staff/assets/js/jquery-3.5.1.min.js"></script>
        <script src="admin-staff/assets/js/popper.min.js"></script>
        <script src="admin-staff/assets/js/bootstrap.min.js"></script>
        <script src="admin-staff/assets/js/moment.min.js"></script>
        <script src="admin-staff/assets/js/select2.min.js"></script>
        <script src="admin-staff/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="admin-staff/assets/js/bootstrap-datetimepicker.min.js"></script>
        <script src="admin-staff/assets/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="admin-staff/assets/plugins/datatables/datatables.min.js"></script>
        <script src="admin-staff/assets/js/script.js"></script>
        <script>
            var cancelOption = document.getElementById("cancelOption");
            var confirmCancelButton = document.getElementById("confirmCancel");

            cancelOption.addEventListener("click", function () {
                // Hiển thị modal khi chọn "Hủy đơn"
                $("#delete_asset").modal("show");
            });

            confirmCancelButton.addEventListener("click", function () {
                // Đặt giá trị của select box thành 4 khi xác nhận "Hủy"
                var statusSelect = document.querySelector('select[name="newStatus"]');
                statusSelect.value = '4';

                // Ẩn modal sau khi xác nhận
                $("#delete_asset").modal("hide");
            });
        </script>
        <script>
            $(function () {
                $('#datetimepicker3').datetimepicker({
                    format: 'LT'
                });
            });
        </script>
        <script>
            // Kiểm tra xem biểu mẫu đã được gửi thành công chưa
            var formSubmitted = false;

            document.getElementById("statusForm").addEventListener("submit", function (event) {
                if (formSubmitted) {
                    // Nếu biểu mẫu đã được gửi thành công trước đó, vô hiệu hóa trường select
                    event.preventDefault();
                } else {
                    // Đánh dấu biểu mẫu đã được gửi thành công
                    formSubmitted = true;
                }
            });
        </script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                document.body.addEventListener('click', function (e) {
                    const target = e.target;

                    // Check if a popup trigger link was clicked
                    if (target.classList.contains('popup-trigger')) {
                        e.preventDefault();
                        const popup = target.nextElementSibling;
                        popup.style.display = 'block';
                    } else if (target.classList.contains('cus-popup-trigger')) {
                        e.preventDefault();
                        const popup = target.nextElementSibling;
                        popup.style.display = 'block';
                    }

                    // Check if a close button was clicked
                    if (target.classList.contains('close-button')) {
                        const popup = target.parentElement;
                        popup.style.display = 'none';
                    }
                });
            });
        </script>
    </body>
</html>
