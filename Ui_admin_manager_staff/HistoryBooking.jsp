<%-- 
    Document   : HistoryBooking
    Created on : 08-10-2023, 12:28:07
    Author     : Quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <head>
        <link href="css/feedback.css" rel="stylesheet" type="text/css"/>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="author" content="Untree.co">
        <link rel="shortcut icon" href="favicon.png">

        <meta name="description" content="" />
        <meta name="keywords" content="bootstrap, bootstrap4" />
        <link href="css/cssfeedback.css" rel="stylesheet" type="text/css"/>
        <!-- Bootstrap CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="css/tiny-slider.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/history.css" rel="stylesheet" type="text/css"/>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <title>Lịch sử thanh toán</title>
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
                font-size: 12px;
            }

            /* CSS cho popup */
            .popup {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background: #fff;
                width: 950px; /* Điều chỉnh chiều rộng của popup */
                height: 720px; /* Điều chỉnh chiều cao của popup */
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                z-index: 1000;
            }
            .close-popup-button {
                display: block;
                position: absolute;
                top: 10px; /* Điều chỉnh khoảng cách từ top theo ý muốn */
                right: 10px; /* Điều chỉnh khoảng cách từ right theo ý muốn */
                padding: 10px 20px;
                background-color: #ccc;
                color: #fff;
                border: none;
                cursor: pointer;
            }
            .popup .row {
                overflow: auto; /* Hiển thị thanh cuộn khi nội dung dài hơn popup */
                max-height: 700px; /* Điều chỉnh chiều cao tối đa phù hợp với nhu cầu của bạn */
            }
            /* CSS hover cho nút tắt */
            .close-popup-button:hover {
                background-color: #555;
                color: #fff;
            } 
            .popup h2 {
                font-size: 14px; /* Điều chỉnh kích thước cho tiêu đề h2 */

            }
            /* CSS cho các nút button trong popup */
            .popup button {
                font-size: 12px; /* Điều chỉnh kích thước chữ trong nút */
                padding: 10px 20px; /* Điều chỉnh kích thước nút theo chiều ngang và chiều cao */
                background-color:#2f2f2f; /* Điều chỉnh màu nền của nút */
                color: #ffffff /* Điều chỉnh màu chữ trong nút */
                    border: none; /* Loại bỏ viền nút */
                cursor: pointer; /* Biến con trỏ thành hình tay khi di chuột vào nút */
            }

            .popup button:hover {
                background-color: #0056b3; /* Điều chỉnh màu nền khi di chuột vào nút */
            }
        </style>

    </head>
    <body>
        <header>
            <%@include file="headerUser.jsp"%>
        </header>

        <div class="payment-history">
            <h1>Lịch sử yêu cầu</h1>
            <c:if test="${not empty account.getId()}">



                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Ngày đặt hàng</th>
                            <th>Tên</th>
                            <th>Chất liệu</th>
                            <th>Màu</th>
                            <th>Số lượng</th>
                            <th>Kích thước</th>
                            <th>Ảnh</th>
                            <th>Chú thích</th>
                            <th>Số tiền</th>
                            <th>Trạng thái</th>
                            <th>Hành động</th>

                        </tr>
                    </thead>
                    <tbody>
                        <!-- Dữ liệu lịch sử thanh toán sẽ được thêm vào đây từ dưới database hoặc API -->
                        <c:forEach var="booking" items="${allBooking}">
                            <tr>
                                <td>${booking.bookingRequestId}</td>
                                <td>${booking.createTime}</td>
                                <td>${booking.account.name}</td>
                                <td>${booking.material.name}</td>
                                <td>${booking.color}</td>
                                <td>${booking.quantity}</td>
                                <td>${booking.size}</td>
                                <td>${booking.image}</td>
                                <td>${booking.note}</td>
                                <td>${booking.total}</td>
                                <td><c:choose>
                                        <c:when test="${booking.status == 0}">
                                            <a >Đang Xử lí</a>
                                        </c:when>
                                        <c:when test="${booking.status == 1}">
                                            <a >Chấp nhận</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a>Hủy đơn</a>
                                        </c:otherwise>
                                    </c:choose></td>

                                <td> <button id="open-popup-button">Thanh toán</button>  </td>

                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <div id="popup" class="popup-container">
                <div class="popup">
                    <div class="row">
                        <div class="col-md-6 mb-5 mb-md-0">
                            <!--  phần hóa đơn -->
                            <h2 class="h3 mb-3 text-black">Hóa đơn</h2>
                            <div class="p-3 border bg-white">
                                <!-- Form hóa đơn -->
                                <div class="form-group row">
                                    <h3>Ngày yều cầu:10-08-2023</h3>
                                    <div class="col-md-12">
                                        <label for="c_fname" class="text-black">Tên <span class="text-danger"></span></label>
                                        <input type="readonly" class="form-control" id="c_fname" name="c_fname">
                                    </div>
                                    <div class="col-md-12">
                                        <label for="c_email" class="text-black">Email <span class="text-danger"></span></label>
                                        <input type="readonly" class="form-control" id="c_fname" name="c_email">
                                    </div>
                                    <div class="col-md-12">
                                        <label for="c_lname" class="text-black">Số điện thoại <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="c_lname" name="c_lname">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <label for="c_companyname" class="text-black">Địa chỉ<span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="c_companyname" name="c_companyname">
                                    </div>
                                </div>
                            </div>
                            <br>


                            <div class="form-group">
                                <h2 class="h3 mb-3 text-black">Ghi chú</h2>
                                <textarea name="c_order_notes" id="c_order_notes" cols="30" rows="5" class="form-control" placeholder=""></textarea>
                            </div>
                        </div>

                        <div class="col-md-6" >
                            <!-- Coupon Code và Đơn hàng -->
                            <div class="row mb-5" style=" margin-top:22px">
                                <div class="col-md-12" style=" margin-top:10px">

                                    <div class="p-3  border bg-white">
                                        <h2 class="h3 mb-3 text-black">Mã khuyến mãi</h2>
                                        <label for="c_code" class="text-black mb-3"></label>
                                        <div class="input-group w-75 couponcode-wrap">
                                            <input type="text" class="form-control me-2" id="c_code" placeholder="" aria-label="" aria-describedby="button-addon2">
                                            <div class="input-group-append">
                                                <button class="btn btn-black btn-sm" type="button" id="button-addon2">Thêm</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <h2 class="h3 mb-3 text-black">Yêu cầu</h2>
                                <div class="p-3 border bg-white">
                                    <table class="table site-block-order-table mb-5">
                                        <thead>
                                        <th>Sản phẩm</th>
                                        <th>Giá</th>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Lồng custom <strong class="mx-2"></strong> </td>
                                                <td>250.000</td>
                                            </tr>
                                            <tr>
                                                <td class="text-black font-weight-bold"><strong>Phí ship</strong></td>
                                                <td class="text-black">20000</td>
                                            </tr>
                                            <tr>
                                                <td class="text-black font-weight-bold"><strong> mã giảm</strong></td>
                                                <td class="text-black">150000</td>
                                            </tr>
                                            <tr>
                                                <td class="text-black font-weight-bold"><strong>Tổng(VNĐ)</strong></td>
                                                <td class="text-black font-weight-bold"><strong>350.00</strong></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="form-group">
                                        <button class="btn btn-black btn-lg py-3 btn-block" onclick="window.location = 'thankyou.jsp'">Thanh toán</button>
                                    </div>
                                </div>
                            </div>
                            <button id="close-popup-button" class="close-popup-button">Close</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <%@include file="footer.jsp"%>
        <script>
            // Open the popup when the "Open Popup" button is clicked
            document.getElementById("open-popup-button").addEventListener("click", function () {
                document.getElementById("popup").style.display = "block";
            });

            // Close the popup when the "Close" button is clicked
            document.getElementById("close-popup-button").addEventListener("click", function () {
                document.getElementById("popup").style.display = "none";
            });

            // Handle form submission here (you can use AJAX to send data)
            document.getElementById("feedback-form").addEventListener("submit", function (e) {
                e.preventDefault();
                // Add your code to handle form submission (e.g., sending data to the server)
            });

        </script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/tiny-slider.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>



