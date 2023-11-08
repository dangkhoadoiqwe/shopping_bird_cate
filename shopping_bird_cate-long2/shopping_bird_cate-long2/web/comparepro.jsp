<%-- 
    Document   : comparepro
    Created on : 13 thg 9, 2023, 15:21:03
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <style>
        body{
            margin-top:20px;
        }

        .comparison-table {
            width: 100%;
            font-size: .875rem;
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
            -ms-overflow-style: -ms-autohiding-scrollbar
        }

        .comparison-table table {
            min-width: 41rem;
            table-layout: fixed
        }

        .comparison-table table tbody+tbody {
            border-top-width: 1px
        }

        .comparison-table .table-bordered thead td {
            border-bottom-width: 1px
        }

        .comparison-table .comparison-item {
            position: relative;
            padding: .875rem .75rem 1.125rem;
            border: 1px solid #e7e7e7;
            background-color: #fff;
            text-align: center
        }

        .comparison-table .comparison-item .comparison-item-thumb {
            display: block;
            width: 5rem;
            margin-right: auto;
            margin-bottom: .75rem;
            margin-left: auto
        }

        .comparison-table .comparison-item .comparison-item-thumb>img {
            display: block;
            width: 100%
        }

        .comparison-table .comparison-item .comparison-item-title {
            display: block;
            width: 100%;
            margin-bottom: 14px;
            color: #222;
            font-weight: 600;
            text-decoration: none
        }

        .comparison-table .comparison-item .comparison-item-title:hover {
            text-decoration: underline
        }

        .comparison-table .comparison-item .btn {
            margin: 0
        }

        .comparison-table .comparison-item .remove-item {
            display: block;
            position: absolute;
            top: -.3125rem;
            right: -.3125rem;
            width: 1.375rem;
            height: 1.375rem;
            border-radius: 50%;
            background-color: #f44336;
            color: #fff;
            text-align: center;
            cursor: pointer
        }

        .comparison-table .comparison-item .remove-item .feather {
            width: .875rem;
            height: .875rem
        }
        .table-bordered th, .table-bordered td {
            border: 1px solid #e7e7e7;
        }
        .bg-secondary {
            background-color: #f7f7f7 !important;
        }
    </style>
    <link href="css/login_1.css" rel="stylesheet" type="text/css"/>
    <link href="css/login_1_1.css" rel="stylesheet" type="text/css"/>
    <link href="css/login_2.css" rel="stylesheet" type="text/css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="css/login.css" rel="stylesheet" type="text/css"/>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="css/tiny-slider.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="scss/style.css" rel="stylesheet" type="text/css"/>
    <link href="css/login.css" rel="stylesheet" type="text/css"/>
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
    <div class="container pb-5 mb-2">
        <div class="comparison-table">
            <c:set var="idi1" value="" />
            <table class="table table-bordered">
                 <c:set var="id1" value="${prodetail}" />
                <thead class="bg-secondary">
                    <tr>
                        <td class="align-middle">

                        </td>
                        <td>
                           <div class="comparison-item">  
                               <a class="comparison-item-thumb" href="MainController?action=ProDetail&proid=${id1.getId()}"><img src="${id1.getImage()}" alt="Lồng chim sơn ca"></a><a class="comparison-item-title" href="MainController?action=ProDetail&proid=${id1.getId()}" > ${id1.getName()}</a>
                                <form class="cart clearfix" method="get" action="addtocart">
                                    <input type="hidden" name="productId" value="${id1.getId()}">
                                    <input type="hidden" name="quantity" value="1">
                                    <button class="btn btn-pill btn-outline-primary btn-sm" type="submit"   value="Add to cart"  data-toggle="toast" data-target="#cart-toast">Thêm vào giỏ hàng</button>
                                </form>
                            </div>
                        </td>
                       <td>
                               <div class="comparison-item">  
                                   <a class="comparison-item-thumb" href="shop-single.html"><img src="https://www.bootdey.com/image/160x160/1E90FF/000000" alt="Google Pixel 3 XL"></a><a class="comparison-item-title" href="#" id="button">Chọn sản phảm muốn so sánh </a>
                                <button class="btn btn-pill btn-outline-primary btn-sm" type="button" data-toggle="toast" data-target="#cart-toast">Thêm</button>
                            </div>
                        </td>
                        <td>
                              <div class="comparison-item">  
                                  <a class="comparison-item-thumb" href="shop-single.html"><img src="https://www.bootdey.com/image/160x160/FF8C00/000000" alt="Samsung Galaxy S10+"></a><a class="comparison-item-title" href="shop-single.html">Chọn sản phảm muốn so sánh</a>
                                <button class="btn btn-pill btn-outline-primary btn-sm" type="button" data-toggle="toast" data-target="#cart-toast">Thêm </button>
                            </div>
                        </td>
                    </tr>
                </thead>

                <tbody id="summary" data-filter="target">
                    <tr class="bg-secondary">
                        <th class="text-uppercase">Tổng kết</th>
                        <td><span class="text-dark font-weight-semibold"></span></td>
                        <td><span class="text-dark font-weight-semibold"></span></td>
                        <td><span class="text-dark font-weight-semibold"></span></td>
                    </tr>
                    <tr>
                        <th>Giá</th>
                         <td>${id1.getPrice()}VND</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Vật liệu</th>
                           <td>${id1.getMaterial()}</td>
                        <td></td>
                        <td></td>
                    </tr>

                    <tr>
                        <th>Màu</th>
                        <td>${id1.getColor()}</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Nhà sản xuất</th>
                        <td>${id1.getMadeIn()}</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Xuất xứ</th>
                       <td>${id1.getManufacturer()}</td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>

            </table>
        </div>
    </div>
    <div class="login-container">
        <div class="login-body-container">
            <span id="close" class="close_button"><img class="close-img" src="images/closeButton.png" alt="icon"/></span>
            <div class="login-form d-flex justify-content-between">
                <div class="untree_co-section product-section before-footer-section" style="">
                    <div    class="container" style="">
                        <div class="row" style="   background-color :#fff; ">
                            <c:forEach var="product" items="${product}">
                                <div class="col-12 col-md-4 col-lg-3 mb-5">
                                    <a class="product-item" href="MainController?action=com2&proid=${id1.getId()}&proid2=${product.getId()}">
                                        <img src="${product.getImage()}" style=" border-radius: 15px 15px 0 0;" class="img-fluid product-thumbnail">
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
                </div>
            </div>
        </div>
    </div>
                         <jsp:include page="footer.jsp" ></jsp:include>
    <script>

        document.getElementById("button").addEventListener("click", function () {
            document.querySelector(".login-container").style.display = "flex";
        });

        document.getElementById("close").addEventListener("click", function (event) {
            event.preventDefault(); // Prevent default link behavior
            document.querySelector(".login-container").style.display = "none";
        });
    </script>
    <script>
        window.onload = function () {
            var errorMessage = '<%= request.getAttribute("mess")%>';
            if (errorMessage && errorMessage.trim().toLowerCase() !== "null") {
                document.getElementById("error-message").textContent = errorMessage;
                document.querySelector(".login-container").style.display = "flex";
            }
        };
    </script>
    <script>
        $(function () {
            $('[data-filter="trigger"]').on("change", function () {
                var t = $(this).find("option:selected").val().toLowerCase();

                $('[data-filter="target"]').css("display", "none");
                $("#" + t).css("display", "table-row-group");
                if (t == "all") {
                    $('[data-filter="target"]').css("display", "table-row-group")
                }
                $(this).css("display", "block");
            });
        })
    </script>   
</body>
