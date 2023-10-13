<%-- 
    Document   : Headeradmin
    Created on : 27 thg 8, 2023, 23:57:23
    Author     : Admin
--%>
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
            <!-- Product Details Area Start -->
            <div class="single-product-area section-padding-100 clearfix">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-12">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb mt-50">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>

                                    <li class="breadcrumb-item"><a href="#">shop</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Product detail</li>

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
                                                <img class="d-block w-100" src="${sessionScope.prodetail.getImage()}" alt="First slide" style="border-radius: 15px;">
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
                                        <div class="ratings">
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
                                        <c:when test="${sessionScope.prodetail.getQuantity() == 0}">
                                            .
                                        </c:when>
                                        <c:otherwise>
                                            <button type="submit"   value="Add to cart" class="btn amado-btn" >Add to cart</button>
                                        </c:otherwise>
                                    </c:choose>

                                </form>

                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <!-- Product Details Area End -->
        </div>
                             <div class="product-section">
            <div class="container">
                <div class="row">

                    <!-- Start Column 1 -->
                    <div class="col-md-12 col-lg-3 mb-5 mb-lg-0">
                        <h2 class="mb-4 section-title">Thiết kế lồng chim với các nguyên liệu phù hợp.</h2>
                        <p class="mb-4">Khám phá chiếc lồng hoàn hảo cho chú chim của bạn! Lựa chọn của chúng tôi mang đến sự an toàn và phong cách. Hãy nâng tầm ngôi nhà cho chú chim của bạn ngay hôm nay. </p>
                        <p><a href="shop.jsp" class="btn">Xem thêm</a></p>
                    </div> 
                    <!-- End Column 1 -->

                    <!-- Start Column 2 -->
                    <div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
                        <a class="product-item" href="cart.jsp">
                            <img src="images/product-1.png" class="img-fluid product-thumbnail">
                            <h3 class="product-title">Lồng vuông chào mào khung gỗ</h3>
                            <strong class="product-price">$50.00</strong>

                            <span class="icon-cross">
                                <img src="images/cross.svg" class="img-fluid">
                            </span>
                        </a>
                    </div> 
                    <!-- End Column 2 -->

                    <!-- Start Column 3 -->
                    <div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
                        <a class="product-item" href="cart.jsp">
                            <img src="images/product-2.png" class="img-fluid product-thumbnail">
                            <h3 class="product-title">LỒNG CHÀO MÀO CHUM CHỐNG NGƯỚC LỘN BU CHỤP TRE GIÀ CẦU RỄ CÂY</h3>
                            <strong class="product-price">$78.00</strong>

                            <span class="icon-cross">
                                <img src="images/cross.svg" class="img-fluid">
                            </span>
                        </a>
                    </div>
                    <!-- End Column 3 -->

                    <!-- Start Column 4 -->
                    <div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
                        <a class="product-item" href="cart.jsp">
                            <img src="images/product-3.png" class="img-fluid product-thumbnail">
                            <h3 class="product-title">Lồng Quả Đào Cắt Mặt 3/4 Chân Chạm</h3>
                            <strong class="product-price">$43.00</strong>

                            <span class="icon-cross">
                                <img src="images/cross.svg" class="img-fluid">
                            </span>
                        </a>
                    </div>
                    <!-- End Column 4 -->

                </div>
            </div>
        </div>
        <!-- ##### Main Content Wrapper End ##### -->

        <!-- ##### Newsletter Area Start ##### -->



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

</html>