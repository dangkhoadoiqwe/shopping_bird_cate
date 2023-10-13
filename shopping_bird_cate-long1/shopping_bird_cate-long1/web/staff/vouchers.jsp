<%-- 
    Document   : vouchers
    Created on : Oct 2, 2023, 4:13:07 AM
    Author     : hailo
--%>

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
                            </div> <a class="dropdown-item" href="profile.html">My Profile</a> <a class="dropdown-item" href="settings.html">Account Settings</a> <a class="dropdown-item" href="login.html">Logout</a> </div>
                    </li>
                </ul>
            </div>
            <div class="sidebar" id="sidebar">
                <div class="sidebar-inner slimscroll">
                    <div id="sidebar-menu" class="sidebar-menu">
                        <ul>
                            <li class="active"> <a href="products.jsp"><i class="fas fa-cube"></i> <span>Sản phẩm</span></a> </li>
                            <li class="active"> <a href="orders.jsp"><i class="fas fa-cube"></i> <span>Đơn đặt hàng</span></a> </li>
                            <li class="active"> <a href="vouchers.jsp"><i class="fas fa-cube"></i> <span>Vouchers</span></a> </li>
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
                                    <a href="create-invoice.html" class="btn btn-primary float-right veiwbutton">Thêm voucher</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <form>
                                <div class="row formtype">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Từ ngày</label>
                                            <div class="cal-icon">
                                                <input type="text" class="form-control datetimepicker">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Đến ngày</label>
                                            <div class="cal-icon">
                                                <input type="text" class="form-control datetimepicker">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Loại voucher</label>
                                            <select class="form-control" id="sel1" name="sellist1">
                                                <option>Lựa chọn</option>
                                                <option>Miễn phí vận chuyển</option>
                                                <option>Giảm giá cố định</option>
                                                <option>Giảm giá theo %</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Tìm kiếm</label>
                                            <a href="#" class="btn btn-success btn-block mt-0 search_button"> Tìm kiếm </a>
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
                                                    <th>Mã voucher</th>
                                                    <!--<th>Tên voucher</th>-->
                                                    <th>Số lượng</th>
                                                    <th>Ngày khởi tạo</th>
                                                    <th>Ngày hết hạn</th>
                                                    <th>Loại voucher</th>
                                                    <th>Mức giảm giá</th>
                                                    <th>Khách sở hữu</th>
                                                    <th class="text-right">Chức năng</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>#INV-0001</td>
                                                    <td>20</td>
                                                    <td>03-05-2023</td>
                                                    <td>04-07-2023</td>
                                                    <td>Giảm giá cố định</td>
                                                    <td>10.000</td>
                                                    <td>                         
                                                        <div>
                                                            <a data-toggle="modal" href="#edit_vouher">Click để xem</a>
                                                        </div>                                                   
                                                        <div class="modal fade" id="edit_vouher" aria-hidden="true" role="dialog" style="padding-right: 300px;">
                                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                                <div class="modal-content" style="width: 1000px;">
                                                                    <div class="modal-header" style="width: 1000px;">
                                                                        <h5 class="modal-title">Khách sở hữu</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
                                                                    </div>
                                                                    <div class="modal-body" style="width: 1000px;">
                                                                        <div class="row">
                                                                            <div class="col-lg-12">
                                                                                <form>
                                                                                    <div class="row formtype">                     
                                                                                        <div class="col-md-6">
                                                                                            <div class="form-group">
                                                                                                <label>Loại voucher</label>
                                                                                                <select class="form-control" id="sel1" name="sellist1">
                                                                                                    <option>Lựa chọn</option>
                                                                                                    <option>Đã sử dụng</option>
                                                                                                    <option>Chưa sử dụng</option>
                                                                                                    <option>Hết hạn</option>
                                                                                                </select>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-md-6">
                                                                                            <div class="form-group">
                                                                                                <label>Tìm kiếm</label>
                                                                                                <a href="#" class="btn btn-success btn-block mt-0 search_button"> Tìm kiếm </a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </form>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="modal-content" style="width: 1000px;">
                                                                        <div class="card card-table">
                                                                            <div class="card-body booking_card">
                                                                                <div class="table-responsive">
                                                                                    <table class="datatable table table-stripped table table-hover table-center mb-0">
                                                                                        <thead>
                                                                                            <tr>
                                                                                                <th>Tên khách hàng</th>
                                                                                                <th>Ngày nhận voucher</th>
                                                                                                <th>Trạng thái</th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <h2 class="table-avatar">
                                                                                                        <a href="profile.html" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/profiles/avatar-03.jpg" alt="User Image"></a>
                                                                                                        <a href="profile.html">Tommy Bernal <span>#0001</span></a>
                                                                                                    </h2>
                                                                                                </td>
                                                                                                <td>12/09/2022</td>
                                                                                                <td>Đã sử dụng</td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <h2 class="table-avatar">
                                                                                                        <a href="profile.html" class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="assets/img/profiles/avatar-04.jpg" alt="User Image"></a>
                                                                                                        <a href="profile.html">Richard Brobst <span>#0002</span></a>
                                                                                                    </h2>
                                                                                                </td>
                                                                                                <td>10/05/2023</td>
                                                                                                <td>Chưa sử dụng</td>
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
                                                    </td>
                                                    <td class="text-right">
                                                        <div class="dropdown dropdown-action">
                                                            <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v ellipse_color"></i></a>
                                                            <div class="dropdown-menu dropdown-menu-right">
                                                                <a class="dropdown-item" href="edit-invoice.html"><i class="fas fa-pencil-alt m-r-5"></i> Sửa</a>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>#INV-0002</td>
                                                    <td>20</td>
                                                    <td>03-06-2023</td>
                                                    <td>04-07-2023</td>
                                                    <td>Giảm giá theo %</td>
                                                    <td>20%</td>
                                                    <td>
                                                        <div>
                                                            <a data-toggle="modal" href="#edit_vouher">Click để xem</a>
                                                        </div> 
                                                    </td>
                                                    <td class="text-right">
                                                        <div class="dropdown dropdown-action">
                                                            <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v ellipse_color"></i></a>
                                                            <div class="dropdown-menu dropdown-menu-right">
                                                                <a class="dropdown-item" href="edit-invoice.html"><i class="fas fa-pencil-alt m-r-5"></i> Edit</a>
                                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_asset"><i class="fas fa-trash-alt m-r-5"></i> Delete</a>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>#INV-0003</td>
                                                    <td>20</td>
                                                    <td>03-08-2023</td>
                                                    <td>04-09-2023</td>
                                                    <td>Miễn phí vận chuyển</td>
                                                    <td></td>
                                                    <td>
                                                        <div>
                                                            <a data-toggle="modal" href="#edit_vouher">Click để xem</a>
                                                        </div> 
                                                    </td>
                                                    <td class="text-right">
                                                        <div class="dropdown dropdown-action">
                                                            <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v ellipse_color"></i></a>
                                                            <div class="dropdown-menu dropdown-menu-right">
                                                                <a class="dropdown-item" href="edit-invoice.html"><i class="fas fa-pencil-alt m-r-5"></i> Edit</a>
                                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_asset"><i class="fas fa-trash-alt m-r-5"></i> Delete</a>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>#INV-0004</td>
                                                    <td>20</td>
                                                    <td>03-05-2023</td>
                                                    <td>04-07-2023</td>
                                                    <td>Giảm giá theo %</td>
                                                    <td>10%</td>
                                                    <td>
                                                        <div>
                                                            <a data-toggle="modal" href="#edit_vouher">Click để xem</a>
                                                        </div> 
                                                    </td>
                                                    <td class="text-right">
                                                        <div class="dropdown dropdown-action">
                                                            <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v ellipse_color"></i></a>
                                                            <div class="dropdown-menu dropdown-menu-right">
                                                                <a class="dropdown-item" href="edit-invoice.html"><i class="fas fa-pencil-alt m-r-5"></i> Edit</a>
                                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_asset"><i class="fas fa-trash-alt m-r-5"></i> Delete</a>
                                                            </div>
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
</body>
</html>
