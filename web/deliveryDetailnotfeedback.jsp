

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
        <style>
            .rating {
                display: flex;
                flex-direction: row-reverse;
                font-size: 30px;
                color: gold;
            }

            .rating input {
                display: none;
            }

            .rating label {
                cursor: pointer;
            }

            .rating label:before {
                content: '\2606';
                color: #ccc;
                font-size: 2em;
            }

            .rating input:checked ~ label:before {
                content: '\2605';
                color: gold;
            }


        </style>
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
                            <h1>PayMent Detail </h1>
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

                    <div class="site-blocks-table">
                        <table class="table">
                            <thead>
                                <tr> 
                                    <th class="product-thumbnail">Hình ảnh</th>
                                    <th class="product-name">Sản phẩm</th>
                                    <th class="product-price">Giái</th>
                                    <th class="product-quantity">Số lượng</th>
                                      <th class="product-quantity">Màu sắc</th>
                                        <th class="product-quantity">Sản xuất ở </th>
                                    <th class="product-total">Tổng</th> 
                                </tr>
                            </thead>


                            <tbody>
                                <c:forEach var="prodetail" items="${prodetail}">
                                    <tr>

                                        <td class="product-thumbnail">
                                            <img src="${prodetail.getImage()}" alt="Image" class="img-fluid">
                                        </td>
                                        <td class="product-name">
                                            <h2 class="h5 text-black"><a href="MainController?action=ProDetail&proid=${prodetail.getId()}">${prodetail.getName()}</a> </h2>
                                        </td>
                                        <td>${prodetail.getPrice()}</td>

                                        <td>
                                            <div class="quantity-box type1">
                                                <div class="qty-input"> 
                                                    ${prodetail.getQuantity()} 

                                                </div>
                                            </div>


                                        </td>
                                          <td>${prodetail.getColor()} </td>
                                            <td>${prodetail.getMadeIn()} </td>
                                        <td>${prodetail.getPrice()} VND</td>
                                         
             
                                      

                            </tr>
                                </c:forEach>

                            </tbody>
                        </table>


                        <!-- Popup -->



                    </div>



                </div>

            </div>
        </div>


        <!-- Start Footer Section -->
        <jsp:include page="footer.jsp" ></jsp:include>
            <!-- End Footer Section -->         

            <script>
                const stars = document.querySelectorAll('.rating input[type="radio"]');
                const ratingValue = document.getElementById('ratingValue');

                stars.forEach(star => {
                    star.addEventListener('change', (e) => {
                        const rating = e.target.value;
                        ratingValue.textContent = `Đánh giá của bạn: ${rating} sao`;
                    });
                });

        </script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/tiny-slider.js"></script>
        <script src="js/custom.js"></script>
    </body>

</html>
