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
          <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet">
        <title>Furni Free Bootstrap 5 Template for Furniture and Interior Design Websites by Untree.co </title>
    </head>

    <body>
        <header> 
        <!-- Start Header/Navigation -->
       <c:choose>
            <c:when test="${sessionScope.account.roles == 1}">
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
                                <h1>SHOPPING</h1>
                            </div>
                        </div>
                        <div class="col-lg-7">
                            <div class="search-content">
                                <form action="searchcontrollner" method="get">
                                    <input type="search" style="border-radius: 15px;" name="txt" id="search" placeholder="Type your keyword...">
                                    <label style="color: white;border-radius: 15px;" for="minPrice">Min Price:</label>
                                    <input type="number" style="border-radius: 15px;" name="minPrice"  id="minPrice" min="0" max="100000" step="100" value="0">
                                    <label style="color: white ;border-radius: 15px;" for="maxPrice">Max Price:</label>
                                    <input type="number" style="border-radius: 15px;" name="maxPrice" id="maxPrice" min="0"  step="100" value="1000">
                                    <button type="submit" style="border-radius: 15px;"><img src="images/search.png" alt="">Search</button>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Hero Section -->
           <div class="untree_co-section product-section before-footer-section">
                <div class="container">
                    <div class="row">

                        <!-- Start Column 1 -->


                        <c:forEach var="product" items="${listP}">
                            <div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
                                <a class="product-item" href="MainController?action=ProDetail&proid=${product.getId()} ">
                                    <img src="${product.getImage()}" class="img-fluid product-thumbnail" style="border-radius: 15px;">
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
                
                
         


                <!-- Start Footer Section -->
                <jsp:include page="footer.jsp" ></jsp:include>
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
