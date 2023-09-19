<%-- 
    Document   : homePage
    Created on : Sep 18, 2023, 11:32:35 AM
    Author     : hailo
--%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="css/tiny-slider.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="scss/style.css" rel="stylesheet" type="text/css"/>
        <title>Furni Free Bootstrap 5 Template for Furniture and Interior Design Websites by Untree.co </title>
    </head>
    <body>
        <header>
            <%@include file="headerGuest.jsp"%>
        </header>
        <!-- Start Hero Section -->
        <div id="banner">
            <div class="box-left">
                <h2>


                    <span>FURNI</span>
                    <br>
                    <span  style="font-size: 16px;">Không gian độc đáo cho những đôi cánh - Lồng chim, đẳng cấp dân chơi!</span>

                </h2>

                <p>Chuyên cung cấp các loại lồng chim cho từng loại chim của khách hàng giúp cho chim của khách hàng có 1 không gian thoải mái nhất</p>

                <button>Mua ngay</button>
            </div>
            <div class="to-bottom">
                <a href="">
                    <img src="assets/to_bottom.png" alt="">
                </a>
            </div>
        </div>
        <!-- End Hero Section -->

        <!-- Start Product Section -->
        <div class="product-section">
            <div class="container">
                <div class="row">

                    <!-- Start Column 1 -->
                    <div class="col-md-12 col-lg-3 mb-5 mb-lg-0">
                        <h2 class="mb-4 section-title">Thiết kế lồng chim với các nguyên liệu phù hợp.</h2>
                        <p class="mb-4">Khám phá chiếc lồng hoàn hảo cho chú chim của bạn! Lựa chọn của chúng tôi mang đến sự an toàn và phong cách. Hãy nâng tầm ngôi nhà cho chú chim của bạn ngay hôm nay. </p>
                        <p><a href="shop.html" class="btn">Xem thêm</a></p>
                    </div> 
                    <!-- End Column 1 -->

                    <!-- Start Column 2 -->
                    <div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
                        <a class="product-item" href="cart.html">
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
                        <a class="product-item" href="cart.html">
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
                        <a class="product-item" href="cart.html">
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
        <!-- End Product Section -->

        <!-- Start Why Choose Us Section -->
        <div class="why-choose-section">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-lg-6">
                        <h2 class="section-title">Lồng chim hàng đầu Việt Nam</h2>
                        <p>Uy tín - Giá tốt nhất - chất lượng</p>

                        <div class="row my-5">
                            <div class="col-6 col-md-6">
                                <div class="feature">
                                    <div class="icon">
                                        <img src="images/truck.svg" alt="Image" class="imf-fluid">
                                    </div>
                                    <h3>Giao hàng nhanh</h3>
                                    <p>Áp dụng cho mọi đơn hàng.</p>
                                </div>
                            </div>

                            <div class="col-6 col-md-6">
                                <div class="feature">
                                    <div class="icon">
                                        <img src="images/bag.svg" alt="Image" class="imf-fluid">
                                    </div>
                                    <h3>Thanh toán linh hoạt</h3>
                                    <p> Nhận mọi hình thức thanh toán.</p>
                                </div>
                            </div>

                            <div class="col-6 col-md-6">
                                <div class="feature">
                                    <div class="icon">
                                        <img src="images/support.svg" alt="Image" class="imf-fluid">
                                    </div>
                                    <h3>24/7 Support</h3>
                                    <p>Tổng đài hỗ trợ (8h00 - 17h00)  Tổng đài mua hàng: (+84) 37.251.3251 Giao nhận - Bảo hành: (+84) 37.251.3251.</p>
                                </div>
                            </div>

                            <div class="col-6 col-md-6">
                                <div class="feature">
                                    <div class="icon">
                                        <img src="images/return.svg" alt="Image" class="imf-fluid">
                                    </div>
                                    <h3>Đổi trả</h3>
                                    <p>Đổi trả miễn phí trong vòng 3 ngày</p>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="col-lg-5">
                        <div class="img-wrap">
                            <img src="images/why-choose-us-img.jpg" alt="Image" class="img-fluid">
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- End Why Choose Us Section -->

        <!-- Start We Help Section -->
        <div class="we-help-section">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-lg-7 mb-5 mb-lg-0">
                        <div class="imgs-grid">
                            <div class="grid grid-1"><img src="images/img-grid1.jpg" alt=""></div>
                            <div class="grid grid-2"><img src="images/img-grid2.jpg" alt=""></div>
                            <div class="grid grid-3"><img src="images/img-grid3.jpg" alt=""></div>
                        </div>
                    </div>
                    <div class="col-lg-5 ps-lg-5">
                        <h2 class="section-title mb-4">Chúng tôi giúp bạn thiết kế lồng chim hiện đại</h2>
                        <p>Funi là cửa hàng sản phẩm lồng chim, phụ kiện lồng chim chính hãng từ  thương hiệu làng nghề thủ công mỹ nghệ hàng đầu Việt Nam Tự tin khẳng định chất lượng phục vụ với đội ngũ nhân viên năng động, chuyên nghiệp có khả năng am hiểu nhu cầu khách hàng cùng như thái độ phục vụ tận tụy.</p>

                        <ul class="list-unstyled custom-list my-4">
                            <li>Hotline: 0866 666 888</li>
                            <li>Email: furi@gmail.com</li>

                        </ul>
                        <p><a href="#" class="btn">Xem thêm</a></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- End We Help Section -->

        <!-- Start Popular Product -->
        <div class="popular-product">
            <div class="container">
                <div class="row">

                    <div class="col-12 col-md-6 col-lg-4 mb-4 mb-lg-0">
                        <div class="product-item-sm d-flex">
                            <div class="thumbnail">
                                <img src="images/product-1.png" alt="Image" class="img-fluid">
                            </div>
                            <div class="pt-3">
                                <h3>Lồng vuông chào mào khung gỗ</h3>
                                <p>Lồng chim được thiết kế với ý tưởng mới lạ và độc đáo. Những chi tiết và hoa văn trên lồng mang đến vẻ đẹp tinh tế và sự ấn tượng cho không gian sống của chim cảnh. </p>
                                <p><a href="#">Read More</a></p>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-md-6 col-lg-4 mb-4 mb-lg-0">
                        <div class="product-item-sm d-flex">
                            <div class="thumbnail">
                                <img src="images/product-2.png" alt="Image" class="img-fluid">
                            </div>
                            <div class="pt-3">
                                <h3>Lồng chum chống</h3>
                                <p>Hình dáng độc đáo: Lồng có thiết kế đáy tròn cầu rễ, tạo nên một diện mạo độc đáo và thu hút. Điều này mang lại sự khác biệt và độc đáo cho lồng chum chào mào. </p>
                                <p><a href="#">Read More</a></p>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-md-6 col-lg-4 mb-4 mb-lg-0">
                        <div class="product-item-sm d-flex">
                            <div class="thumbnail">
                                <img src="images/product-3.png" alt="Image" class="img-fluid">
                            </div>
                            <div class="pt-3">
                                <h3>Lồng quả đào 3/4</h3>
                                <p>Thiết kế độc đáo sang chảnh, chất lượng cao bền bỉ  </p>
                                <p><a href="#">Read More</a></p>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- End Popular Product -->

        <!-- Start Testimonial Slider -->
        <!--        <div class="testimonial-section">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-7 mx-auto text-center">
                                <h2 class="section-title">Testimonials</h2>
                            </div>
                        </div>
        
                        <div class="row justify-content-center">
                            <div class="col-lg-12">
                                <div class="testimonial-slider-wrap text-center">
        
                                    <div id="testimonial-nav">
                                        <span class="prev" data-controls="prev"><span class="fa fa-chevron-left"></span></span>
                                        <span class="next" data-controls="next"><span class="fa fa-chevron-right"></span></span>
                                    </div>
        
                                    <div class="testimonial-slider">
        
                                        <div class="item">
                                            <div class="row justify-content-center">
                                                <div class="col-lg-8 mx-auto">
        
                                                    <div class="testimonial-block text-center">
                                                        <blockquote class="mb-5">
                                                            <p>&ldquo;Donec facilisis quam ut purus rutrum lobortis. Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam vulputate velit imperdiet dolor tempor tristique. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer convallis volutpat dui quis scelerisque.&rdquo;</p>
                                                        </blockquote>
        
                                                        <div class="author-info">
                                                            <div class="author-pic">
                                                                <img src="images/person-1.png" alt="Maria Jones" class="img-fluid">
                                                            </div>
                                                            <h3 class="font-weight-bold">Maria Jones</h3>
                                                            <span class="position d-block mb-3">CEO, Co-Founder, XYZ Inc.</span>
                                                        </div>
                                                    </div>
        
                                                </div>
                                            </div>
                                        </div> 
                                         END item 
        
                                        <div class="item">
                                            <div class="row justify-content-center">
                                                <div class="col-lg-8 mx-auto">
        
                                                    <div class="testimonial-block text-center">
                                                        <blockquote class="mb-5">
                                                            <p>&ldquo;Donec facilisis quam ut purus rutrum lobortis. Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam vulputate velit imperdiet dolor tempor tristique. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer convallis volutpat dui quis scelerisque.&rdquo;</p>
                                                        </blockquote>
        
                                                        <div class="author-info">
                                                            <div class="author-pic">
                                                                <img src="images/person-1.png" alt="Maria Jones" class="img-fluid">
                                                            </div>
                                                            <h3 class="font-weight-bold">Maria Jones</h3>
                                                            <span class="position d-block mb-3">CEO, Co-Founder, XYZ Inc.</span>
                                                        </div>
                                                    </div>
        
                                                </div>
                                            </div>
                                        </div> 
                                         END item 
        
                                        <div class="item">
                                            <div class="row justify-content-center">
                                                <div class="col-lg-8 mx-auto">
        
                                                    <div class="testimonial-block text-center">
                                                        <blockquote class="mb-5">
                                                            <p>&ldquo;Donec facilisis quam ut purus rutrum lobortis. Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam vulputate velit imperdiet dolor tempor tristique. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer convallis volutpat dui quis scelerisque.&rdquo;</p>
                                                        </blockquote>
        
                                                        <div class="author-info">
                                                            <div class="author-pic">
                                                                <img src="images/person-1.png" alt="Maria Jones" class="img-fluid">
                                                            </div>
                                                            <h3 class="font-weight-bold">Maria Jones</h3>
                                                            <span class="position d-block mb-3">CEO, Co-Founder, XYZ Inc.</span>
                                                        </div>
                                                    </div>
        
                                                </div>
                                            </div>
                                        </div> 
                                         END item 
        
                                    </div>
        
                                </div>
                            </div>
                        </div>
                    </div>
                </div>-->
        <!-- End Testimonial Slider -->

        <!-- Start Blog Section -->
        <div class="blog-section">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-md-6">
                        <h2 class="section-title">Recent Blog</h2>
                    </div>
                    <div class="col-md-6 text-start text-md-end">
                        <a href="#" class="more">View All Posts</a>
                    </div>
                </div>

                <div class="row">

                    <div class="col-12 col-sm-6 col-md-4 mb-4 mb-md-0">
                        <div class="post-entry">
                            <a href="#" class="post-thumbnail"><img src="images/post-4.jpg" alt="Image" class="img-fluid"></a>
                            <div class="post-content-entry">
                                <h3><a href="#">First Time Home Owner Ideas</a></h3>
                                <div class="meta">
                                    <span>by <a href="#">Kristin Watson</a></span> <span>on <a href="#">Dec 19, 2021</a></span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-sm-6 col-md-4 mb-4 mb-md-0">
                        <div class="post-entry">
                            <a href="#" class="post-thumbnail"><img src="images/post-2.jpg" alt="Image" class="img-fluid"></a>
                            <div class="post-content-entry">
                                <h3><a href="#">How To Keep Your Furniture Clean</a></h3>
                                <div class="meta">
                                    <span>by <a href="#">Robert Fox</a></span> <span>on <a href="#">Dec 15, 2021</a></span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-sm-6 col-md-4 mb-4 mb-md-0">
                        <div class="post-entry">
                            <a href="#" class="post-thumbnail"><img src="images/img-grid-12.jpg" alt="Image" class="img-fluid"></a>
                            <div class="post-content-entry">
                                <h3><a href="#">Small Space Furniture Apartment Ideas</a></h3>
                                <div class="meta">
                                    <span>by <a href="#">Kristin Watson</a></span> <span>on <a href="#">Dec 12, 2021</a></span>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- End Blog Section -->	

        <!-- Start Footer Section -->
        <footer class="footer-section">
            <div class="container relative">

                <div class="sofa-img">
                    <!--<img src="" alt="Image" class="img-fluid">-->
                </div>

                <div class="row">
                    <div class="col-lg-8">
                        <div class="subscription-form">
                            <h3 class="d-flex align-items-center"><span class="me-1"><img src="images/envelope-outline.svg" alt="Image" class="img-fluid"></span><span>Subscribe to Newsletter</span></h3>

                            <form action="#" class="row g-3">
                                <div class="col-auto">
                                    <input type="text" class="form-control" placeholder="Enter your name">
                                </div>
                                <div class="col-auto">
                                    <input type="email" class="form-control" placeholder="Enter your email">
                                </div>
                                <div class="col-auto">
                                    <button class="btn btn-primary">
                                        <span class="fa fa-paper-plane"></span>
                                    </button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>

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
                                    <li><a href="#">Giới thiệu</a></li>
                                    <li><a href="#">Sản phẩm</a></li>
                                    <li><a href="#">Blog</a></li>
                                    <li><a href="#">Liên hệ</a></li>
                                </ul>
                            </div>

                            <div class="col-6 col-sm-6 col-md-4">
                                <ul class="list-unstyled">
                                    <li><a style = color:red;>Chính sách</a></li>
                                    <li><a href="#">Chính sách đổi trả</a></li>
                                    <li><a href="#">Chính sách mua hàng</a></li>
                                    <li><a href="#">Chính sách bảo mật</a></li>
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

                <div class="border-top copyright">
                    <div class="row pt-4">
                        <div class="col-lg-6">
                            <p class="mb-2 text-center text-lg-start">Copyright &copy;<script>document.write(new Date().getFullYear());</script>. All Rights Reserved. &mdash; Designed with love by <a href="https://untree.co">Untree.co</a> Distributed By <a href="https://themewagon.com">ThemeWagon</a>  <!-- License information: https://untree.co/license/ -->
                            </p>
                        </div>

                        <div class="col-lg-6 text-center text-lg-end">
                            <ul class="list-unstyled d-inline-flex ms-auto">
                                <li class="me-4"><a href="#">Terms &amp; Conditions</a></li>
                                <li><a href="#">Privacy Policy</a></li>
                            </ul>
                        </div>

                    </div>
                </div>

            </div>
        </footer>
        <!-- End Footer Section -->	


        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/tiny-slider.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>
