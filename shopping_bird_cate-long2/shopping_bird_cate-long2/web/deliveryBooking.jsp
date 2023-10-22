<%-- 
    Document   : delivery
    Created on : 26-09-2023, 19:18:03
    Author     : Quang
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/delivery.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- Thêm Font Awesome CSS (để sử dụng biểu tượng ngôi sao) -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/starability-basic@1.2.5/starability-basic.min.css">
        <style>
            .rating-color {
                color: gold; /* Màu của ngôi sao đã chọn */
                cursor: pointer; /* Biến con trỏ thành một ngón tay khi di chuột qua ngôi sao */
                .custom-comment-input {
                    width: 70px;
                    height: 70px;
                }
            }
        </style>
        <link href="css/tiny-slider.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="scss/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>

        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <%@include file="headerUser.jsp"%>
        </header>
        <c:forEach var="pay" items="${pay}">
            <div class="container">

                <article class="card">

                    <header class="card-header"> My Orders / Tracking </header>
                    <div class="card-body">
                        <h6>Payment ID: ${pay.getId()}</h6>
                        <article class="card">
                            <div class="card-body row">
                                <div class="col"> <strong>Thời gian giao hàng ước tính:</strong> <br>
                                    <c:choose> 
                                        <c:when test="${pay.getDelivery().getStatus() == 4}">
                                            . </div>
                                        </c:when>
                                        <c:when test="${pay.getDelivery().getStatus() == 5}">
                                        . </div>
                                    </c:when>
                                    <c:otherwise>
                                        ${pay.getDelivery().getIntendTime()} </div>
                            </c:otherwise>
                        </c:choose>
                    <div class="col"> <strong>Tên người nhận :</strong> <br> ${pay.getName()}, | <i class="fa fa-phone"></i>  ${pay.getCusPhone()} </div>
                    <div class="col"> <strong>Trạng thái:</strong> <br> 

                        <c:choose>
                            <c:when test="${pay.getStatus() == 2}">
                                Đã Thanh toán 50% và trả tiền mặt 
                            </c:when>
                            <c:when test="${pay.getStatus() == 1}">
                                Chuyển khoản  
                            </c:when>
                            <c:otherwise>
                                đã xong 
                            </c:otherwise>
                        </c:choose>
                    </div>

            </div>
        </article>
        <div class="track">
            <c:choose>
                <c:when test="${pay.getDelivery().getStatus() == 1}">
                    <div class="step active"> <span class="icon"> <i class="fa fa-check"></i> </span> <span class="text">Đang xử lý  </span> </div>
                    <div class="step  "> <span class="icon"> <i class="fa fa-user"></i> </span> <span class="text"> xác nhận </span> </div>
                    <div class="step"> <span class="icon"> <i class="fa fa-truck"></i> </span> <span class="text"> đang trên đường </span> </div>
                    <div class="step"> <span class="icon"> <i class="fa fa-box"></i> </span> <span class="text">hoàn thành</span> </div>
                </c:when>
                <c:when test="${pay.getDelivery().getStatus() == 2}">
                    <div class="step active"> <span class="icon"> <i class="fa fa-check"></i> </span> <span class="text">Đang xử lý</span> </div>
                    <div class="step active"> <span class="icon"> <i class="fa fa-user"></i> </span> <span class="text"> xác nhận </span> </div>
                    <div class="step"> <span class="icon"> <i class="fa fa-truck"></i> </span> <span class="text"> đang trên đường </span> </div>
                    <div class="step"> <span class="icon"> <i class="fa fa-box"></i> </span> <span class="text">hoàn thành</span> </div>
                </c:when>
                <c:when test="${pay.getDelivery().getStatus() == 3}">
                    <div class="step active"> <span class="icon"> <i class="fa fa-check"></i> </span> <span class="text">Đang  xử lý</span> </div>
                    <div class="step active"> <span class="icon"> <i class="fa fa-user"></i> </span> <span class="text"> xác nhận </span> </div>
                    <div class="step active"> <span class="icon"> <i class="fa fa-truck"></i> </span> <span class="text"> đang trên đường </span> </div>
                    <div class="step  "> <span class="icon"> <i class="fa fa-box"></i> </span> <span class="text">hoàn thành</span> </div>

                </c:when>
                <c:when test="${pay.getDelivery().getStatus() == 4}">
                    <div class="step active"> <span class="icon"> <i class="fa fa-check"></i> </span> <span class="text">Đang xử lý</span> </div>
                    <div class="step active"> <span class="icon"> <i class="fa fa-user"></i> </span> <span class="text"> xác nhận </span> </div>
                    <div class="step active"> <span class="icon"> <i class="fa fa-truck"></i> </span> <span class="text"> đang trên đường </span> </div>
                    <div class="step active"> <span class="icon"> <i class="fa fa-box"></i> </span> <span class="text">hoàn thành</span> </div>

                </c:when>
                <c:otherwise>
                    <div class="step  "> <span class="icon"> <i class="fa fa-check"></i> </span> <span class="text">Đang  xử lý</span> </div>
                    <div class="step"> <span class="icon"> <i class="fa fa-user"></i> </span> <span class="text"> xác nhận </span> </div>
                    <div class="step"> <span class="icon"> <i class="fa fa-truck"></i> </span> <span class="text"> đang trên đường </span> </div>
                    <div class="step"> <span class="icon"> <i class="fa fa-box"></i> </span> <span class="text">hoàn thành</span> </div>

                </c:otherwise>
            </c:choose>
        </div>
        <hr>
        <!--        <ul class="row">
                    <li class="col-md-12">
                        <figure class="itemside mb-3">
                            <div class="aside"><img src="images/product-2.png" class="img-sm border"></div>
                            <figcaption class="info align-self-center">
                                <p class="title">Lồng chào mào  <br> chum chống</p> <span class="text-muted">$950 </span>
                            </figcaption>
                        </figure>
                    </li>
                    <li class="col-md-12">
                        <figure class="itemside mb-8">
                            <div class="aside"><img src="images/product-1.png" class="img-sm border"></div>
                            <figcaption class="info align-self-center">
                                <p class="title">Lồng chào mào khung gỗ  <br>vuông </p> <span class="text-muted">$950 </span>
                            </figcaption>
                        </figure>
                    </li>
        
                        </ul>-->

        <hr>

        <c:choose>   <c:when test="${pay.getDelivery().getStatus() == 4}">

                <div class="col-md-6">

                    <a  href="MainController?action=His&accid=${sessionScope.account.getId()}" class="btn btn-light" data-abc="true">  Chi tiết và đánh giá  </a>

                </div>

            </c:when>
          
            <c:otherwise>
                <div class="col-md-6">

                    <a  href="MainController?action=His&accid=${sessionScope.account.getId()}" class="btn btn-light" data-abc="true"> Chi tiết   </a>

                </div>
            </c:otherwise>
        </c:choose>

    </article>

</div>
</c:forEach>
<jsp:include page="footer.jsp" ></jsp:include>
<script>
    // Lấy tất cả các ngôi sao
    const stars = document.querySelectorAll('.rating-color');

    // Đặt sự kiện click cho từng ngôi sao
    stars.forEach((star, index) => {
        star.addEventListener('click', () => {
            // Đặt lại màu của tất cả các ngôi sao
            stars.forEach((s, i) => {
                if (i <= index) {
                    s.classList.add('rating-color');
                } else {
                    s.classList.remove('rating-color');
                }
            });
        });
    });
</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/tiny-slider.js"></script>
<script src="js/custom.js"></script>
</body>
</html>
