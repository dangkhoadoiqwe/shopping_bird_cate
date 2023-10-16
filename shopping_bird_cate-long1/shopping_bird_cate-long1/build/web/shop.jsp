<%-- 
    Document   : shop
    Created on : 19-09-2023, 22:16:09
    Author     : Quang
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

        <!-- Start Header/Navigation -->
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
                        <div class="col-lg-7">
                            <div class="search-content">
                                <form action="searchcontrollner" method="get" onsubmit="return validateForm()">
                                    <input type="search" style="border-radius: 15px;" name="txt" id="search" placeholder="Type your keyword...">
                                    <label style="color: white;border-radius: 15px;" for="minPrice">Min Price:</label>
                                    <input type="number" style="border-radius: 15px;" name="minPrice"  id="minPrice" min="0" max="1000" step="100" value="0" oninput="checkMinMax()">
                                    <label style="color: white ;border-radius: 15px;" for="maxPrice">Max Price:</label>
                                    <input type="number" style="border-radius: 15px;" name="maxPrice" id="maxPrice" min="0" max="1000" step="100" value="1000" oninput="checkMinMax()">
                                    <button type="submit" style="border-radius: 15px;"><img src="images/search.png" alt="">Search</button>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



        <div class="untree_co-section product-section before-footer-section">
            <div class="container">
                <div class="row">

                    <!-- Start Column 1 -->
               
                    <!-- End Column 1 -->
                    <c:forEach var="product" items="${c}">
                            <div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
                                <a class="product-item" href="MainController?action=ProDetail&proid=${product.getId()} ">
                                    <img src="${product.getImage()}" class="img-fluid product-thumbnail" style="border-radius: 15px;">
                                    <h3 class="product-title">${product.getName()}</h3>
                                    <strong class="product-price">${product.getPrice()}VND</strong>

                                    <span class="icon-cross" >
                                        <img src="images/cross.svg" class="img-fluid">
                                    </span>
                                </a>
                            </div>
                        </c:forEach>
                    <!-- Start Column 2 -->
                   
                    <!-- End Column 4 -->

                </div>
            </div>
        </div>


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
        <script>
    function checkMinMax() {
      var minPriceInput = document.getElementById("minPrice");
      var maxPriceInput = document.getElementById("maxPrice");

      var minPrice = parseInt(minPriceInput.value);
      var maxPrice = parseInt(maxPriceInput.value);

      if (minPrice > maxPrice) {
        maxPriceInput.setCustomValidity("Max Price should be greater than or equal to Min Price");
      } else {
        maxPriceInput.setCustomValidity(""); // Xóa thông báo l?i
      }
    }

    function validateForm() {
      // X? lý ki?m tra form t?i ?ây (n?u c?n)

      // N?u form h?p l?, ti?p t?c x? lý form ho?c g?i d? li?u lên máy ch?
      return true;
    }
  </script>
    </body>

</html>
