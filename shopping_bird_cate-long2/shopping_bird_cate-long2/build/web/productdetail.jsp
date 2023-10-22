<%-- 
    Document   : Headeradmin
    Created on : 27 thg 8, 2023, 23:57:23
    Author     : Admin
--%>
<%@page import="DTO.Feedback"%>
<%@page import="java.util.List"%>
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
        <style>
            .rating {
                display: flex;
                flex-direction: row-reverse;
                font-size: 30px;
                color: gold;
            }

            .rating input {
                display: none;
            }

            .rating label {
                cursor: pointer;
            }

            .rating label:before {
                content: '\2606';
                color: #ccc;
                font-size: 2em;
            }

            .rating input:checked ~ label:before {
                content: '\2605';
                color: gold;
            }


            body {
                background-color: #eee
            }

            .card {
                background-color: #fff;
                border: none
            }

            .form-color {
                background-color: #fafafa
            }

            .form-control {
                height: 48px;
                border-radius: 25px
            }

            .form-control:focus {
                color: #495057;
                background-color: #fff;
                border-color: #35b69f;
                outline: 0;
                box-shadow: none;
                text-indent: 10px
            }

            .c-badge {
                background-color: #35b69f;
                color: white;
                height: 20px;
                font-size: 11px;
                width: 92px;
                border-radius: 5px;
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 2px
            }

            .comment-text {
                font-size: 13px
            }

            .wish {
                color: #35b69f
            }

            .user-feed {
                font-size: 14px;
                margin-top: 12px
            }

        </style>
        <link rel="stylesheet" href="pro-detail/pro-detail/vendors/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="pro-detail/vendors/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="pro-detail/vendors/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="pro-detail/vendors/linericon/style.css">
        <link rel="stylesheet" href="pro-detail/vendors/nice-select/nice-select.css">
        <link rel="stylesheet" href="pro-detail/vendors/owl-carousel/owl.theme.default.min.css">
        <link rel="stylesheet" href="pro-detail/vendors/owl-carousel/owl.carousel.min.css">
        <!-- Bootstrap CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="css/tiny-slider.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <title>Furni Free Bootstrap 5 Template for Furniture and Interior Design Websites by Untree.co </title>

    </head>

    <body>

        <header>
            <c:choose>
                <c:when test="${sessionScope.account.role == 1}">
                    <jsp:include page="headerUser.jsp" ></jsp:include>
                </c:when>

                <c:otherwise>
                    <jsp:include page="headerGuest.jsp" ></jsp:include>
                </c:otherwise>
            </c:choose>
        </header>
        <div class="hero">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-lg-5">
                        <div class="intro-excerpt">
                            <h1>Product Detail</h1>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="single-product-area section-padding-100 clearfix"style="margin-top :50px">
            <div class="container-fluid">



                <div class="row">
                    <div class="col-12 col-lg-7">
                        <div class="single_product_thumb">
                            <div id="product_details_slider" class="carousel slide" data-ride="carousel">

                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <a class="gallery_img" href="${sessionScope.prodetail.getImage()}">
                                            <img   src="${sessionScope.prodetail.getImage()}" alt="First slide" style="margin-left: 370px;border-radius: 15px;">
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-lg-5">
                        <div class="single_product_desc">
                            <!-- Product Meta Data -->
                            <div class="product-meta-data">
                                <div class="line"></div>


                                <h3>${sessionScope.prodetail.getName()}</h3>
                                <h3>${sessionScope.prodetail.getPrice()}VND</h3>    
                                <!-- Ratings & Review -->
                                <div class="ratings-review mb-15 d-flex align-items-center justify-content-between">
                                    <div class="rating">
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>

                                    </div>
                                    <div class="review">
                                        <a  class="search-nav" href="MainController?action=compro&proid=${sessionScope.prodetail.getId()}">SO SÁNH</a>
                                    </div>
                                </div>
                                <h6 class="avaibility">
                                    <c:choose>
                                        <c:when test="${sessionScope.prodetail.getQuantity() == 0}">
                                            Số lượng: Hết hàng
                                        </c:when>
                                        <c:otherwise>
                                            Số lượng: ${sessionScope.prodetail.getQuantity()}
                                        </c:otherwise>
                                    </c:choose>
                                </h6>
                            </div>

                            <div class="short_overview my-5">
                                <p>${sessionScope.prodetail.getDescription()}</p>
                                <p style="color: black">Màu sắc : ${sessionScope.prodetail.getColor()}</p>
                                     
                                     <p  style="color: black">Sản xuất ở :${sessionScope.prodetail.getMadeIn()} </p>
                                     
                            </div>
                            <c:set var="id1" value="${prodetail}" />
                            <!-- Add to Cart Form -->
                            <form class="cart clearfix" method="get" action="addtocart">
                                <div class="cart-btn d-flex mb-50" >
                                    <input type="hidden" name="productId" value="${id1.getId()}">
                                    <p>SL</p>
                                    <div class="quantity" >

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
                                <c:choose>
                                    <c:when test="${id1.quantity == 0}">
                                        <p>Sản phẩm hết hàng</p>
                                    </c:when>
                                    <c:when test="${sessionScope.account!= null}">
                                        <button class="btn amado-btn" name="action" value="Add to cart" type="submit">Thêm vào giỏ hàng </button>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="btn amado-btn" type="button" id="addToCartButton">Thêm vào giỏ hàng</button>
                                    </c:otherwise>
                                </c:choose>


                            </form>

                        </div>
                    </div>
                </div>

            </div>
        </div>
        <%
            List<Feedback> feedbacks = (List<Feedback>) request.getAttribute("feedbacks");
        %>
        <div class="container mt-5 mb-5">
            <div class="row height d-flex justify-content-center align-items-center">
                <div class="col-md-7">
                    <div class="card">
                        <div class="p-3">
                            <h6>ĐÁNH GIÁ</h6>
                        </div>
                        <c:choose>
                            <c:when test="${empty feedbacks}">
                                <p>Không có phản hồi nào được tìm thấy.</p>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${feedbacks}" var="feedback">
                                    <div class="mt-2">
                                        <div class="d-flex flex-row p-3"> <img src="images/person_4.jpg" width="40" height="40" class="rounded-circle mr-3">
                                            <div class="w-100">
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <div class="d-flex flex-row align-items-center"> <span class="mr-2">${feedback.getAccount().getName()}</span>   </div> <small>${feedback.getCreateTime()}</small>
                                                </div>
                                                <p>
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
                                                </p>
                                                <p class="text-justify comment-text mb-0">${feedback.getComment()}</p>

                                            </div>
                                        </div>

                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>


        <section> 
            <div class="product-section">
                <div class="container">
                    <div class="row">

                        <!-- Start Column 1 -->
                        <div class="col-md-12 col-lg-3 mb-5 mb-lg-0">
                            <h2 class="mb-4 section-title">Thiết kế lồng chim với các nguyên liệu phù hợp.</h2>
                            <p class="mb-4">Khám phá chiếc lồng hoàn hảo cho chú chim của bạn! Lựa chọn của chúng tôi mang đến sự an toàn và phong cách. Hãy nâng tầm ngôi nhà cho chú chim của bạn ngay hôm nay. </p>
                            <p><a href="bookingCageFrom.jsp" class="btn">Đặt ngay</a></p>
                        </div> 
                        <c:forEach var="product" items="${product}">
                            <div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
                                <a class="product-item" href="MainController?action=ProDetail&proid=${product.getId()}">
                                    <img src="${product.getImage()}" class="img-fluid product-thumbnail">
                                    <h3 class="product-title">${product.getName()}</h3>
                                    <strong class="product-price">${product.getPrice()}VND</strong>

                                    <span class="icon-cross">
                                        <img src="images/cross.svg" class="img-fluid">
                                    </span>
                                </a>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>
        </section>



        <!-- ##### Main Content Wrapper End ##### -->

        <!-- ##### Newsletter Area Start ##### -->

        <jsp:include page="footer.jsp" ></jsp:include>
        <script>
            var addToCartButton = document.getElementById("addToCartButton");

            // Thêm sự kiện bắt nút
            addToCartButton.addEventListener("click", function () {
                // Thực hiện các hành động khi nút "Thêm vào giỏ hàng" được nhấn
                showLoginContainer(); // Hiển thị hộp thoại đăng nhập
            });
            function showLoginContainer() {
                var $form_modal = $('.cd-user-modal');
                var $form_login = $form_modal.find('#cd-login');

                $form_modal.addClass('is-visible');
                $form_login.addClass('is-selected');
            }
        </script>
        <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
        <!-- Popper js -->
        <script src="js/popper.min.js"></script>
        <!-- Bootstrap js -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Plugins js -->
        <script src="js/plugins.js"></script>
        <!-- Active js -->
        <script src="js/active.js"></script>
        <script>
            // JavaScript để hiển thị và ẩn popover
            function showPopover() {
                var popover = document.getElementById("popover");
                popover.style.display = "block";
            }

            function hidePopover() {
                var popover = document.getElementById("popover");
                popover.style.display = "none";
            }

            // JavaScript để thực hiện các hành động khi thêm sản phẩm vào giỏ hàng
            function addToCart() {
                // Thêm sản phẩm vào giỏ hàng
                alert("Sản phẩm đã được thêm vào giỏ hàng!");
            }

            // JavaScript để đóng popover
            function closePopover() {
                var popover = document.getElementById("popover");
                popover.style.display = "none";
            }
        </script>
    </body>
    <script src="pro-detail/vendors/jquery/jquery-3.2.1.min.js"></script>
    <script src="pro-detail/vendors/bootstrap/bootstrap.bundle.min.js"></script>
    <script src="pro-detail/vendors/skrollr.min.js"></script>
    <script src="pro-detail/vendors/owl-carousel/owl.carousel.min.js"></script>
    <script src="pro-detail/vendors/nice-select/jquery.nice-select.min.js"></script>
    <script src="pro-detail/vendors/jquery.ajaxchimp.min.js"></script>
    <script src="pro-detail/vendors/mail-script.js"></script>
    <script src="pro-detail/js/main.js"></script>
    
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/tiny-slider.js"></script>
        <script src="js/custom.js"></script>
</html>