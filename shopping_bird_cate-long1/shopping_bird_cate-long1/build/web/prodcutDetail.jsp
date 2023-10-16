
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Aroma Shop - Product Details</title>
        <link rel="icon" href="pro-detail/vendorsimg/Fevicon.png" type="image/png">
        <link rel="stylesheet" href="pro-detail/pro-detail/vendors/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="pro-detail/vendors/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="pro-detail/vendors/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="pro-detail/vendors/linericon/style.css">
        <link rel="stylesheet" href="pro-detail/vendors/nice-select/nice-select.css">
        <link rel="stylesheet" href="pro-detail/vendors/owl-carousel/owl.theme.default.min.css">
        <link rel="stylesheet" href="pro-detail/vendors/owl-carousel/owl.carousel.min.css">


        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="css/tiny-slider.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/sty.css">
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
                            <h1>SHOPPING</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ================ end banner area ================= -->

        
        <!--================Single Product Area =================-->
        <div class="product_image_area">
            <div class="container">
                <div class="row s_product_inner">
                    <div class="col-lg-6">
                        <div class="owl-carousel owl-theme s_Product_carousel">
                            <div class="single-prd-item">
                                <img class="img-fluid" src="images/product-1.png" alt="">
                            </div>
                            <!-- <div class="single-prd-item">
                                    <img class="img-fluid" src="img/category/s-p1.jpg" alt="">
                            </div>
                            <div class="single-prd-item">
                                    <img class="img-fluid" src="img/category/s-p1.jpg" alt="">
                            </div> -->
                        </div>
                    </div>
                    <div class="col-lg-5 offset-lg-1">
                        <div class="s_product_text">
                            <h3>Faded SkyBlu Denim Jeans</h3>
                            <h2>$149.99</h2>
                            <ul class="list">
                                <li><a class="active" href="#"><span>Category</span> : Household</a></li>
                                <li><a href="#"><span>Availibility</span> : In Stock</a></li>
                            </ul>
                            <p>Mill Oil is an innovative oil filled radiator with the most modern technology. If you are looking for
                                something that can make your interior look awesome, and at the same time give you the pleasant warm feeling
                                during the winter.</p>
                            <div class="product_count">
                                <label for="qty">Quantity:</label>
                                <button onclick="var result = document.getElementById('sst');
                                        var sst = result.value;
                                        if (!isNaN(sst))
                                            result.value++;
                                        return false;"
                                        class="increase items-count" type="button"><i class="ti-angle-left"></i></button>
                                <input type="text" name="qty" id="sst" size="2" maxlength="12" value="1" title="Quantity:" class="input-text qty">
                                <button onclick="var result = document.getElementById('sst'); var sst = result.value; if (!isNaN(sst) & amp; & amp; sst > 0) result.value--; return false;"
                                        class="reduced items-count" type="button"><i class="ti-angle-right"></i></button>
                                <a class="btn amado-btn" href="#">Add to Cart</a>               
                            </div>
                            <div class="card_area d-flex align-items-center">
                                <a class="icon_btn" href="#"><i class="lnr lnr lnr-diamond"></i></a>
                                <a class="icon_btn" href="#"><i class="lnr lnr lnr-heart"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <section class="product_description_area">
            <div class="container">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    
                    <li class="nav-item">
                        <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
                           aria-selected="false">Đánh giá </a>
                    </li>
                  
                </ul>
               
                    <div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
                        <div class="row">
                            <div class="col-lg-12">
                                
                                <div class="review_list">
                                    <div class="review_item">
                                        <div class="media">
                                            <div class="d-flex">
                                                <img src="pro-detail/img/product/review-1.png" alt="">
                                            </div>
                                            <div class="media-body">
                                                <h4>Blake Ruiz</h4>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                        </div>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                                            dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
                                            commodo</p>
                                    </div>
                                    <div class="review_item">
                                        <div class="media">
                                            <div class="d-flex">
                                                <img src="img/product/review-2.png" alt="">
                                            </div>
                                            <div class="media-body">
                                                <h4>Blake Ruiz</h4>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                        </div>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                                            dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
                                            commodo</p>
                                    </div>
                                    <div class="review_item">
                                        <div class="media">
                                            <div class="d-flex">
                                                <img src="img/product/review-3.png" alt="">
                                            </div>
                                            <div class="media-body">
                                                <h4>Blake Ruiz</h4>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                        </div>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                                            dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
                                            commodo</p>
                                    </div>
                                </div>
                            </div>
                      
                        </div>
                    </div>
                </div>
            </div>
        </section>
    <jsp:include page="footer.jsp" ></jsp:include>



        <script src="pro-detail/vendors/jquery/jquery-3.2.1.min.js"></script>
        <script src="pro-detail/vendors/bootstrap/bootstrap.bundle.min.js"></script>
        <script src="pro-detail/vendors/skrollr.min.js"></script>
        <script src="pro-detail/vendors/owl-carousel/owl.carousel.min.js"></script>
        <script src="pro-detail/vendors/nice-select/jquery.nice-select.min.js"></script>
        <script src="pro-detail/vendors/jquery.ajaxchimp.min.js"></script>
        <script src="pro-detail/vendors/mail-script.js"></script>
        <script src="pro-detail/js/main.js"></script>
    </body>
</html>