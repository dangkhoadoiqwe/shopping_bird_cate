<%-- 
Document   : vouchers
Created on : Oct 2, 2023, 4:13:07 AM
Author     : hailo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="assets/css/feathericon.min.css">
        <link rel="stylehseet" href="https://cdn.oesmith.co.uk/morris-0.5.1.css">
        <link rel="stylesheet" href="assets/plugins/morris/morris.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="../css/myStyle.css">
        <style>
                table select {
                width: 100%;
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
                font-size: 14px;
                background-color: #f2f2f2; /* Màu nền của ô select */
            }

            /* Định dạng các nút trong bảng */
            table button {
                border: none;
                background-color: #4CAF50;
                color: white;
                padding: 5px 10px;
                border-radius: 5px;
                cursor: pointer;
                background-color: #007BFF; /* Màu nền của nút */
            }
                table input {
                width: 100%;
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
                font-size: 14px;
                background-color: #f2f2f2; /* Màu nền của ô input */
            }

    /* Tùy chỉnh các trường input */
    input[type="text"],
    input[type="date"] {
        width: 100%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        background-color: #f2f2f2; /* Màu nền của trường input */
    }

    /* Tùy chỉnh màu văn bản */
    input[type="text"]::placeholder,
    input[type="date"]::placeholder {
        color: #555; /* Màu văn bản thay thế */
    }

    /* Tùy chỉnh các nút và liên kết */
    .dropdown-item a {
        color: #007bff; /* Màu văn bản */
        text-decoration: none; /* Loại bỏ gạch chân */
        cursor: pointer;
    }
</style>

    </head>
    <body>
        <div class="main-wrapper">
            <div class="header">
                <div class="header-left">
                    <a href="index.html" class="logo"> <img src="assets/img/hotel_logo.png" width="50" height="70" alt="logo"> <span class="logoclass">FURNI</span> </a>
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
                        <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown"> <span class="user-img"><img class="rounded-circle" src="assets/img/profiles/avatar-01.jpg" width="31" alt="Soeng Souy"></span> </a>
                        <div class="dropdown-menu">
                            <div class="user-header">
                                <div class="avatar avatar-sm"> <img src="assets/img/profiles/avatar-01.jpg" alt="User Image" class="avatar-img rounded-circle"> </div>
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
                                    <h4 class="card-title float-left mt-2">Vouchers</h4>
                                    <a data-toggle="modal" href="#edit_personal_details" href="create-invoice.html" class="btn btn-primary float-right veiwbutton">Thêm voucher</a>
                                </div>
                            </div>
                            <div class="modal fade" id="edit_personal_details" aria-hidden="true" role="dialog">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Thêm sản phẩm </h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="addvoucherstaff" method="post"> 
                                                <div class="col-12-sm-6">
                                                    <div class="form-group"> 
                                                        <label>Tên Voucher </label> <!-- Sửa tại đây -->
                                                        <input type="text" class="form-control" name="voucherName" required="">
                                                    </div>
                                                </div>

                                                <div class="col-12-sm-6">
                                                    <div class="form-group">
                                                        <label>Mức giảm (%):</label> <!-- Sửa tại đây -->
                                                        <input required="" type="number" class="qty-text form-control" id="qty"  min="1" max="100" name="value" value="">
                                                    </div>
                                                </div>

                                                <div class="col-12-sm-6">
                                                    <div class="form-group">
                                                        <label>Từ ngày: </label> <!-- Sửa tại đây -->
                                                        <input type="date"  required=""  name="dateStart"  id="dateStart">
                                                    </div>
                                                </div>

                                                <div class="col-12-sm-6">
                                                    <div class="form-group">
                                                        <label>Đến ngày: </label> <!-- Sửa tại đây -->
                                                        <input type="date" required=""  name="dateEnd" id="dateEnd">
                                                    </div>
                                                </div>
                                                <button type="submit" class="btn btn-sb tn-block">Lưu</button>
                                            </form>
                                        </div>


                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <form action="SearchVouchersServlet" method="post">
                            <div class="row formtype">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Từ ngày</label>
                                        
                                            <input type="date" name="startDate" >
                                        
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Đến ngày</label>
                                         
                                            <input type="date" name="endDate">
                                        
                                    </div>
                                </div>
                              
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Tìm kiếm</label>
                                        <button type="submit" class="btn btn-success btn-block mt-0 search_button"> Tìm kiếm </button>
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
                                                <th>Giá trị sử dụng </th> 
                                                <th>Ngày khởi tạo</th>
                                                <th>Ngày hết hạn</th>
                                                <th>Mã voucher</th>
                                                <th>Mức giảm giá(%)</th>
                                                <th>Chức năng</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="c" items="${vouchers}" >
                                          
                                                <tr>
                                                      <form action="UpdateVoucherServlet" method="post">
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${c.getStatus() == 0}">
                                                                <a  class="btn btn-danger"   selected>Hết  hạn</a>
                                                            </c:when>
                                                            <c:when test="${c.getStatus() == 1}"> 
                                                                <a class="btn btn-success"  selected>Còn hạn</a> 
                                                            </c:when>

                                                        </c:choose>
                                                    </td> 
                                                    <td>
                                                        <input type="date" name="dateStart" value="${c.getDateStart()}" id="dateStart1">
                                                    </td>
                                                    <td>
                                                        <input type="date" name="dateEnd" value="${c.getDateEnd()}" id="dateEnd1">
                                                    </td>
                                                    <td>
                                                        <input type="text" name="voucherName" value="${c.getName()}" >
                                                    </td>
                                                    <td>
                                                        <input type="number" name="value" value="${c.getCode()}" min="1">
                                                    </td>
                                                    <td>       
                                                        <input type="hidden" name ="voucherStatus" value="${c.getStatus()}">
                                                        <input type="hidden" name ="voucherID" value="${c.getId()}">
                                                        <button class="dropdown-item" type="submit">  Sửa</button>
                                                    </td>

