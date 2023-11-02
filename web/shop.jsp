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
                </div>
            </div>
        </div>
        <div style="text-align: center; font-size: 24px;">
            <c:if test="${mess!=null}">
                ${mess}

            </c:if>
        </div>


        <div class="untree_co-section product-section before-footer-section" >


            <div class="container-fluid bg-gradient p-5">
                <div class="row m-auto text-center">
                    <aside class="col-md-4">
                        <div class="card">
                            <article class="filter-group">
                                <header class="card-header">
                                    <h6 class="title">Loại </h6>
                                </header>
                                <div style="font-size: 24px;"> <a class="nav-link" href="MainController?action=shop">Tất cả</a></div>
                                <div class="filter-content collapse show" id="collapse_3" style="">
                                    <div class="card-body list-group-flush">
                                        <c:forEach items="${listCategory}" var="c">
                                            <a class="list-group-item list-group-item-action" 
                                               href="MainController?action=SEARCH_PRO&cid=${c.getCategoryId()}">${c.getCategoryName()}</a>
                                        </c:forEach>
                                    </div>  
                                </div>
                            </article>
                            <article class="filter-group">
                                <header class="card-header">
                                    <h6 class="title">Tiềm kiếm </h6>
                                </header>
                                <div class="filter-content collapse show" id="collapse_3" style="">
                                    <div class="card-body">
                                        <form action="searchcontrollner" method="get" onsubmit="return validateForm()">
                                            <input type="search"   name="txt" id="search" placeholder="Type your keyword...">
                                            <br>
                                            <br>
                                            <article class="filter-group">
                                                <header class="card-header">
                                                    <h6 class="title">Phạm vi</h6>
                                                </header>
                                                <div class="filter-content collapse show" id="collapse_3" style="">
                                                    <div class="card-body">

                                                        <div class="row">
                                                            <div class="form-group col-md-6">
                                                                <label  for="maxPrice">Min Price:</label>
                                                                <br>
                                                                <input type="number"  name="minPrice"  id="minPrice" min="0" max="100000" step="1000" value="0" oninput="checkMinMax()">
                                                            </div>
                                                            <div class="form-group text-right col-md-6">
                                                                <label  for="maxPrice">Max Price:</label>
                                                                <input type="number"   name="maxPrice" id="maxPrice" min="0"   step="10000" value="1000" oninput="checkMinMax()">
                                                            </div>
                                                        </div>
                                                        <br>
                                                        <button type="submit"><img src="images/search.png" alt="">Search</button>
                                                        </form
                                                    </div>
                                                </div>
                                            </article>
                                        </form>
                                    </div>  
                                </div>
                            </article>
                    </aside>
                    <div class="col-md-8">
                        <div class="container">
                            <div class="row">
                                <c:forEach var="product" items="${c}">
                                    <div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
                                        <a class="product-item" href="MainController?action=ProDetail&proid=${product.getId()} ">
                                            <img src="images/${product.getImage()}" class="img-fluid product-thumbnail" style="border-radius: 15px;">
                                            <h3 class="product-title">${product.getName()}</h3>
                                            <strong class="product-price">${product.getPrice()}VND</strong>

                                            <span class="icon-cross" >
                                                <img src="images/cross.svg" class="img-fluid">
                                            </span>
                                        </a>
                                    </div>
                                </c:forEach>

                            </div>

                        </div>
                    </div>
                </div>
            </div>


        </div>


        <!-- Start Footer Section -->
        <footer class="footer-section">
            <jsp:include page="footer.jsp"/>   
        </footer>
        <!-- End Footer Section -->	

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
                return true;
            }
        </script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/tiny-slider.js"></script>
        <script src="js/custom.js"></script>
    </body>

</html>
