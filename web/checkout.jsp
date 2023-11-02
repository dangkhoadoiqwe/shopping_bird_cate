<%-- 
    Document   : checkout
    Created on : 19-09-2023, 22:19:43
    Author     : Quang
--%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ProductDao"%>
<%@page import="DTO.Product"%>
<%@page import="DTO.Account"%>
<%@page import="DAO.VoucherDao"%>
<%@page import="DTO.Voucher"%>
<%@page import="DTO.listToPayment"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="author" content="Untree.co">
        <link rel="shortcut icon" href="favicon.png">

        <meta name="description" content="" />
        <meta name="keywords" content="bootstrap, bootstrap4" />

        <!-- Bootstrap CSS -->  
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="css/tiny-slider.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="path/to/bootstrap.min.css">
        <style>
            .coupon {
                border-radius: 12px;
                box-shadow: 5px 8px 10px #d6d5d533;
                background: #fff;
            }



            /* CSS cho popup */
            .popup {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 1;
            }

            .popup-content {
                background-color: #fff;
                width: 80%;
                max-width: 700px;
                margin: 100px auto;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            }

            .voucher {
                cursor: pointer;
                margin-bottom: 10px;
            }

            /* CSS cho nút "Add Voucher" */
            .add-voucher-button {
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
            }

            .add-voucher-button:hover {
                background-color: #0056b3;
            }
        </style>
        <!-- Đường dẫn đến tệp JavaScript của Bootstrap (jQuery cần được bao gồm trước Bootstrap) -->
        <script src="path/to/jquery.min.js"></script>
        <script src="path/to/bootstrap.min.js"></script>
        <title>Furni Free Bootstrap 5 Template for Furniture and Interior Design Websites by Untree.co </title>
    </head>

    <body>

        <!-- Start Header/Navigation -->
        <header>


            <jsp:include page="headerUser.jsp" ></jsp:include>




            </header>
            <!-- End Header/Navigation -->

            <!-- Start Hero Section -->
            <div class="hero">
                <div class="container">
                    <div class="row justify-content-between">
                        <div class="col-lg-5">
                            <div class="intro-excerpt">
                                <h1>Checkout</h1>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <!-- End Hero Section -->

            <div class="untree_co-section">
                <div class="container"> 
                    <div class="row">
                    <c:set var="id1" value="${account}" />
                    <div class="col-md-12">
                        <div class="row mb-5">
                            <div class="col-md-12">
                                <h2 class="h1 mb-1 text-black">Thông tin khách hàng</h2>
                                <form action="${pageContext.request.contextPath}/checkout"  method="POST">
                                    <div class="p-3 p-lg-5 border bg-white">
                                        <div class="form-group row">
                                            <div class="col-md-6">
                                                <label for="c_fname" class="text-black">Họ tên <span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" id="c_fname" name="Name" value="${id1.getName()}"  maxlength="50"> 
                                            </div>
                                        </div>

                                        <div class="form-group row mb-5">
                                            <div class="col-md-6">
                                                <label for="c_email_address" class="text-black">Số điện thoại<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" id="c_Phone"  name="Phone" value="${id1.getPhone()}"  maxlength="12" >
                                            </div>
                                            <div class="col-md-6">
                                                <label for="c_address" class="text-black">Địa chỉ <span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" id="c_address" name="Address" placeholder="Street address"  value="${id1.getAddress()}" maxlength="50">
                                            </div>
                                        </div> 
                                        <div class="border p-3 mb-5">
                                            <label for="c_order_notes" class="text-black">Ghi chú</label>
                                            <textarea  id="c_order_notes" cols="30" rows="5" class="form-control" placeholder="Write your notes here..." name="note"  maxlength="100"> </textarea>
                                        </div> 
                                    </div>         
                            </div>  
                        </div>         
                    </div>

                    <div class="col-md-12">
                        <div class="row mb-5">
                            <div class="col-md-12">
                                <!--<h2 class="h1 mb-1 text-black">Sản phẩm</h2>-->
                                <div class="p-3 p-lg-5 border bg-white">
                                    <table class="table site-block-order-table mb-5">
                                        <thead>
                                            <tr>
                                                <td>Sản phẩm</td>
                                                <td>Đơn giá</td>
                                                <td>Số lượng</td>
                                                <td>Thành tiền</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                listToPayment payment = (listToPayment) session.getAttribute("payment");
                                                Account acc = (Account) session.getAttribute("account");
                                                ProductDao productDao = new ProductDao();
                                                int totalProductsPrice = 0;
                                                List<listToPayment.product> list = payment.getProducts();
                                                for (listToPayment.product pro : list) {
                                                    Product product = productDao.getProductById(pro.getProId());
                                                    totalProductsPrice += pro.getProPrice() * pro.getQuantity();
                                            %>
                                            <tr>
                                                <td>
                                                    <img src="images/<%= product.getImage()%>" class="img-fluid"  alt="Image" style="width: 100px; height: 100px;">
                                                    <label><%= product.getName()%></label>
                                                </td>
                                                <td><%= pro.getProPrice()%> VND</td>
                                                <td><%= pro.getQuantity()%></td>
                                                <td><%= pro.getProPrice() * pro.getQuantity()%> VND</td> 
                                            </tr>
                                            <%
                                                }
                                            %>       
                                        </tbody>
                                    </table>
                                </div>   
                            </div>  
                        </div>         
                    </div>
                    <div class="col-md-12">
                        <div class="row mb-5">
                            <div class="col-md-12">
                                <h2 class="h3 mb-3 text-black">Your Order </h2>
                                <div class="p-3 p-lg-5 border bg-white">
                                    <table class="table site-block-order-table mb-5">
                                        <thead>
                                        <th></th>
                                        <th></th>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Tổng tiền hàng</td>
                                                <td><%= totalProductsPrice%> VND</td> 
                                            </tr>
                                            <tr>
                                                <td>Giá trị voucher</td>
                                                <%
                                                    VoucherDao voucherDao = new VoucherDao();
                                                    System.out.println(payment.getVoucherId());
                                                    Voucher voucher = voucherDao.getVoucherById(payment.getVoucherId(), acc.getId());
                                                    int priceAfterUseVoucher = totalProductsPrice * (voucher == null ? 0 : voucher.getValue()) / 100;
                                                    int total = totalProductsPrice - priceAfterUseVoucher;
                                                %>
                                                <td><%= voucher == null ? 0 : voucher.getValue()%>% </td>
                                            </tr>
                                            <tr>
                                                <td>Voucher giảm giá</td>
                                                <td>- <%= priceAfterUseVoucher%> VND</td>
                                            </tr>
                                            <tr>
                                                <td class="text-black font-weight-bold"><strong> Tổng thanh toán</strong></td>
                                                <td class="text-black font-weight-bold" name ="discountTotal"><%= total%> VND</td>
                                            </tr>

                                        </tbody>
                                    </table> 
                                    <div class="border p-3">
                                        <h3 class="h6 mb-0">
                                            <input type="radio" id="vehicle1" name="status" value="1" onclick="updateSelectedStatus()" required checked> Tiền mặt
                                        </h3>
                                    </div>
                                    <div class="border p-3 mt-3">
                                        <h3 class="h6 mb-0">
                                            <input type="radio" id="vehicle2" name="status" value="2" onclick="updateSelectedStatus()" required> Chuyển khoản
                                        </h3>
                                    </div>
                                    <img id="paymentImage" src="images/2.png" style="display: none; "> 
                                    <input class="form-control" type="hidden" name="discountTotal" value="${discountTotal}"  ><br>
                                    <input class="form-control" type="hidden" name="voucherid" value="${id}"  ><br>
                                    <div class="">
                                        <h4 style="display: inline-block;">Voucher của Shop:</h4>
                                        <input style="display: inline-block; margin-left: 350px;" type="button" class="btn btn-secondary is-form expand" name="apply_coupon" data-toggle="modal" data-target="#select_voucher" value="Áp dụng">
                                    </div>

                                    <div class="form-group mt-3">
                                        <button class="btn btn-default check_out " onclick="createCheckout()" type="button">Thanh toán</button>  
                                    </div>    
                                </div>
                            </div>
                            <div class="modal fade" id="select_voucher" aria-hidden="true" role="dialog">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Voucher của bạn</h5>
                                            <button type="button" id="close" class="close" onclick="clearContentText()" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
                                        </div>
                                        <div class="modal-body">
                                            <%
                                                Account account = (Account) session.getAttribute("account");
                                                List<Voucher> vouchers = voucherDao.getAllVoucherById(account.getId());
                                            %>
                                            <c:choose>
                                                <c:when test="<%= vouchers != null%>">
                                                    <c:forEach var="voucher" items="<%= vouchers%>">
                                                        <table class="table">
                                                            <thead>
                                                                <tr>
                                                                    <th>Mã voucher</th>
                                                                    <th>Tên voucher</th>
                                                                    <th>Ngày hết hạn</th>
                                                                    <th>Trạng thái</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td>${voucher.getCode()}</td>
                                                                    <td>${voucher.getName()}</td>
                                                                    <td>${voucher.getDateEnd()}</td>
                                                                    <td>${voucher.getStatus() == 0 ? "Còn hiệu lực": "Hết hạn"}</td>
                                                                    <td><input type="radio" id="voucherCheckbox_${voucher.getId()}" name="selectedVoucher" onclick="useVoucher(${voucher.getId()}, ${voucher.getType()})"></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <h5 style="text-align: center;">Bạn không có voucher nào hết</h5>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </form> 
                </div>

            </div>
        </div>

        <jsp:include page="footer.jsp" ></jsp:include>

            <script>
                var selectedStatus;
                var radioButtons = document.getElementsByName("status");
                for (var i = 0; i < radioButtons.length; i++) {
                    if (radioButtons[i].checked) {
                        selectedStatus = radioButtons[i].value;
                        break; // Exit the loop once a checked radio button is found
                    }
                }
                function updateSelectedStatus() {
                    for (var i = 0; i < radioButtons.length; i++) {
                        if (radioButtons[i].checked) {
                            selectedStatus = radioButtons[i].value;
                            break; // Exit the loop once a checked radio button is found
                        }
                    }
                    console.log("Selected status: " + selectedStatus);
                }


                var voucherID = <%= voucher == null ? -1 : voucher.getId()%>
                window.onload = function () {
                    var voucherCheckbox = document.getElementById("voucherCheckbox_" + voucherID);
                    const radioButtons = document.getElementsByName('selectedVoucher');
                    for (var i = 0; i < radioButtons.length; i++) {
                        const radioButton = radioButtons[i];
                        if (radioButton.id === voucherCheckbox.id) {
                            radioButton.checked = true;
                        }
                    }
                };
                function useVoucher(vcId, type) {
                    var voucherCheckbox = document.getElementById("voucherCheckbox_" + vcId);
                    const radioButtons = document.getElementsByName('selectedVoucher');
                    for (var i = 0; i < radioButtons.length; i++) {
                        const radioButton = radioButtons[i];
                        if (radioButton.id === voucherCheckbox.id) {
                            if (voucherCheckbox.checked) {
                                updateVoucher(vcId, type);
                            }
                        } else {
                            radioButton.checked = false;
                        }
                    }
                }
                var list = '<%= new ObjectMapper().writeValueAsString(list)%>';
                function updateVoucher(voucherId, type) {
                    voucherID = voucherId;
                    var voucher = {
                        voucherID: voucherId,
                        type: type
                    };
                    $.ajax({
                        type: 'POST',
                        url: "checkout",
                        data: {
                            listProduct: list,
                            voucher: JSON.stringify(voucher)
                        },
                        success: function (response) {
                            window.location.href = "checkout.jsp";
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            window.alert("Đã có lỗi xảy ra");
                        }
                    });
                }
                var Total = <%= total%>
                function createCheckout() {
                    $.ajax({
                        type: 'POST',
                        url: "createPaymentServlet",
                        data: {
                            listCartID: list,
                            accID: <%= account.getId()%>,
                            voucherID: voucherID,
                            total: Total,
                            status: selectedStatus,
                            cusPhone: document.getElementById("c_Phone").value,
                            cusAddress: document.getElementById("c_address").value,
                            cusName: document.getElementById("c_fname").value
                        },
                        success: function (response) {
                            if (response.msg) {
                                window.alert(response.msg);
                                window.location.href = response.url;
                            } else {
                                window.alert("Thanh toán thành công");
                                window.location.href = "homePage.jsp";
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            window.alert("Có lỗi xảy ra. Vui lòng thử lại sau");
                        }
                    });
                }
                // Lắng nghe sự kiện click trên radio button "Chuyển khoản"
                const cashCheckbox = document.getElementById('cashCheckbox');
                const paymentImage = document.getElementById('paymentImage');

                cashCheckbox.addEventListener('click', function () {
                    if (cashCheckbox.checked) {
                        paymentImage.style.display = 'block'; // Hiển thị hình ảnh khi radio button được chọn
                    } else {
                        paymentImage.style.display = 'none'; // Ẩn hình ảnh khi radio button không được chọn
                    }
                });
        </script>

        <script> // script.js
            document.getElementById("openPopupButton").addEventListener("click", function () {
                document.getElementById("popup").style.display = "block";
            });

            document.getElementById("closePopupButton").addEventListener("click", function () {
                document.getElementById("popup").style.display = "none";
            });
        </script>
        <script>
            // Lấy nút "Add Voucher" và popup
            var addVoucherButton = document.getElementById("addVoucherButton");
            var voucherPopup = document.getElementById("voucherPopup");

            // Hiển thị popup khi nhấn nút "Add Voucher"
            addVoucherButton.addEventListener("click", function () {
                voucherPopup.style.display = "block";
            });

            // Ẩn popup khi nhấn nút "Close"
            var closePopupButton = document.getElementById("closePopupButton");
            closePopupButton.addEventListener("click", function () {
                voucherPopup.style.display = "none";
            });

            // Xử lý khi một voucher được chọn
            var vouchers = document.querySelectorAll(".voucher");
            vouchers.forEach(function (voucher) {
                voucher.addEventListener("click", function () {
                    // Xử lý khi một voucher được chọn
                    console.log("Selected Voucher: " + voucher.textContent);
                });
            });
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
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/tiny-slider.js"></script>
        <script src="js/custom.js"></script>
    </body>

</html>