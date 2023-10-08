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
                    <div class="product-price">
                        <p class="new-price">Lồng chào mào <span>khung gỗ</span></p>
                        <p class="new-price">Số lượng: <span>1</span></p>
                        <p class="new-price">Giá: <span>$249.00 (5%)</span></p>
                    </div>

                    <div class="product-detail">
                        <p>ngày mua : 20/8/2023</p>
                        <p>ngày giao : 15/9/2023</p>
                        <ul>
                            <li>Màu: <span>nâu</span></li>
                            <li>chất liệu <span>gỗ</span></li>
                            <li>loại <span>Chào mào</span></li>
                            <li>hình dáng <span>tròn</span></li>
                        </ul>
                    </div>
                    <div class="stars">
                        <form action="">
                            <input class="star star-5" id="star-5" type="radio" name="star"/>
                            <label class="star star-5" for="star-5"></label>
                            <input class="star star-4" id="star-4" type="radio" name="star"/>
                            <label class="star star-4" for="star-4"></label>
                            <input class="star star-3" id="star-3" type="radio" name="star"/>
                            <label class="star star-3" for="star-3"></label>
                            <input class="star star-2" id="star-2" type="radio" name="star"/>
                            <label class="star star-2" for="star-2"></label>
                            <input class="star star-1" id="star-1" type="radio" name="star"/>
                            <label class="star star-1" for="star-1"></label>
                        </form>
                    </div>
                    <section id="feedback">
                        <h2>Đánh giá và phản hồi</h2>
                        <form id="feedback-form">
                            <label for="comment">Phản hồi:</label>
                            <textarea id="comment" name="comment" rows="4" cols="50" required></textarea>
                            <button type="submit">Gửi</button>
                        </form>
                    </section>

                    <button id="close-popup-button" class="close-popup-button">Close</button>
                </div>
            </div>
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



