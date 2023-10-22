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
                 
                <thead class="bg-secondary">
                    <tr>
                        <td class="align-middle">

                        </td>
                       <c:set var="id1" value="${prodetail[0]}" />
                        <c:set var="id2" value="${prodetail[1]}" />
                          <c:set var="id3" value="${prodetail[2]}" />
                        <td>
                           <div class="comparison-item">          <a class="comparison-item-thumb" href="MainControllner?action=ProDetail&proid=${id1.getId()}"><img src=" ${id1.getImage()}" alt="Apple iPhone Xs Max"></a><a class="comparison-item-title" href="MainControllner?action=ProDetail&proid=${id1.getId()}" > ${id1.getName()}</a>
                                <form class="cart clearfix" method="get" action="addtocart">
                                    <input type="hidden" name="productId" value="${id1.getId()}">
                                    <input type="hidden" name="quantity" value="1">
                                    <button class="btn btn-pill btn-outline-primary btn-sm" type="submit"   value="Add to cart"  data-toggle="toast" data-target="#cart-toast">Thêm vào giỏ hàng</button>
                                </form> </div>
                        </td>
                        <td>
                           <div class="comparison-item">          <a class="comparison-item-thumb" href="MainControllner?action=ProDetail&proid=${id2.getId()}"><img src=" ${id2.getImage()}" alt="Apple iPhone Xs Max"></a><a class="comparison-item-title" href="MainControllner?action=ProDetail&proid=${id2.getId()}" > ${id2.getName()}</a>
                                <form class="cart clearfix" method="get" action="addtocart">
                                    <input type="hidden" name="productId" value="${id2.getId()}">
                                    <input type="hidden" name="quantity" value="1">
                                    <button class="btn btn-pill btn-outline-primary btn-sm" type="submit"   value="Add to cart"  data-toggle="toast" data-target="#cart-toast">Thêm vào giỏ hàng</button>
                                </form> </div>
                        </td>
<td>
                           <div class="comparison-item">          <a class="comparison-item-thumb" href="MainControllner?action=ProDetail&proid=${id3.getId()}"><img src=" ${id3.getImage()}" alt="Apple iPhone Xs Max"></a><a class="comparison-item-title" href="MainControllner?action=ProDetail&proid=${id3.getId()}" > ${id3.getName()}</a>
                                <form class="cart clearfix" method="get" action="addtocart">
                                    <input type="hidden" name="productId" value="${id3.getId()}">
                                    <input type="hidden" name="quantity" value="1">
                                    <button class="btn btn-pill btn-outline-primary btn-sm" type="submit"   value="Add to cart"  data-toggle="toast" data-target="#cart-toast">Thêm vào giỏ hàng</button>
                                </form> </div>
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
                        <td>${id2.getPrice()}VND</td>
                   <td>${id3.getPrice()}VND</td>
                    </tr>
                    <tr>
                        <th>Vật liệu</th>
                            <td>${id1.getMaterial()}</td>
                        <td>${id2.getMaterial()}</td>
                     <td>${id3.getMaterial()}</td>
                    </tr>

                    <tr>
                        <th>Màu</th>
                        <td>${id1.getColor()}</td>
                        <td>${id2.getColor()}</td>
                           <td>${id3.getColor()}</td>
                    </tr>
                    <tr>
                        <th>Nhà sản xuất</th>
                        <td>${id1.getManufacturer()}</td>
                        <td>${id2.getManufacturer()}</td>
                       <td>${id3.getManufacturer()}</td>
                    </tr>
                    <tr>
                        <th>Xuất xứ</th>
                       <td>${id1.getMadeIn()}</td>
                        <td>${id2.getMadeIn()}</td>
                      <td>${id3.getMadeIn()}</td>
                    </tr>
                </tbody>

            </table>
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
       <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/tiny-slider.js"></script>
        <script src="js/custom.js"></script>
</body>
