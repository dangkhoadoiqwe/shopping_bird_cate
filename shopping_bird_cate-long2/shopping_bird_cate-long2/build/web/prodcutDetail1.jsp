<%-- 
    Document   : prodcutDetail
    Created on : 13-10-2023, 17:33:18
    Author     : Quang
--%>

<%@page import="DTO.Feedback"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="format-detection" content="telephone=no">
<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>-->
<title>Bambino</title>

<link href="css/jquery-ui-1.10.4.custom.css" rel="stylesheet">


<!--home-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<link href="css/tiny-slider.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="scss/style.css" rel="stylesheet" type="text/css"/>
<link href="css/login.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>

<html>
    <header>
        <%@include file="headerGuest.jsp"%>
    </header>
    <body>
        <div class="single-product-area section-padding-100 clearfix">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mt-50">
                                <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
                                <li class="breadcrumb-item"><a href="#">Cửa hàng</a></li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 col-lg-7">
                        <div class="single_product_thumb">
                            <div id="product_details_slider" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <a class="gallery_img" href="${sessionScope.prodetail.getImage()}">
                                            <img class="d-block w-100" src="${sessionScope.prodetail.getImage()}" alt="Hình sản phẩm" style="border-radius: 15px;">
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-lg-5">
                        <div class="single_product_desc">
                            <!-- Thông tin sản phẩm -->
                            <div class="product-meta-data">
                                <div class="line"></div>
                                <h3>${sessionScope.prodetail.getName()}</h3>
                                <h3>${sessionScope.prodetail.getPrice()}VND</h3>

                                <!-- Đánh giá & Nhận xét -->
                                <div class="ratings-review mb-15 d-flex align-items-center justify-content-between">
                                    <div class="ratings">
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                    </div>
                                    <div class="review">
                                        <a class="search-nav" href="MainController?action=compro&proid=${sessionScope.prodetail.getId()}">SO SÁNH</a>
                                    </div>
                                </div>

                                <!-- Tình trạng sản phẩm -->
                                <h6 class="availability">Số lượng : ${sessionScope.prodetail.getQuantity()}</h6>
                            </div>

                            <div class="short_overview my-5">
                                <p>${sessionScope.prodetail.getDescription()}</p>
                            </div>

                            <!-- Biểu mẫu Thêm vào giỏ hàng -->
                            <form class="cart clearfix" method="get" action="addtocart">
                                <div class="cart-btn d-flex mb-50">
                                    <input type="hidden" name="productId" value="${id1.getId()}">
                                    <p>Số lượng</p>
                                    <div class="quantity">
                                        <input type="number" class="qty-text" id="qty" step="1" min="1" max="${id1.getQuantity()}" name="quantity" value="1">
                                        <span class="qty-plus" onclick="var effect = document.getElementById('qty');
                                                var qty = effect.value;
                                                if (!isNaN(qty))
                                                    effect.value++;
                                                return false;"><i class="fa fa-caret-up" aria-hidden="true"></i></span>
                                        <span class="qty-minus" onclick="var effect = document.getElementById('qty');
                                                var qty = effect.value;
                                                if (!isNaN(qty) && qty > 1) {
                                                    effect.value--;
                                                }
                                                return false;">
                                            <i class="fa fa-caret-down" aria-hidden="true"></i>
                                        </span>
                                    </div>
                                </div>
                                <button type="submit" value="Thêm vào giỏ hàng" class="btn amado-btn">Thêm vào giỏ hàng</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="tabs">
            <ul>
                <li><a href="#tabs-1">Thông tin sản phẩm</a></li>
                <li><a href="#tabs-2">Cách sử dụng</a></li>
                <li><a href="#tabs-3">Nhận xét</a></li>
            </ul>
            <div id="tabs-1">
                <!--                Nội dung thông tin sản phẩm nằm ở đây.-->
            </div>
            <div id="tabs-2">
                <!--                Nội dung hướng dẫn cách sử dụng nằm ở đây.-->
            </div>
            <div id="tabs-3">
                <!--                Nội dung nhận xét nằm ở đây.-->
                    <%
                    List<Feedback> feedbacks = (List<Feedback>) request.getAttribute("feedbacks");
                %>
                <div class="product-section">
                    <div class="container">
                        <div class="row">

                            <!-- Start Column 1 -->
                            <div class="col-md-6  ">
                                <section class="product_description_area" style="margin-top: 150px;">
                                    <div class="container">
                                        <h1>Đánh giá</h1>

                                        <c:choose>
                                            <c:when test="${empty feedbacks}">
                                                <p>Không có phản hồi nào được tìm thấy.</p>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="review_list">
                                                                <c:forEach items="${feedbacks}" var="feedback">
                                                                    <div class="review_item">
                                                                        <div class="media">
                                                                            <div class="d-flex">
                                                                                <img src="" alt="" class="reviewer-image">
                                                                            </div>
                                                                            <div class="media-body">
                                                                                <h4 class="reviewer-name">${feedback.getAccount().getName()}</h4>
                                                                                <h6 class="review-date">${feedback.getCreateTime()}</h6>

                                                                                <div class="star-rating">
                                                                                    <c:choose>
                                                                                        <c:when test="${feedback.rating == 5}">
                                                                                            <i class="fa fa-star" style="color: gold"></i>
                                                                                            <i class="fa fa-star" style="color: gold"></i>
                                                                                            <i class="fa fa-star" style="color: gold"></i>
                                                                                            <i class="fa fa-star" style="color: gold"></i>
                                                                                            <i class="fa fa-star" style="color: gold"></i>
                                                                                        </c:when>
                                                                                        <c:when test="${feedback.rating == 4}">
                                                                                            <i class="fa fa-star" style="color: gold"></i>
                                                                                            <i class="fa fa-star" style="color: gold"></i>
                                                                                            <i class="fa fa-star" style="color: gold"></i>
                                                                                            <i class="fa fa-star" style="color: gold"></i>
                                                                                            <i class="fa fa-star"></i>
                                                                                        </c:when>
                                                                                        <c:when test="${feedback.rating == 3}">
                                                                                            <i class="fa fa-star" style="color: gold"></i>
                                                                                            <i class "fa-star" style="color: gold"></i>
                                                                                            <i class="fa fa-star" style="color: gold"></i>
                                                                                            <i class="fa fa-star"></i>
                                                                                            <i class="fa fa-star"></i>
                                                                                        </c:when>
                                                                                        <c:when test="${feedback.rating == 2}">
                                                                                            <i class="fa fa-star" style="color: gold"></i>
                                                                                            <i class="fa fa-star" style="color: gold"></i>
                                                                                            <i class="fa fa-star"></i>
                                                                                            <i class="fa fa-star"></i>
                                                                                            <i class="fa fa-star"></i>
                                                                                        </c:when>
                                                                                        <c:when test="${feedback.rating == 1}">
                                                                                            <i class="fa fa-star" style="color: gold"></i>
                                                                                            <i class="fa fa-star"></i>
                                                                                            <i class="fa fa-star"></i>
                                                                                            <i class="fa fa-star"></i>
                                                                                            <i class="fa fa-star"></i>
                                                                                        </c:when>
                                                                                        <c:otherwise>
                                                                                            <i class="fa fa-star"></i>
                                                                                            <i class="fa fa-star"></i>
                                                                                            <i class="fa fa-star"></i>
                                                                                            <i class="fa fa-star"></i>
                                                                                            <i class="fa fa-star"></i>
                                                                                        </c:otherwise>
                                                                                    </c:choose>
                                                                                </div>

                                                                                <p>${feedback.getComment()}</p>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </section>



                            </div>
                        </div>
                    </div>
                </div>
                <section> 
            </div>
        </div>
        <!-- Start Footer Section -->
        <footer class="footer-section">
            <div class="container relative">





                <div class="row g-5 mb-5">
                    <div class="col-lg-4">
                        <div class="mb-4 footer-logo-wrap"><a href="#" class="footer-logo">Furni<span>.</span></a></div>
                        <p class="mb-4">Funi là cửa hàng sản phẩm lồng chim, phụ kiện lồng chim chính hãng từ  thương hiệu làng nghề thủ công mỹ nghệ hàng đầu Việt Nam Tự tin khẳng định chất lượng phục vụ với đội ngũ nhân viên năng động, chuyên nghiệp có khả năng am hiểu nhu cầu khách hàng cùng như thái độ phục vụ tận tụy.</p>

                        <ul class="list-unstyled custom-social">
                            <li><a href="#"><span class="fa fa-brands fa-facebook-f"></span></a></li>
                            <li><a href="#"><span class="fa fa-brands fa-twitter"></span></a></li>
                            <li><a href="#"><span class="fa fa-brands fa-instagram"></span></a></li>
                            <li><a href="#"><span class="fa fa-brands fa-linkedin"></span></a></li>
                        </ul>
                    </div>

                    <div class="col-lg-8">
                        <div class="row links-wrap">
                            <div class="col-6 col-sm-6 col-md-4">
                                <ul class="list-unstyled">
                                    <li><a style = color:red;>Cửa hàng</a></li>
                                    <li><a href="homePage.jsp">Giới thiệu</a></li>
                                    <li><a href="shop.jsp">Sản phẩm</a></li>
                                    <li><a href="blog.jsp">Blog</a></li>
                                    <li><a href="contact.jsp">Liên hệ</a></li>
                                </ul>
                            </div>

                            <div class="col-6 col-sm-6 col-md-4">
                                <ul class="list-unstyled">
                                    <li><a style = color:red;>Chính sách</a></li>
                                    <li><a href="chinhsachdoitra.jsp">Chính sách đổi trả</a></li>
                                    <li><a href="csMua.jspcs">Chính sách mua hàng</a></li>
                                    <li><a href="csbaomat.jsp">Chính sách bảo mật</a></li>
                                </ul>
                            </div>

                            <div class="col-6 col-sm-6 col-md-4">
                                <ul class="list-unstyled">
                                    <li><a style = color:red;>Liên hệ với chúng tôi</a></li>
                                    <li><a href="#">Hotline:097777555</a></li>
                                    <li><a href="#">funi@gmail.com</a></li>
                                    <li><a href="#">Số 1 đường D1, Thành phố Thủ Đức,Thành Phố Hồ Chí Minh</a></li>
                                </ul>
                            </div>


                        </div>
                    </div>

                </div>

            </div>
        </footer>
        <!-- End Footer Section -->	
    </body>

    <script type="text/javascript" src="jss/fancySelect.js"></script>
    <script type="text/javascript" src="jss/jquery.bxslider.js"></script>
    <script src="jss/jquery-ui-1.10.4.custom.js"></script>
    <script type="text/javascript" src="jss/main.js"></script>
</html>
