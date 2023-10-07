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
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
   <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js">
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js">
         </script>
        <title>Amado - Furniture Ecommerce Template | Product Details</title>

        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/favicon.ico">

        <!-- Core Style CSS -->
        <link rel="stylesheet" href="css/core-style.css">
        <link rel="stylesheet" href="style.css">
 <link href="scss/login.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
       
                 <nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="Furni navigation bar">

            <div class="container">
                <a class="navbar-brand" href="homePage.jsp">Furni<span>.</span></a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni" aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarsFurni">
                    <ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
                        <li class="nav-item active">
                            <a class="nav-link" href="homePage.jsp">Trang chủ</a>
                        </li>
                        <li><a class="nav-link" href="shop.jsp">Cửa hàng</a></li>
                        <li><a class="nav-link" href="blog.jsp">Blog</a></li>
                        <li><a class="nav-link" href="contact.jsp">Liên hệ</a></li>
                    </ul>
                    <!--                                        Thêm menu "Setting" -->
                    <ul>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="settingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="margin-top:15px;color:#ffffff; ">
                                Tôi
                            </a>
                            <ul class="dropdown-menu " aria-labelledby="settingDropdown">
                                <li><a class="dropdown-item" href="Profile.jsp">Profile</a></li>
                                <li><a class="dropdown-item" href="delivery.jsp">Đơn hàng</a></li>
                                <li><a class="dropdown-item" href="history.jsp">Lịch sử thanh toán</a></li>
                                <li><a class="dropdown-item" href="homePage.jsp">Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                    
                    <ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
                        <li><a class="cd-signin" href="#"><img style =" margin-top:12px" src="images/user.svg"></a></li>
                        <li><a class="nav-link" href="cart.jsp"><img src="images/cart.svg"></a></li>
                    </ul>
                </div>
            </div>

        </nav>

          
       

        

            <!-- Header Area Start -->

            <!-- Header Area End -->

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
                                            <a class="gallery_img" href="cart.jsp">
                                                <img class="d-block w-100" src="images/product-1.png" alt="First slide" style="border-radius: 15px;">
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
                                    <p class="product-price">100.000VND</p>
                                    <a href="product-details.html">
                                        <h6>Bird Cage</h6>
                                    </a>
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
                                            <a  class="search-nav" href="comparepro.jsp">SO SÁNH</a>
                                        </div>
                                    </div>
                                    <!-- Avaiable -->
                                    <p class="avaibility"><i class="fa fa-circle"></i>Active</p>
                                </div>

                                <div class="short_overview my-5">
                                   <h3>Bird Bath for Various Bird Types - Chào Mào Bird Bath - Phíp Bird Bath with Aluminum Tray</h3>
    <p>This product is a sturdy and durable bird bath suitable for various bird types, especially for chào mào birds. Each bath comes with an aluminum tray for holding bird bathwater.</p>
    <p><strong>Product Details:</strong></p>
    <ul>
        <li>Material: Sturdy wooden frame with flexible plastic bath and a clean and durable aluminum tray.</li>
        <li>Color: Plum Red.</li>
        <li>Dimensions: Length 40cm - Width 30cm - Height 38cm (with legs 12cm high).</li>
    </ul>
    
                                </div>
                                
                                <!-- Add to Cart Form -->
                                <form class="cart clearfix" method="get" action="addtocart">
                                    <div class="cart-btn d-flex mb-50" >
                                         <input type="hidden" name="productId"  ">
                                        <p>SL</p>
                                        <div class="quantity" >
                                            
                                            <input type="number" class="qty-text" id="qty" step="1" min="1" max="30" name="quantity" value="1">
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
                                    <button type="submit"   href="cart.jsp" class="btn amado-btn" >Add to cart</button>
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

        <footer>
            <%@include file="footer.jsp" %>
        </footer>  

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