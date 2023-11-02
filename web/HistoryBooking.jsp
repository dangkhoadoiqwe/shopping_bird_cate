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
        <link href="css/history.css" rel="stylesheet">
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
                color: #ffffff ;/* Điều chỉnh màu chữ trong nút */
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
                                <td> <a  href="${booking.image}">
                                  <img src="${booking.image}" style="height: 50px; width: 50px;">  </a>  </td>
                                <td>${booking.note}</td>
                                <td>${booking.total}</td>
                                <td>
                                    <c:choose>
                                         <c:when test="${booking.status == 0}">
                                            <a >Đang Xử lí</a>
                                        </c:when>
                                        <c:when test="${booking.status == 1}">
                                            <a >Đang Xử lí</a>
                                        </c:when>
                                        <c:when test="${booking.status == 2}">
                                            <a >Chấp nhận</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a>.</a>
                                        </c:otherwise>
                                    </c:choose>
                                </td>

                                <td> 
                                    <c:if test="${booking.status == 0}">
                                        <a >. </a>   
                                    </c:if>
                                    <c:if test="${booking.status == 1}">
                                        <a > .</a>   
                                    </c:if>
                                        <c:if test="${booking.status == 2}">
                                        <button id="open-popup-button_${booking.bookingRequestId}">Thanh toán</button>  
                                    </c:if>
                                          <c:if test="${booking.status == 3}">
                                        <p>Đã cọc </p>  
                                    </c:if>
                                    <script>
                                        // Open the popup when the "Open Popup" button is clicked
                                        document.getElementById("open-popup-button_${booking.bookingRequestId}").addEventListener("click", function () {
                                            document.getElementById("popup_${booking.bookingRequestId}").style.display = "block";
                                        });

                                        // Handle form submission here (you can use AJAX to send data)
                                        document.getElementById("feedback-form").addEventListener("submit", function (e) {
                                            e.preventDefault();
                                            // Add your code to handle form submission (e.g., sending data to the server)
                                        });

                                    </script>
                                    <div id="popup_${booking.bookingRequestId}" class="popup-container">
                                        <div class="popup">
                                            <div class="row">

                                                <div class="col-md-12">
                                                    <form action="checkoutbooking"  method="POST"> 

                                                        <h2 class="h3 mb-3 text-black">Hóa đơn ${booking.bookingRequestId}</h2>
                                                        <div class="p-3  border bg-white">

                                                            <div class="form-group row">
                                                                <h3>Ngày yều cầu : ${booking.createTime}</h3>
                                                                <div class="col-md-6">
                                                                    <label for="c_fname" class="text-black">Tên <span class="text-danger"></span></label>
                                                                    <input type="text" class="form-control"   name="name" value="${sessionScope.account.getName()}">
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label for="c_email" class="text-black">Địa chỉ <span class="text-danger"></span></label>
                                                                    <input type="text" class="form-control" id="c_fname" name="Address" value="${sessionScope.account.getAddress()}">
                                                                </div>

                                                                <div class="col-md-12">
                                                                    <label for="c_lname" class="text-black">Số điện thoại <span class="text-danger">*</span></label>
                                                                    <input type="text" class="form-control" id="c_lname" name="phone" value="${sessionScope.account.getPhone()}">
                                                                    <input type="hidden" name="bookingid" value="${booking.bookingRequestId}">
                                                                    <input type="hidden" name="discountTotal" value="${booking.total}">
                                                                </div>
                                                            </div>

                                                        </div> 

                                                        <div class="p-3 border bg-white">
                                                            <table class="table site-block-order-table mb-5">
                                                                <thead>
                                                                <th>Sản phẩm</th>
                                                                <th>Giá</th>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>New order <strong class="mx-2"></strong> </td>
                                                                        <td>${booking.total}VND</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="text-black font-weight-bold"><strong>Phí ship</strong></td>
                                                                        <td class="text-black">30000</td>
                                                                    </tr>

                                                                    <tr>
                                                                        <td class="text-black font-weight-bold"><strong>Tổng(VNĐ)</strong></td>
                                                                        <td class="text-black font-weight-bold"><strong>${booking.total +30000}VND</strong></td>
                                                                    </tr>

                                                                    <tr>                                   

                                                                        <td> 
                                                                            <div class="border p-3 mb-3">
                                                                                <h3 class="h6 mb-0">
                                                                                    <input type="radio"  id="vehicle1" name="status" value="2" required=""> Tiền mặt và thanh toán 50% (${booking.total * 50/100 }VND)
                                                                                </h3>  
                                                                            </div>

                                                                            <div class="border p-3 mb-5">
                                                                                <h3 class="h6 mb-0">   <input type="radio" id="cashCheckbox" id ="vehicle1" name="status" value="1" required=""  id="cashCheckbox">
                                                                                      Chuyển khoản 100 %(${booking.total}VND) 

                                                                            
                                                                        </td> 
                                                                        <td>
                                                                            <div class="form-group">
                                                                                <button  type="submit"  class="btn btn-black btn-lg py-3 btn-block" >Thanh toán</button>
                                                                                
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>

                                                        </div>
                                                    </form>
                                                </div>
                                                <button id="close-popup-button_${booking.bookingRequestId}" class="close-popup-button" onclick="closePopup(${booking.bookingRequestId})">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                    </div>
                                </td>

                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>


        </div>
        <script>
            function closePopup(bookingId) {
//                var closeBtn = document.getElementById("close-popup-button_" + bookingId);
                var popup = document.getElementById("popup_" + bookingId);
                popup.style.display = "none";
            }
        </script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/tiny-slider.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>



