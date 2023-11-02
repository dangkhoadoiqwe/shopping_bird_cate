<%-- 
    Document   : homeStaff
    Created on : Oct 1, 2023, 9:12:49 PM
    Author     : hailo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Hotel Dashboard Template</title>
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/css/feathericon.min.css">
        <link rel="stylesheet" href="assets/plugins/datatables/datatables.min.css">
        <link rel="stylesheet" href="assets/plugins/morris/morris.css">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="assets/css/style.css"> 
        <style>
            /* Định dạng các ô input trong bảng */
            table input {
                width: 100%;
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
                font-size: 14px;
                background-color: #f2f2f2; /* Màu nền của ô input */
            }

            /* Định dạng các ô select trong bảng */
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

            /* Khi rê chuột qua nút */
            table button:hover {
                background-color: #0056b3; /* Màu nền nút khi hover */
            }

        </style>
    </head>

    <body>
        <div class="main-wrapper">
            <div class="header">
                <div class="header-left">
              <a href="#" class="logo"> <img src="admin-staff/assets/img/hotel_logo.png" width="50" height="70" alt="logo"> <span class="logoclass">FURNI</span> </a>
                    <a href="#" class="logo logo-small"> <img src="admin-staff/assets/img/hotel_logo.png" alt="Logo" width="30" height="30"> </a>
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
                            </div>  <a class="dropdown-item" href="MainController?action=loadaccStaff&id=${sessionScope.account.getId()}">My Profile</a>   
               <a class="dropdown-item" href="MainController?action=logout">Logout</a> </div>
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
                                    <h4 class="card-title float-left mt-2">Sản phẩm</h4> <a  data-toggle="modal" href="#edit_personal_details" class="btn btn-primary float-right veiwbutton">Thêm sản phẩm</a> </div>
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
                                        <form action="addproductstaff" method="post">
                                            <div class="row form-row">
                                                <div class="col-12 col-sm-6">
                                                    <div class="form-group">
                                                        <label>Tên Sản Phẩm: </label>
                                                        <input type="text" class="form-control" placeholder="Long sat" name="productName" required=""> </div>
                                                </div>

                                                <div class="col-12-sm-6">
                                                    <div class="form-group">
                                                        <label>Số lượng</label> 
                                                        <input required="" type="number" class="qty-text form-control" id="qty" step="1" min="1" max="1000" name="quantity" value="">

                                                    </div>
                                                </div>
                                                <div class="col-12-sm-6">
                                                    <div class="form-group">
                                                        <label>Hình ảnh </label> 
                                                        <input type="file" name="image" accept="image/*" required class="form-control-file">
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-6">
                                                    <div class="form-group">
                                                        <label>Giá </label>
                                                        <input type="text" class="form-control" placeholder="590.000VND" name="price" required=""> </div>
                                                </div>
                                                <div class="col-12 col-sm-6">
                                                    <div class="form-group">
                                                        <label>Loại lồng</label>

                                                        <select name="categoriesID" required class="form-control"> 
                                                            <c:forEach var="d" items="${cate}"> 
                                                                <option value="${d.getCategoryId()}">${d.getCategoryName()} </option>
                                                            </c:forEach>
                                                        </select>  

                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <h5 class="form-title"><span>Vật liệu</span></h5> </div>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label>Vật liệu</label>
                                                        <input type="text" class="form-control" placeholder="Lồng sắt,.. " required="" name="material"> </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label>Xưởng sản xuất: </label>
                                                        <input type="text" class="form-control" placeholder="Công ty... " required="" name="manufacturer"> </div>
                                                </div>
                                                <div class="col-12 col-sm-6">
                                                    <div class="form-group">
                                                        <label>Size</label>
                                                        <input type="text" class="form-control" placeholder="100x300" name="size"> </div>
                                                </div>
                                                <div class="col-12 col-sm-6">
                                                    <div class="form-group">
                                                        <label>Xản xuất ở</label>
                                                        <input type="text" class="form-control" placeholder="Thành phố bà rịa ,.." name="madeIn "> </div>
                                                </div>
                                                <div class="col-12 col-sm-6">
                                                    <div class="form-group">
                                                        <label>Màu sắc</label>
                                                        <input type="text" class="form-control" placeholder="Xanh , đỏ,.." required="" name="color"> </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label>Mô tả </label>
                                                        <input type="text" class="form-control" placeholder="Công ty... " required="" name="description"> </div>
                                                </div>

                                                <!--                                                                    <div class="col-12 col-sm-6">
                                                                                                                        <div class="form-group">
                                                                                                                            <label>Country</label>
                                                                                                                            <input type="text" class="form-control" value="United States"> </div>
                                                                                                                    </div>-->
                                            </div>
                                            <input type="hidden" name="idstaff" value="${sessionScope.account.getId()}" >
                                            <button type="submit" class="btn btn-primary btn-block">Lưu</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <form action="SearchProStaff" method="post"> 
                                <div class="row formtype">

                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Loại sản phẩm</label>
                                            <select class="form-control" id="sel1" name="categoryID">
                                                <c:forEach var="d" items="${cate}"> 
                                                    <option value="${d.getCategoryId()}" name"categoryID">${d.getCategoryName()} </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Tìm theo tên sản phẩm</label>
                                            <input class="form-control" type="text" name="productName" value="" placeholder="Tên sản phẩm">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Tìm kiếm</label> <button type="submit" href="#" class="btn btn-success btn-block mt-0 search_button"> Tìm kiếm </button> </div>
                                    </div>

                                </div>
                            </form>
                             <form action="addcate" method="post"> 
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Thêm Loại sản phẩm</label>
                                        <input class="form-control" type="text" name="detail" value="" placeholder="Tên loại sản phẩm"> 
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                           ${mess}
                                        <label></label> <button type="submit" href="#" class="btn btn-success btn-block mt-0 search_button"> Thêm </button> </div>
                                </div>
                              
                                      </form>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive">



                                        <c:if test="${not empty searchResults}">
                                            <table class="datatable table table-striped">
                                                <thead>
                                                 <tr>
                                                    <th>Tên sản phẩm</th>
                                                    <th>Mô tả sản phẩm</th>
                                                    <th>Loại lồng </th>
                                                    <th>Số lượng</th>
                                                    <th>Giá (VND)</th>
                                                    <th>Kích thước (30cmx30cmx30cm)</th>
                                                    <th>Màu sắc</th>
                                                    <th>nhà sản xuất </th>
                                                    <th>sản xuất ở </th>
                                                    <th>Hình ảnh</th>
                                                    <th>Trạng thái</th>
                                                    <th>Chức năng</th>
                                                </tr>
                                                </thead>
                                                <c:forEach var="product" items="${searchResults}">
                                                <tbody>
                                                    
                                                       <tr> 
                                                        <td>${product.getName()} </td>
                                                        <td>${product.getDescription()}</td>
                                                        <td>${product.getCate().getCategoryName()}</td>
                                                        <td>${product.getQuantity()}</td>
                                                        <td> ${product.getPrice()}</td>
                                                         <td>${product.getSize()}</td>
                                                        <td>${product.getColor()}</td>
                                                        <td>${product.getManufacturer()}</td>
                                                        <td>${product.getMadeIn()}</td>
                                                        
                                                        <td><img src="${product.getImage()}" style="height: 50px; width: 50px;"></td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${product.getStatus()  == 1 && product.getQuantity()  > 0}">
                                                                    <p class="btn btn-success">Còn hàng</p>
                                                                </c:when>
                                                                <c:when test="${product.getStatus()  == 0 && product.getQuantity()  == 0}">
                                                                    <p class="btn btn-danger">Hết hàng</p>
                                                                </c:when>
                                                                <c:when test="${product.getStatus()  == 1 && product.getQuantity()  == 0}">
                                                                    <p class="btn btn-danger">Hết hàng</p>
                                                                </c:when>
                                                                <c:when test="${product.getStatus()  == 0 }">
                                                                    <p class="btn btn-danger">Hết hàng</p>
                                                                </c:when>
                                                            </c:choose>
                                                        </td>
                                                        <td class="text-right">
                                                            <button  type="button" class="btn btn-sm bg-success-light mr-2"   data-toggle="modal" data-target="#delete_asset_${product.getId()}">
                                                                Cập nhật
                                                            </button>
                                                            <div id="delete_asset_${product.getId()}" class="modal fade delete-modal" role="dialog">
                                                                <div class="modal-dialog modal-dialog-centered">
                                                                    <div class="modal-content">
                                                                        <div class="modal-body text-center">  
                                                                            
                                                                            
                                                                            <form action="UpdateProductServlet" method="post">
                                                                                <input type="hidden" name="productId" value="${product.getId()}">

                                                                                <div class="form-group">
                                                                                    <label   class="float-left" for="productName">Product Name </label>
                                                                                    <input type="text" name="productName" class="form-control" value="${product.getName()}">
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label class="float-left" for="categoryId">Category</label>
                                                                                   <select name="categoryId" required class="form-control">
                                                                                    <c:forEach var="d" items="${cate}">
                                                                                        <option value="${d.getCategoryId()}">${d.getCategoryName()}</option>
                                                                                    </c:forEach>
                                                                                </select>   
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label  for="quantity" class="float-left">Quantity</label>
                                                                                    <input type="number" name="quantity"   class="form-control" value="${product.getQuantity()}">
                                                                                </div>

                                                                                <div class="form-group">
                                                                                    <label class="float-left"  class="float-left" for="price">Price</label>
                                                                                    <input type="number" name="price"  class="form-control" value="${product.getPrice()}">
                                                                                </div>

                                                                                <div class="form-group">
                                                                                    <label  class="float-left" for="size">Size</label>
                                                                                    <input type="text" name="size"  class="form-control" value="${product.getSize()}">
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label class="float-left" for="color">Color</label>
                                                                                    <input type="text" name="color"  class="form-control" value="${product.getColor()}">
                                                                                </div>

                                                                                <div class="form-group">
                                                                                    <label  class="float-left" for="image">Image</label>
                                                                                    <input type="file" name="image"     class="form-control-file"  value="${product.getImage()}">

                                                                                </div>

                                                                                <div class="form-group">
                                                                                    <label  class="float-left" for="manufacturer">Manufacturer</label>
                                                                                    <input type="text" name="manufacturer"  class="form-control" value="${product.getManufacturer()}">
                                                                                </div>


                                                                                <div class="form-group">
                                                                                    <label class="float-left" for="material">Material</label>
                                                                                    <input type="text" name="material"   class="form-control" value="${product.getMaterial()}">
                                                                                </div>


                                                                                <div class="form-group">
                                                                                    <label class="float-left" for="madeIn">Made In</label>
                                                                                    <input type="text" name="madeIn" class="form-control" value="${product.getMadeIn()}">
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label class="float-left" for="description">Description</label>
                                                                                    <input type="text" name="description"  class="form-control" value="${product.getDescription()}">
                                                                                </div>

                                                                                <button type="submit" class="btn btn-primary">Update</button>
                                                                                <button id="closePopupButton" class="btn btn-secondary">Close</button>
                                                                            </form>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>  
                                                        </td> 
                                                    </tr>
                                                 
                                                </tbody>
                                                </c:forEach>

                                            </table>
                                        </c:if>

                                        <c:if test="${empty searchResults}">
                                            <p>Không tìm thấy sản phẩm nào phù hợp với tìm kiếm của bạn.</p>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="delete_asset" class="modal fade delete-modal" role="dialog">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-body text-center"> <img src="assets/img/sent.png" alt="" width="50" height="46">
                                    <h3 class="delete_class">Bạn có chắc chắn muốn xóa sản phẩm này?</h3>
                                    <div class="m-t-20"> <a href="#" class="btn btn-white" data-dismiss="modal">Đóng</a>
                                        <button type="submit" class="btn btn-danger">Xóa</button>
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
    </body>
</html>
