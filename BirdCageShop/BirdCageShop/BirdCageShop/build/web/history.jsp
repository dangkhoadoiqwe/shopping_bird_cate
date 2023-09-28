<%-- 
    Document   : history
    Created on : 27-09-2023, 16:59:07
    Author     : Quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="author" content="Untree.co">
        <link rel="shortcut icon" href="favicon.png">

        <meta name="description" content="" />
        <meta name="keywords" content="bootstrap, bootstrap4" />

        <!-- Bootstrap CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="css/tiny-slider.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/history.css" rel="stylesheet">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <title>Lịch sử thanh toán</title>

    </head>
    <body>
            <header>
            <%@include file="headerGuest.jsp"%>
        </header>
        <div class="payment-history">
            <h1>Lịch sử thanh toán</h1>
            <table>
                <thead>
                    <tr>
                        <th>OrderID</th>
                        <th>Ngày thanh toán</th>
                        <th>Sản phẩm</th>
                        <th>số lượng</th>
                        <th>Số tiền</th>
                        <th>Trạng thái</th>
                        <th>Hành động</th>
                      
                    </tr>
                </thead>
                <tbody>
                    <!-- Dữ liệu lịch sử thanh toán sẽ được thêm vào đây từ dưới database hoặc API -->
                    <tr>
                        <td> OD45345345435</td>
                        <td>2023-09-01</td>
                        <td>Lồng chào mào khung gỗ</td>
                        <td>1</td>
                        <td>$100.00</td>
                        <td>Đã giao</td>
                        <td><a class="btn-details" href="feedback.jsp">Xem chi tiết</a></td>
                       
                    </tr>
                    <tr>
                        <td> OD45345345555</td>
                        <td>2023-09-10</td>
                        <td>Lồng chào mào khung gỗ</td>
                        <td>1</td>
                        <td>$75.00</td>
                        <td>Đã giao</td>
                        <td><a class="btn-details" href="feedback.jsp">Xem chi tiết</a></td>
                        
                    </tr>
                    <!-- Thêm các dòng dữ liệu khác ở đây -->
                </tbody>
            </table>
        </div>
         <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/tiny-slider.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>