</form>
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
    <script src="assets/js/jquery-3.5.1.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/moment.min.js"></script>
    <script src="assets/js/select2.min.js"></script>
    <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
    <script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="assets/plugins/datatables/datatables.min.js"></script>
    <script src="assets/js/script.js"></script>
    <script>
        $(function () {
            $('#datetimepicker3').datetimepicker({
                format: 'LT'
            });
        });
    </script>
    <script>
        document.getElementById('dateStart1').addEventListener('change', function() {
    var dateStart = new Date(this.value);
    var dateEnd = new Date(document.getElementById('dateEnd1').value);
    if (dateStart >= dateEnd) {
        alert('Ngày bắt đầu phải nhỏ hơn ngày kết thúc.');
        this.value = ''; // Xóa ngày bắt đầu nếu không hợp lệ
    }
});

document.getElementById('dateEnd1').addEventListener('change', function() {
    var dateStart = new Date(document.getElementById('dateStart1').value);
    var dateEnd = new Date(this.value);
    if (dateStart >= dateEnd) {
        alert('Ngày kết thúc phải lớn hơn ngày bắt đầu.');
        this.value = ''; // Xóa ngày kết thúc nếu không hợp lệ
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
    <script type="text/javascript">
    document.querySelector('#dateStart').addEventListener('change', function () {
        var startDate = new Date(this.value);
        var endDate = new Date(document.querySelector('#dateEnd').value);

        if (startDate > endDate) {
            alert('Ngày bắt đầu phải nhỏ hơn ngày kết thúc.');
            this.value = ''; // Xóa giá trị ngày bắt đầu
        }
    });

    document.querySelector('#dateEnd').addEventListener('change', function () {
        var startDate = new Date(document.querySelector('#dateStart').value);
        var endDate = new Date(this.value);

        if (endDate < startDate) {
            alert('Ngày kết thúc phải lớn hơn ngày bắt đầu.');
            this.value = ''; // Xóa giá trị ngày kết thúc
        }
    });
</script>

    <script>
// Lấy ngày hiện tại
        var currentDate = new Date();
        var dd = currentDate.getDate();
        var mm = currentDate.getMonth() + 1;
        var yyyy = currentDate.getFullYear();
        if (dd < 10) {
            dd = '0' + dd;
        }
        if (mm < 10) {
            mm = '0' + mm;
        }
        currentDate = yyyy + '-' + mm + '-' + dd;

// Gán ngày hiện tại cho trường nhập ngày
        document.getElementById("dateStart").min = currentDate;

// Xử lý khi trường nhập ngày thay đổi
        document.getElementById("dateStart").addEventListener("change", function () {
            if (this.value < currentDate) {
                alert("Không thể chọn ngày trong quá khứ.");
                this.value = currentDate;
            }
        });
    </script>
</body>
</body>
</html>
