

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <!-- End Header/Navigation -->

        <!-- Start Hero Section -->
        <div class="hero">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-lg-5">
                        <div class="intro-excerpt">
                            <h1>Cart</h1>
                        </div>
                    </div>
                    <div class="col-lg-7">

                    </div>
                </div>
            </div>
        </div>
        <!-- End Hero Section -->



        <div class="untree_co-section before-footer-section">
            <div class="container">
                <div class="row mb-5">
                    <form class="col-md-12" method="post">
                        <div class="site-blocks-table">
                            <table class="table">
                                <thead>
                                    <tr>
                                         
                                        <th class="product-thumbnail">Image</th>
                                        <th class="product-name">Product</th>
                                        <th class="product-price">Price</th>
                                        <th class="product-quantity">Quantity</th>
                                        <th class="product-total">Total</th>
                                        <th class="product-checkbox">
                                            
                                            <label for="selectAll"> <a>Remove  </a> </label>
                                        </th>
                                    </tr>
                                </thead>
                                <c:forEach var="cart" items="${sessionScope.cart.getItems()}">
                                       
                                    <tbody>
                                        <tr>
                                           
                                            <td class="product-thumbnail">
                                                <img src="${cart.getProduct().getImage()}" alt="Image" class="img-fluid">
                                            </td>
                                            <td class="product-name">
                                                <h2 class="h5 text-black"><a href="MainController?action=ProDetail&proid=${cart.getProduct().getId()}">${cart.getProduct().getName()}</a> </h2>
                                            </td>
                                            <td>${cart.getProduct().getPrice()}</td>

                                            <td>
                                                <div class="quantity-box type1">
                                                    <div class="qty-input">
                                                        <a href="ChangeCartQuantity?pid=${cart.getProduct().getId()}&quantity=${cart.getQuantity()-1}">-</a>
                                                        ${cart.getQuantity()}
                                                        <a href="ChangeCartQuantity?pid=${cart.getProduct().getId()}&quantity=${cart.getQuantity()+1}">+</a>

                                                    </div>
                                                </div>


                                            </td>
                                            <td>${cart.getProduct().getPrice()*cart.getQuantity()} VND</td>
                                            <td><a href="removefromcart?productId=${cart.getProduct().getId()}" class="btn btn-black btn-sm">X</a></td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </form>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="row mb-5">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <a  href="removeallfromcart"><button class="btn btn-outline-black btn-sm btn-block" > Remove all</button>  </a>
                            </div>
                            <div class="col-md-6" >
                                <a href="MainController?action=shop" > <button class="btn btn-outline-black btn-sm btn-block" >Continue Shopping</button></a>
                            </div>
                        </div>
                        
                    </div>
                    <div class="col-md-6 pl-5">
                        <div class="row justify-content-end">
                            <div class="col-md-7">
                                <div class="row">
                                    <div class="col-md-12 text-right border-bottom mb-5">
                                        <h3 class="text-black h4 text-uppercase">Cart Totals</h3>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <span class="text-black">Subtotal</span>
                                    </div>
                                    <c:if test="${sessionScope.cart.getItems().size()!=0}">
                                        <div class="col-md-6 text-right">
                                            <strong class="text-black">${sessionScope.cart.getTotalBill()}VND</strong>
                                        </div>
                                    </div>
                                    <div class="row mb-5">
                                        <div class="col-md-6">
                                            <span class="text-black">Total</span>
                                        </div>
                                        <div class="col-md-6 text-right">
                                            <strong class="text-black">${sessionScope.cart.getTotalBill()}VND</strong>
                                        </div>
                                    </div>


                                    <div class="row mb-5">
                                        <div class="col-md-6">
                                            <span class="text-black">Total</span>
                                        </div>
                                        <div class="col-md-6 text-right">
                                            <strong class="text-black">${sessionScope.cart.getTotalBill()}VND</strong>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <c:choose>
                                                <c:when test="${sessionScope.account.role == 1}">
                                                    <button class="btn btn-black btn-lg py-3 btn-block" type="button" onclick="window.location.href = 'checkout?accid=${sessionScope.account.id}&code=EMW'">Check Out</button>
                                                </c:when>
                                                
                                            </c:choose>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Start Footer Section -->
        <jsp:include page="footer.jsp" ></jsp:include>
        <!-- End Footer Section -->	


        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/tiny-slider.js"></script>
        <script src="js/custom.js"></script>
    </body>

</html>
