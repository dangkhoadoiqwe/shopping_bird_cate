<!-- /*
* Bootstrap 5
* Template Name: Furni
* Template Author: Untree.co
* Template URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
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
    <link href="scss/style.css" rel="stylesheet" type="text/css"/>
    <title>Furni Free Bootstrap 5 Template for Furniture and Interior Design Websites by Untree.co </title>
</head>

<body>

<!-- Start Header/Navigation -->
   <jsp:include page="Headeruser.jsp" ></jsp:include>
<!-- End Header/Navigation -->

<!-- Start Hero Section --> <div id="banner">
            <div class="box-left">
                <h2>
                    
                    
                    <span>FURNI</span>
                    <br>
            <span  style="font-size: 16px;">Unique space for bird lovers - Birdcages, the choice of connoisseurs!</span>
        </h2>
        <p>We specialize in providing various types of bird cages for each customer's bird, ensuring the most comfortable space for your birds.</p>
        <button>Shop Now</button>
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
                <h2 class="mb-4 section-title">Birdcage Design with Suitable Materials.</h2>
                <p class="mb-4">Discover the perfect birdcage for your bird! Our selection offers safety and style. Elevate your bird's home today.</p>
                <p><a href="shop.html" class="btn">See More</a></p>
            </div>
            <!-- End Column 1 -->

          <c:forEach var="product" items="${product}">
                                        <div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
						<a class="product-item" href="MainControllner?action=ProDetail&proid=${product.getId()}">
							<img src="${product.getImg()}" class="img-fluid product-thumbnail">
							<h3 class="product-title">${product.getName()}</h3>
							<strong class="product-price">${product.getPrice()}VND</strong>

							<span class="icon-cross">
								<img src="images/cross.svg" class="img-fluid">
							</span>
						</a>
					</div>
                                        </c:forEach>
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
                <h2 class="section-title">Top Birdcages in Vietnam</h2>
                <p>Reliable - Best Prices - Quality</p>

                <div class="row my-5">
                    <div class="col-6 col-md-6">
                        <div class="feature">
                            <div class="icon">
                                <img src="images/truck.svg" alt="Image" class="imf-fluid">
                            </div>
                            <h3>Fast Delivery</h3>
                            <p>Applies to all orders.</p>
                        </div>
                    </div>

                    <div class="col-6 col-md-6">
                        <div class="feature">
                            <div class="icon">
                                <img src="images/bag.svg" alt="Image" class="imf-fluid">
                            </div>
                            <h3>Flexible Payment</h3>
                            <p>Accepts all forms of payment.</p>
                        </div>
                    </div>

                    <div class="col-6 col-md-6">
                        <div class="feature">
                            <div class="icon">
                                <img src="images/support.svg" alt="Image" class="imf-fluid">
                            </div>
                            <h3>24/7 Support</h3>
                            <p>Customer support hotline (8:00 AM - 5:00 PM) Purchase hotline: (+84) 37.251.3251 Delivery - Warranty: (+84) 37.251.3251.</p>
                        </div>
                    </div>

                    <div class="col-6 col-md-6">
                        <div class="feature">
                            <div class="icon">
                                <img src="images/return.svg" alt="Image" class="imf-fluid">
                            </div>
                            <h3>Free Returns</h3>
                            <p>Free returns within 3 days.</p>
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
                <h2 class="section-title mb-4">We Help You Design Modern Birdcages</h2>
                <p>Furni is a store that sells genuine birdcage products and birdcage accessories from the leading Vietnamese artisanal craftsmanship brand. We are confident in our service quality with a dynamic, professional staff who understand customer needs and provide dedicated service.</p>
                <ul class="list-unstyled custom-list my-4">
                    <li>Hotline: 0866 666 888</li>
                    <li>Email: funi@gmail.com</li>
                </ul>
                <p><a href="#" class="btn btn-primary">Contact Us</a></p>
            </div>
        </div>
    </div>
</div>
<!-- End We Help Section -->

<!-- Start Latest Blog Section -->
<div class="latest-blog-section">
    <div class="container">
        <h2 class="section-title">Latest Blog</h2>
        <p class="section-subtitle">Get the latest insights and updates from our blog</p>
        <div class="row">

            <!-- Start Blog Post 1 -->
            <div class="col-12 col-md-4 col-lg-4 mb-4">
                <div class="blog-post">
                    <img src="images/blog-post-1.jpg" alt="Image" class="img-fluid">
                    <h3 class="blog-title"><a href="#">How to Choose the Right Birdcage for Your Bird</a></h3>
                    <p class="blog-meta">By Admin | September 15, 2023</p>
                    <p class="blog-excerpt">Choosing the right birdcage for your feathered friend is crucial for its well-being and happiness. Here are some tips to help you make the right choice.</p>
                </div>
            </div>
            <!-- End Blog Post 1 -->

            <!-- Start Blog Post 2 -->
            <div class="col-12 col-md-4 col-lg-4 mb-4">
                <div class="blog-post">
                    <img src="images/blog-post-2.jpg" alt="Image" class="img-fluid">
                    <h3 class="blog-title"><a href="#">The Benefits of Bird Ownership</a></h3>
                    <p class="blog-meta">By Admin | September 10, 2023</p>
                    <p class="blog-excerpt">Owning a pet bird can be a rewarding experience. Learn about the many benefits of bird ownership and why birds make great companions.</p>
                </div>
            </div>
            <!-- End Blog Post 2 -->

            <!-- Start Blog Post 3 -->
            <div class="col-12 col-md-4 col-lg-4 mb-4">
                <div class="blog-post">
                    <img src="images/blog-post-3.jpg" alt="Image" class="img-fluid">
                    <h3 class="blog-title"><a href="#">Tips for Training Your Pet Bird</a></h3>
                    <p class="blog-meta">By Admin | September 5, 2023</p>
                    <p class="blog-excerpt">Training your pet bird can be a fun and rewarding experience. Check out these tips to help you effectively train your feathered friend.</p>
                </div>
            </div>
            <!-- End Blog Post 3 -->

        </div>
    </div>
</div>
<!-- End Latest Blog Section -->

<!-- Start Footer -->
        <jsp:include page="footer.jsp" ></jsp:include>
<!-- End Cart Sidebar -->

<!-- Start Overlay -->
<div class="overlay"></div>
<!-- End Overlay -->

<!-- Start JavaScript -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/tiny-slider.js"></script>
<script src="js/tiny-slider-init.js"></script>
<script src="js/script.js"></script>
<!-- End JavaScript -->

</body>
</html>
