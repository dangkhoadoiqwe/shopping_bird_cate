<%-- 
    Document   : allBoking
    Created on : 30-09-2023, 18:50:39
    Author     : Quang
--%>

<%@page import="java.util.List"%>
<%@page import="DAO.MaterialDao"%>
<%@page import="DTO.Material"%>
<%@page import="DTO.BookingRequest"%>
<%@page import="DAO.BookingDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
﻿<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Hotel Dashboard Template</title>
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/datatables/datatables.min.css">
        <link rel="stylesheet" href="assets/css/feathericon.min.css">
        <link rel="stylesheet" href="assets/plugins/morris/morris.css">
        <link rel="stylesheet" href="assets/css/style.css"> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>

    <body>  
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
                                    <h6>${account.getName()}</h6>
                                    <p class="text-muted mb-0">Administrator</p>
                                </div>
                            </div>   <a class="dropdown-item" href="MainController?action=LOGOUT">Logout</a> </div>
                    </li>
                </ul>
            </div>
            <div class="sidebar" id="sidebar">
                <div class="sidebar-inner slimscroll">
                    <div id="sidebar-menu" class="sidebar-menu">
                        <ul>
                            <li> <a href=" MainController?action=DASH"><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a> </li>
                            <li class="list-divider"></li>
                            <li> <a href="MainController?action=ALLBOOKING"><i class="fas fa-suitcase"></i> <span>Bookings</span></a></li>                  
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
                                    <h4 class="card-title float-left mt-2">Danh sách đơn đặt hàng</h4>
                                    <!--<a href="add-booking.html" class="btn btn-primary float-right veiwbutton ">Add Booking</a>-->
                                </div>
                            </div>
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
                                                    <th>Mã đơn hàng</th>
                                                    <th>Tên khách hàng</th>
                                                    <th>Email</th>
                                                    <th>Địa chỉ</th>
                                                    <th>Số điện thoại</th>
                                                    <th>Ngày gửi đơn</th>
                                                    <th>chất liệu</th>
                                                    <th>số lượng</th>
                                                    <th>Màu sắc</th>
                                                    <th>Kích thước</th>
                                                    <th>loài chim</th>
                                                    <th>Tổng giá</th>
                                                    <th>Ghi chú</th>
                                                    <th>Trạng thái</th>
                                                    <th class="text-right">Chức năng</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${listBooking}" var="booking">
                                                    <tr>
                                                        <td>${booking.getBookingRequestId()}</td>                                                          
                                                        <td>
                                                            <h2 class="table-avatar">
                                                                <a href="#" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/profiles/avatar-03.jpg" alt="User Image"></a>
                                                                <a href="#">${booking.getAccount().getName()}</a>
                                                            </h2>
                                                        </td>
                                                        <td>${booking.getAccount().getEmail()}</td>
                                                        <td>${booking.getCusAddress()}</td>
                                                        <td>${booking.getCusPhone()}</td>
                                                        <td>${booking.getCreateTime()}</td>
                                                        <td>${booking.getMaterial().getId() != 4 ? booking.getMaterial().getName() : booking.getMaterialCustom()}</td>
                                                        <td>${booking.getQuantity()}</td>
                                                        <td>${booking.getColor()}</td>
                                                        <td>${booking.getSize()}</td>
                                                        <td>${booking.getBirdType()}</td>
                                                        <td>${booking.getSubtotal()} VND</td>
                                                        <td>${booking.getNote()} </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${booking.getStatus() == 1}">
                                                                    chưa duyệt
                                                                </c:when>
                                                                <c:when test="${booking.getStatus() == 3}">
                                                                    đã cọc 
                                                                </c:when>
                                                                <c:otherwise>
                                                                    Chờ thanh toán
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                <div class="modal fade" id="edit_booking_${booking.getBookingRequestId()}" aria-hidden="true" role="dialog">
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title">Cập nhật đơn hàng</h5>
                                                                <button type="button" id="close" class="close" onclick="clearContentText()" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
                                                            </div>
                                                            <div class="modal-body">                                
                                                                <form action="MainController">
                                                                    <input type="hidden" name="bookingId" value="${booking.getBookingRequestId()}">
                                                                    <div class="form-group">
                                                                        <label id="show_${booking.getBookingRequestId()}"></label>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label>Tên khách hàng: </label>
                                                                        <input class="form-control" type="text" id="ten" name="cusName" value="${booking.getAccount().getName()}" readonly="">                                    
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label>Email: </label>
                                                                        <input class="form-control" type="text" id="email" name="cusEmail" value="${booking.getAccount().getEmail()}" readonly="">                                    
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label>Số lượng: </label>
                                                                        <input class="form-control" type="text" id="soluong" name="quantity" value="${booking.getQuantity()}">                                    
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label>Màu sắc: </label>
                                                                        <select id="selectColor_${booking.getBookingRequestId()}" name="selectColor" onchange="showInputColor(${booking.getBookingRequestId()})">
                                                                            <option>Đen</option>
                                                                            <option>Đỏ</option>
                                                                            <option>Xanh Dương</option>
                                                                            <option>Xanh Lá</option>
                                                                            <option>Hồng</option>
                                                                            <option>Khác</option>
                                                                        </select>
                                                                        <input style="display: none" class="form-control" type="text" placeholder="Nhập màu" id="customColor_${booking.getBookingRequestId()}" name="customColor" value="${booking.getMaterialCustom()}">                                    
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label>Kích thước: </label>
                                                                        <select id="selectSize_${booking.getBookingRequestId()}" name="selectSize" onchange="showInputSize(${booking.getBookingRequestId()})">
                                                                            <option>Nhỏ (Dài, rộng, cao khoảng 18 inch (45cm) hoặc nhỏ hơn)</option>
                                                                            <option>Trung bình (Dài, rộng, cao khoảng 24 đến 36 inch (61 đến 91 cm)</option>
                                                                            <option>Lớn (Dài, rộng, cao khoảng 36 inch đổ lên(91cm đổ lên)</option>
                                                                            <option>Khác</option>                                                                           
                                                                        </select>        
                                                                        <input style="display: none" class="form-control" type="text" id="customSize_${booking.getBookingRequestId()}" placeholder="Nhập kích thước" name="customColor" value="${booking.getMaterialCustom()}">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label>Loài chim: </label>
                                                                        <select name="selectBirdType" id="selectBird_${booking.getBookingRequestId()}" onchange="showInputBird(${booking.getBookingRequestId()})">
                                                                            <option>Chào mào</option>
                                                                            <option>Sơn ca</option>
                                                                            <option>Cu gáy</option>
                                                                            <option>Khác</option>
                                                                        </select>
                                                                        <input class="form-control" type="text" id="customBirdType_${booking.getBookingRequestId()}" placeholder="Nhập loài chim" name="customBirdType" value="${booking.getBirdType()}">                                    
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label>Vật liệu: </label>
                                                                        <select id="selectMaterial_${booking.getBookingRequestId()}" name="selectMaterial" onchange="showInputMaterial(${booking.getBookingRequestId()})">
                                                                            <%
                                                                                MaterialDao materialDao = new MaterialDao();
                                                                                List<Material> list = materialDao.listMaterials();
                                                                                for (Material mt : list) {
                                                                            %>
                                                                            <option value="<%= mt.getId()%>"><%= mt.getName()%></option>
                                                                            <%
                                                                                }
                                                                            %>   
                                                                        </select>    
                                                                        <input id="inputMaterial_${booking.getBookingRequestId()}" class="form-control" type="text" placeholder="Nhập vật liệu" name="materialCustomName" style="display: none;">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label>Địa chỉ:</label> 
                                                                        <div>
                                                                            <input type="text" name="address" class="form-control" value="${booking.getCusAddress()}" 
                                                                                   placeholder="Tỉnh/ Thành phố, Quận/Huyện, Phường/Xã, Đường" required="">
                                                                        </div>
                                                                    </div>   
                                                                    <div class="form-group">
                                                                        <label >Hình ảnh lồng(Nếu có) :</label>
                                                                        <button type="button" onclick="document.getElementById('input-img2_${booking.getBookingRequestId()}').click()">Upload</button>
                                                                        <div>
                                                                            <label for="input-img2" class="preview">
                                                                                <img class="tournament-img" id="previewImg2_${booking.getBookingRequestId()}" src="${booking.getImage()}" style="width: 100px; height: 100px;">
                                                                            </label>
                                                                            <input type="file" hidden id="input-img2_${booking.getBookingRequestId()}" oninput="inputImage(${booking.getBookingRequestId()})" name="image" />
                                                                        </div>
                                                                    </div> 
                                                                    <div class="form-group">
                                                                        <label>Ghi chú: </label>
                                                                        <input class="form-control" type="text" id="note" name="note" value="${booking.getNote()}">                                    
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label>Trạng thái: </label>
                                                                        <select id="selectStatus_${booking.getBookingRequestId()}" name="status">
                                                                            <option value="0">Chưa có giá tổng</option>
                                                                            <option value="1">Chờ thanh toán</option>
                                                                            <option value="2">Đã cọc</option>
                                                                        </select>                             
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label>Giá lúc đặt đơn:</label>
                                                                        <input class="form-control" type="number" id="subtotal_${booking.getBookingRequestId()}" name="subtotal" value="${booking.getSubtotal()}">VND
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label>Tổng giá</label>
                                                                        <input class="form-control" type="number" name="total" id="total_${booking.getBookingRequestId()}" oninput="setTotalValue(this,${booking.getBookingRequestId()})" value="${booking.getTotal()}" required> VND
                                                                    </div>
                                                                    <div class="row form-row">
                                                                        <div class="col-12 col-sm-6">
                                                                            <div class="form-group">
                                                                            </div>                                                                
                                                                        </div>
                                                                    </div>
                                                                    <button type="submit" class="btn btn-primary btn-block"  name="action" value="UPDATE_BOOKING" onclick="isHaveTotal(event, ${booking.getBookingRequestId()})">Cập nhật</button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <td class="text-right">
                                                    <div class="dropdown dropdown-action"> <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v ellipse_color"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right"> 
                                                            <a class="dropdown-item" data-toggle="modal" data-bookingId="${booking.getBookingRequestId()}" 
                                                               onclick="setValue(${booking.getBookingRequestId()}, '${booking.getColor()}', ${booking.getMaterial().getId()}, ${booking.getStatus()}, '${booking.getSize()}', '${booking.getBirdType()}',
                                                                               '${booking.getMaterialCustom()}')" 
                                                               data-target="#edit_booking_${booking.getBookingRequestId()}">
                                                                <i class="fas fa-pencil-alt m-r-5"></i> Sửa
                                                            </a>
                                                            <a class="dropdown-item" data-toggle="modal" data-target="#delete_asset"><i class="fas fa-trash-alt m-r-5"></i> Xóa</a> 
                                                        </div>
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

                <!--popup edit booking-->           

                <div id="delete_asset" class="modal fade delete-modal" role="dialog">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body text-center"> <img src="assets/img/sent.png" alt="" width="50" height="46">
                                <h3 class="delete_class">Are you sure want to delete this Asset?</h3>
                                <div class="m-t-20"> <a href="#" class="btn btn-white" data-dismiss="modal">Close</a>
                                    <button type="submit" class="btn btn-danger">Delete</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            var total;
            var subtotalInput;
            function isHaveTotal(event, bookingId) {
                total = document.getElementById("total_" + bookingId);
                subtotalInput = document.getElementById("subtotal_" + bookingId);
                if (total.value <= 0) {
                    window.alert("Bạn chưa nhập giá tổng cho đơn!");
                    event.preventDefault();
                } else if (total.value < subtotalInput.value) {
                    window.alert("Giá phải lớn hơn giá giá lúc đặt đơn!");
                    event.preventDefault();
                }
            }

            function setTotalValue(input, bookingId) {
                total = document.getElementById("total_" + bookingId);
                total = input.value;
                console.log(total);
            }

            function inputImage(bookingId) {
                const fileInput2 = document.getElementById('input-img2_' + bookingId);
                const previewImg2 = document.getElementById('previewImg2_' + bookingId);
                fileInput2.addEventListener('change', function () {
                    if (fileInput2.files && fileInput2.files[0]) {
                        const reader = new FileReader();
                        reader.addEventListener('load', function (e) {
                            previewImg2.src = e.target.result;
                        });
                        reader.readAsDataURL(fileInput2.files[0]);
                    }
                });
            }
            function setValue(bookingId, color, material, status, size, bird, customMaterialName) {
                var selectColor = document.getElementById("selectColor_" + bookingId);
                for (var i = 0; i < selectColor.options.length; i++) {
                    if (selectColor.options[i].value === color) {
                        selectColor.options[i].selected = true;
                    } else {
                        selectColor.options[selectColor.options.length - 1].selected = true;
                    }
                }
                var inputCustomColor = document.getElementById("customColor_" + bookingId);
                if (selectColor.value === "Khác") {
                    inputCustomColor.value = color;
                    inputCustomColor.style.display = "block";
                } else {
                    inputCustomColor.style.display = "none";
                }


                var selectStatus = document.getElementById("selectStatus_" + bookingId);
                selectStatus.value = status;
                //Set mã đơn hàng
                var id = document.getElementById("show_" + bookingId);
                id.innerHTML = "Mã đơn hàng: " + bookingId;
                //========================================================================
                //Set Size
                var selectSize = document.getElementById("selectSize_" + bookingId);
                for (var i = 0; i < selectSize.options.length; i++) {
                    if (selectSize.options[i].value === size) {
                        selectSize.options[i].selected = true;
                        break;
                    } else {
                        selectSize.options[selectSize.options.length - 1].selected = true;
                    }
                }
                var input = document.getElementById("customSize_" + bookingId);
                if (selectSize.value === "Khác") {
                    input.value = size;
                    input.style.display = "block";
                } else {
                    input.style.display = "none";
                }
                //============================================================================
                ///set bird
                var selectBirdType = document.getElementById("selectBird_" + bookingId);
                for (var i = 0; i < selectBirdType.options.length; i++) {
                    if (selectBirdType.options[i].value === bird) {
                        selectBirdType.options[i].selected = true;
                        break;
                    } else {
                        selectBirdType.options[selectBirdType.options.length - 1].selected = true;
                    }
                }
                var input = document.getElementById("customBirdType_" + bookingId);
                if (selectBirdType.value === "Khác") {
                    input.value = bird;
                    input.style.display = "block";
                } else {
                    input.style.display = "none";
                }
                //================================================================================          
                //set vật liệu
                var selectMaterial = document.getElementById("selectMaterial_" + bookingId);
                for (var i = 0; i < selectMaterial.options.length; i++) {
                    if (parseInt(selectMaterial.options[i].value) === parseInt(material)) {
                        selectMaterial.options[i].selected = true;
                        break;
                    } else {
                        selectMaterial.options[selectMaterial.options.length - 1].selected = true;
                    }
                }
                var input = document.getElementById("inputMaterial_" + bookingId);
                if (parseInt(selectMaterial.value) === 4) {
                    input.value = customMaterialName;
                    input.style.display = "block";
                } else {
                    input.style.display = "none";
                }
                //================================================================================
            }
            function clearContentText() {
                var id = document.getElementById("id");
                id.innerHTML = "Mã đơn hàng: ";
            }
            function showInputMaterial(bookingId) {
                var select = document.getElementById("selectMaterial_" + bookingId);
                var input = document.getElementById("inputMaterial_" + bookingId);
                if (select.value === "4") {
                    input.style.display = "block";
                } else {
                    input.style.display = "none";
                }
            }

            function showInputColor(bookingId) {
                var select = document.getElementById("selectColor_" + bookingId);
                var input = document.getElementById("customColor_" + bookingId);
                if (select.value === "Khác") {
                    input.style.display = "block";
                } else {
                    input.style.display = "none";
                }
            }
            function showInputSize(bookingId) {
                var select = document.getElementById("selectSize_" + bookingId);
                var input = document.getElementById("customSize_" + bookingId);
                if (select.value === "Khác") {
                    input.style.display = "block";
                } else {
                    input.style.display = "none";
                }
            }
            function showInputBird(bookingId) {
                var select = document.getElementById("selectBird_" + bookingId);
                var input = document.getElementById("customBirdType_" + bookingId);
                if (select.value === "Khác") {
                    input.value = "";
                    input.style.display = "block";
                } else {
                    input.style.display = "none";
                }
            }

            window.onload = function () {
                var msg = '<%= request.getAttribute("msg")%>';
                console.log(msg);
                if (msg && msg.toLowerCase().trim() != "null") {
                    window.alert(msg);
                }
            };

        </script>
        <script data-cfasync="false" src="../../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="assets/js/jquery-3.5.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="assets/plugins/datatables/datatables.min.js"></script>
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/plugins/raphael/raphael.min.js"></script>
        <script src="assets/js/script.js"></script>
    </body>

</html>