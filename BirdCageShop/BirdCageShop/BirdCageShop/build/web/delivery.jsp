<%-- 
    Document   : delivery
    Created on : 26-09-2023, 19:18:03
    Author     : Quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/delivery.css" rel="stylesheet">
       <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="css/tiny-slider.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="scss/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
       
        <title>JSP Page</title>
    </head>
    <body>
           <header>
            <%@include file="headerGuest.jsp"%>
        </header>
        <div class="container">
            <article class="card">
                <header class="card-header"> My Orders / Tracking </header>
                <div class="card-body">
                    <h6>Order ID: OD45345345435</h6>
                    <article class="card">
                        <div class="card-body row">
                            <div class="col"> <strong>Thời gian giao hàng ước tính:</strong> <br>6/9/2023 </div>
                            <div class="col"> <strong>vận chuyển bởi:</strong> <br> Quang, | <i class="fa fa-phone"></i> +1598675986 </div>
                            <div class="col"> <strong>trạng thái:</strong> <br> đã thanh toán </div>
                           
                        </div>
                    </article>
                    <div class="track">
                        <div class="step active"> <span class="icon"> <i class="fa fa-check"></i> </span> <span class="text">Xác nhận</span> </div>
                        <div class="step active"> <span class="icon"> <i class="fa fa-user"></i> </span> <span class="text"> kho vận chuyển</span> </div>
                        <div class="step"> <span class="icon"> <i class="fa fa-truck"></i> </span> <span class="text"> đang trên đường </span> </div>
                        <div class="step"> <span class="icon"> <i class="fa fa-box"></i> </span> <span class="text">hoàn thành</span> </div>
                    </div>
                    <hr>
                    <ul class="row">
                        <li class="col-md-12">
                            <figure class="itemside mb-3">
                                <div class="aside"><img src="images/product-2.png" class="img-sm border"></div>
                                <figcaption class="info align-self-center">
                                    <p class="title">Lồng chào mào  <br> chum chống</p> <span class="text-muted">$950 </span>
                                </figcaption>
                            </figure>
                        </li>
                        <li class="col-md-12">
                            <figure class="itemside mb-3">
                                 <div class="aside"><img src="images/product-1.png" class="img-sm border"></div>
                                <figcaption class="info align-self-center">
                                   <p class="title">Lồng chào mào khung gỗ  <br>vuông </p> <span class="text-muted">$950 </span>
                                </figcaption>
                            </figure>
                        </li>
                     
                    </ul>
                    <hr>
                    <a href="shop.jsp" class="btn btn-warning" data-abc="true"> <i class="fa fa-chevron-left"></i> cửa hàng</a>
                </div>
            </article>
        </div>
         <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/tiny-slider.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>
