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
    <link href="css/login_2.css" rel="stylesheet" type="text/css"/>
    <link href="CSS/login.css" rel="stylesheet" type="text/css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
    <%@include file ="Headeruser.jsp"%>
    <div class="container pb-5 mb-2">
        <div class="comparison-table">
            <table class="table table-bordered">
                <thead class="bg-secondary">
                    <tr>
                        <td class="align-middle">


                        </td>
                        <td>
                            <div class="comparison-item"><span class="remove-item"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></span>
                                <a class="comparison-item-thumb" href="shop-single.html"><img src="https://www.bootdey.com/image/160x160/FF0000/000000" alt="Apple iPhone Xs Max"></a><a class="comparison-item-title" href="#" id="button" > ${sessionScope.prodetail.getName()}</a>
                                <button class="btn btn-pill btn-outline-primary btn-sm" type="button" data-toggle="toast" data-target="#cart-toast">Add to Cart</button>
                            </div>
                        </td>
                        <td>
                            <div class="comparison-item"><span class="remove-item"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></span>
                                <a class="comparison-item-thumb" href="shop-single.html"><img src="https://www.bootdey.com/image/160x160/FF0000/000000" alt="Apple iPhone Xs Max"></a><a class="comparison-item-title" href="#" id="button" > Add new product</a>                            
                                <button class="btn btn-pill btn-outline-primary btn-sm" type="button" data-toggle="toast" data-target="#cart-toast">Add to Cart</button>
                            </div>
                        </td>
                        <td>
                            <div class="comparison-item"><span class="remove-item"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></span>
                                <a class="comparison-item-thumb" href="shop-single.html"><img src="https://www.bootdey.com/image/160x160/FF8C00/000000" alt="Samsung Galaxy S10+"></a><a class="comparison-item-title" href="#" id="button">Add product to compare</a>
                                <button class="btn btn-pill btn-outline-primary btn-sm" type="button" data-toggle="toast" data-target="#cart-toast">Add to Cart</button>
                            </div>
                        </td>
                    </tr>
                </thead>
                <tbody id="summary" data-filter="target">
                    <tr class="bg-secondary">
                        <th class="text-uppercase">Kết quả</th>
                        <td><span class="text-dark font-weight-semibold">${sessionScope.prodetail.getName()}</span></td>
                        <td><span class="text-dark font-weight-semibold">Google Pixel 3 XL</span></td>
                        <td><span class="text-dark font-weight-semibold">Samsung Galaxy S10+</span></td>
                    </tr>
                    <tr>
                        <th>Brand</th>
                        <td>${sessionScope.prodetail.getBramd()}</td>
                         <td</td>
                              <td</td>
                    </tr>
                    <tr>
                        <th>Price</th>
                        <td>${sessionScope.prodetail.getName()}/td>
                        <td></td>
                       <td></td>
                    </tr>
                    <tr>
                        <th>Storage</th>
                         <td</td>
                        <td></td>
                        <td></td>
                        
                        <td></td>
                             
                    </tr>
                    <tr>
                        <th>Camera</th>
                        <td>Dual 12-megapixel</td>
                        <td>12.2-megapixel</td>
                        <td>12,16,12-megapixel</td>
                    </tr>
                    <tr>
                        <th>Battery</th>
                        <td>3,174 mAh</td>
                        <td>3,430 mAh</td>
                        <td>4,100 mAh</td>
                    </tr>
                </tbody>
                <tbody id="general" data-filter="target">
                </tbody>
                <tbody id="multimedia" data-filter="target">
                </tbody>
                <tbody id="design" data-filter="target">
                </tbody>
                <tbody id="display" data-filter="target">
                </tbody>
                <tbody id="storage" data-filter="target">
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
                        <div class="row" style="margin-top:140px ;  background-color :#fff; ">
                            <c:forEach var="product" items="${product}">
                                <div class="col-12 col-md-4 col-lg-3 mb-5">
                                    <a class="product-item" href="MainControllner?action=ProDetail&proid=${product.getId()}">
                                        <img src="${product.getImg()}" style=" border-radius: 15px 15px 0 0;" class="img-fluid product-thumbnail">
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
    <footer>
        <%@include file="footer.jsp" %>
    </footer>      
</body>
