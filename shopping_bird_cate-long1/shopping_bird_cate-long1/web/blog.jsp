<%-- 
    Document   : blog
    Created on : 19-09-2023, 22:18:39
    Author     : Quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <!-- Start Header/Navigation -->
      <header>
            <%@include file="headerGuest.jsp"%>
        </header>
        <!-- End Header/Navigation -->

        <!-- Start Hero Section -->
<!--        <div class="hero">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-lg-5">
                        <div class="intro-excerpt">
                            <h1>Blog</h1>
                            <p class="mb-4">Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam vulputate velit imperdiet dolor tempor tristique.</p>
                            <p><a href="" class="btn btn-secondary me-2">Shop Now</a><a href="#" class="btn btn-white-outline">Explore</a></p>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="hero-img-wrap">
                            <img src="images/couch.png" class="img-fluid">
                        </div>
                    </div>
                </div>
            </div>
        </div>-->
        <!-- End Hero Section -->



        <!-- Start Blog Section -->
        <div class="blog-section">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-md-6">
                        <h2 class="section-title"> Blog</h2>
                    </div>
                    <div class="col-md-6 text-start text-md-end">
                        <a href="blog.jsp" class="more">Xem thêm</a>
                    </div>
                </div>

                <div class="row">

                    <div class="col-12 col-sm-6 col-md-4 mb-4 mb-md-0">
                        <div class="post-entry">
                            <a href="#" class="post-thumbnail"><img src="images/post-4.jpg" alt="Image" class="img-fluid"></a>
                            <div class="post-content-entry">
                                <h3><a href="#">Lồng chim độc đáo</a></h3>
                                <div class="meta">
                                    <span>by <a href="#">Quang</a></span> <span>on <a href="#">19-12, 2021</a></span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-sm-6 col-md-4 mb-4 mb-md-0">
                        <div class="post-entry">
                            <a href="#" class="post-thumbnail"><img src="images/post-2.jpg" alt="Image" class="img-fluid"></a>
                            <div class="post-content-entry">
                                <h3><a href="#">Môi trường sống động </a></h3>
                                <div class="meta">
                                    <span>by <a href="#">Quang</a></span> <span>on <a href="#"> 15-12, 2021</a></span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-sm-6 col-md-4 mb-4 mb-md-0">
                        <div class="post-entry">
                            <a href="#" class="post-thumbnail"><img src="images/img-grid-12.jpg" alt="Image" class="img-fluid"></a>
                            <div class="post-content-entry">
                                <h3><a href="#">Không gian độc đáo cho những đôi cánh</a></h3>
                                <div class="meta">
                                    <span>by <a href="#">Quang</a></span> <span>on <a href="#">12 12, 2021</a></span>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- End Blog Section -->	



        <!-- Start Testimonial Slider -->
        <div class="testimonial-section before-footer-section">
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
                                <!-- END item -->

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
                                <!-- END item -->

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
                                <!-- END item -->

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Testimonial Slider -->



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
                                    <li><a href="csMua.jsp">Chính sách mua hàng</a></li>
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


        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/tiny-slider.js"></script>
        <script src="js/custom.js"></script>
    </body>

</html>