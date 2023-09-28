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
    <c:choose>
            <c:when test="${sessionScope.account.role == 1}">
                <jsp:include page="Headeruser.jsp" ></jsp:include>
            </c:when>
            
            <c:otherwise>
                <jsp:include page="Headerguest.jsp" ></jsp:include>
            </c:otherwise>
        </c:choose>
    <div class="container pb-5 mb-2">
        <div class="comparison-table">
            <table class="table table-bordered">
                <thead class="bg-secondary">
                    <tr>
                        <td class="align-middle">
                            <select class="form-control custom-select" id="compare-criteria" data-filter="trigger">
                                <option value="all">Comparison criteria *</option>
                                <option value="summary">Summary</option>
                                <option value="general">General</option>
                                <option value="multimedia">Multimedia</option>
                                <option value="performance">Performance</option>
                                <option value="design">Design</option>
                                <option value="display">Display</option>
                                <option value="storage">Storage</option>
                                <option value="camera">Camera</option>
                                <option value="battery">Battery</option>
                                <option value="price">Price &amp; rating</option>
                            </select><small class="form-text text-muted">* Choose criteria to filter table below.</small>
                            <div class="pt-3">
                                <div class="custom-control custom-checkbox">
                                    <input class="custom-control-input" type="checkbox" id="differences">
                                    <label class="custom-control-label" for="differences">Show differences only</label>
                                </div>
                            </div>
                        </td>
                        <c:forEach var="product" items="${prodetail}">
                        <td>
                            <div class="comparison-item"><span class="remove-item"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></span>
                                <a class="comparison-item-thumb" href="MainControllner?action=ProDetail&proid=${product.getId()}"><img src=" ${product.getImg()}" alt="Apple iPhone Xs Max"></a><a class="comparison-item-title" href="MainControllner?action=ProDetail&proid=${product.getId()}" > ${product.getName()}</a>
                                <button class="btn btn-pill btn-outline-primary btn-sm" type="button" data-toggle="toast" data-target="#cart-toast">Thêm vào giỏ hàng</button>
                            </div>
                        </td>
                       
                       
                        </c:forEach>
                  
                           <td>
                            <div class="comparison-item"><span class="remove-item"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></span>
                                <a class="comparison-item-thumb" href="shop-single.html"><img src="https://www.bootdey.com/image/160x160/1E90FF/000000" alt="Google Pixel 3 XL"></a><a class="comparison-item-title" href="#" id="button">Chọn sản phảm muốn so sánh </a>
                                <button class="btn btn-pill btn-outline-primary btn-sm" type="button" data-toggle="toast" data-target="#cart-toast">Thêm </button>
                            </div>
                        </td>
                         
                    </tr>
                </thead>
                <tbody id="summary" data-filter="target">
                    <tr class="bg-secondary">
                        <th class="text-uppercase">Summary</th>
                        <td><span class="text-dark font-weight-semibold"></span></td>
                        <td><span class="text-dark font-weight-semibold"></span></td>
                        <td><span class="text-dark font-weight-semibold"></span></td>
                    </tr>
                    <tr>
                        <th>Performance</th>
                        <td>Hexa Core</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Display</th>
                        <td>6.5-inch</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Storage</th>
                        <td>64 GB</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Camera</th>
                        <td>Dual 12-megapixel</td>
                       <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Battery</th>
                        <td>3,174 mAh</td>
                       <td></td>
                        <td></td>
                    </tr>
                </tbody>
                <tbody id="general" data-filter="target">
                    <tr class="bg-secondary">
                        <th class="text-uppercase">General</th>
                        <td><span class="text-dark font-weight-semibold">Apple iPhone Xs Max</span></td>
                        <td><span class="text-dark font-weight-semibold"></span></td>
                        <td><span class="text-dark font-weight-semibold"></span></td>
                    </tr>
                    <tr>
                        <th>Quick charging</th>
                        <td>Yes</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Operating system</th>
                        <td>iOS v12</td>
                      <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Sim slots</th>
                        <td>Single SIM, GSM</td>
                       <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Launch date</th>
                        <td>September 12, 2018 (Official)</td>
                      <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Sim size</th>
                        <td>SIM1: Nano</td>
                      <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Network</th>
                        <td>4G: Available (supports Indian bands) 3G: Available, 2G: Available</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Fingerprint sensor</th>
                        <td>None (Face ID)</td>
                       <td></td>
                        <td></td>
                    </tr>
                </tbody>
                <tbody id="multimedia" data-filter="target">
                    <tr class="bg-secondary">
                        <th class="text-uppercase">Multimedia</th>
                        <td><span class="text-dark font-weight-semibold">Apple iPhone Xs Max</span></td>
                        <td><span class="text-dark font-weight-semibold"> </span></td>
                        <td><span class="text-dark font-weight-semibold"> </span></td>
                    </tr>
                    <tr>
                        <th>Loudspeaker</th>
                        <td>Yes</td>
                      <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>FM radio</th>
                        <td>No</td>
                       <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Headphone jack</th>
                        <td>No</td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
                <tbody id="performance" data-filter="target">
                    <tr class="bg-secondary">
                        <th class="text-uppercase">Performance</th>
                        <td><span class="text-dark font-weight-semibold">Apple iPhone Xs Max</span></td>
                        <td><span class="text-dark font-weight-semibold"></span></td>
                        <td><span class="text-dark font-weight-semibold"></span></td>
                    </tr>
                    <tr>
                        <th>Processor</th>
                        <td>Apple A12 Bionic</td>
                      <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Graphics</th>
                        <td>Apple GPU (4-core graphics)</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Architecture</th>
                        <td>64 bit</td>
                      <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>RAM</th>
                        <td>4 GB</td>
                       <td></td>
                        <td></td>
                    </tr>
                </tbody>
                <tbody id="design" data-filter="target">
                    <tr class="bg-secondary">
                        <th class="text-uppercase">Design</th>
                        <td><span class="text-dark font-weight-semibold">Apple iPhone Xs Max</span></td>
                        <td><span class="text-dark font-weight-semibold"></span></td>
                        <td><span class="text-dark font-weight-semibold"></span></td>
                    </tr>
                    <tr>
                        <th>Build material</th>
                        <td>Case: AluminiumBack: Mineral Glass</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Thickness</th>
                        <td>7.7 mm</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Width</th>
                        <td>70.9 mm</td>
                       <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Height</th>
                        <td>143.6 mm</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Weight</th>
                        <td>174 grams</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Waterproof</th>
                        <td>Yes Water resistant (up to 30 minutes in a depth of 1 meter), IP67</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Colors</th>
                        <td>Silver, Space Grey</td>
                       <td></td>
                        <td></td>
                    </tr>
                </tbody>
                <tbody id="display" data-filter="target">
                    <tr class="bg-secondary">
                        <th class="text-uppercase">Display</th>
                        <td><span class="text-dark font-weight-semibold">Apple iPhone Xs Max</span></td>
                        <td><span class="text-dark font-weight-semibold"></span></td>
                        <td><span class="text-dark font-weight-semibold"></span></td>
                    </tr>
                    <tr>
                        <th>Display type</th>
                        <td>Super Retina OLED</td>
                    <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Pixel density</th>
                        <td>458 ppi</td>
                      <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Screen protection</th>
                        <td>Yes</td>
                      <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Screen size</th>
                        <td>6.5 inches</td>
                      <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Screen resolution</th>
                        <td>1125 x 2436 pixels</td>
                       <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Touch screen</th>
                        <td>Yes, 3D Touch Touchscreen, Multi-touch</td>
                       <td></td>
                        <td></td>
                    </tr>
                </tbody>
                <tbody id="storage" data-filter="target">
                    <tr class="bg-secondary">
                        <th class="text-uppercase">Storage</th>
                        <td><span class="text-dark font-weight-semibold">Apple iPhone Xs Max</span></td>
                        <td><span class="text-dark font-weight-semibold"></span></td>
                        <td><span class="text-dark font-weight-semibold"> </span></td>
                    </tr>
                    <tr>
                        <th>Internal memory</th>
                        <td>64 GB</td>
                       <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Expandable memory</th>
                        <td>No</td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
                <tbody id="camera" data-filter="target">
                    <tr class="bg-secondary">
                        <th class="text-uppercase">Camera</th>
                        <td><span class="text-dark font-weight-semibold">Apple iPhone Xs Max</span></td>
                        <td><span class="text-dark font-weight-semibold"> </span></td>
                        <td><span class="text-dark font-weight-semibold"> </span></td>
                    </tr>
                    <tr>
                        <th>Settings</th>
                        <td>Exposure compensation, ISO control</td>
                       <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Aperture</th>
                        <td>F2.2</td>
                      <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Camera features</th>
                        <td>10 x Digital zoom, Optical zoom, Auto flash, Face detection, Touch to focus</td>
                       <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Image resolution</th>
                        <td>4000 x 3000 pixels</td>
                       <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Sensor</th>
                        <td>BSI sensor</td>
                       <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Autofocus</th>
                        <td>Yes</td>
                    <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Shooting modes</th>
                        <td>Continuos shooting, High dynamic range mode (HDR), Burst mode</td>
                       <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Optical image stabilisation</th>
                        <td>Yes, Dual optical image stabilization</td>
                      <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Flash</th>
                        <td>Yes, Retina flash</td>
                       <td></td>
                        <td></td>
                    </tr>
                </tbody>
                <tbody id="battery" data-filter="target">
                    <tr class="bg-secondary">
                        <th class="text-uppercase">Battery</th>
                        <td><span class="text-dark font-weight-semibold">Apple iPhone Xs Max</span></td>
                        <td><span class="text-dark font-weight-semibold"> </span></td>
                        <td><span class="text-dark font-weight-semibold"> </span></td>
                    </tr>
                    <tr>
                        <th>Talktime</th>
                        <td>Up to 21 hours(4G)</td>
                       <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Quick charging</th>
                        <td>Yes, fast, 50 % in 30 minutes</td>
                      <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Wireless charging</th>
                        <td>Yes</td>
                       <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Type</th>
                        <td>Li-ion</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Capacity</th>
                        <td>3,174 mAh</td>
                       <td></td>
                        <td></td>
                    </tr>
                </tbody>
                <tbody id="price" data-filter="target">
                    <tr class="bg-secondary">
                        <th class="text-uppercase">Price &amp; rating</th>
                        <td><span class="text-dark font-weight-semibold">Apple iPhone Xs Max</span></td>
                        <td><span class="text-dark font-weight-semibold"> </span></td>
                        <td><span class="text-dark font-weight-semibold"> </span></td>
                    </tr>
                    <tr>
                        <th>Price</th>
                        <td>$1,099</td>
                      <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>Rating</th>
                        <td>4.5/5</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th></th>
                        <td>
                            <button class="btn btn-outline-primary btn-block" type="button" data-toggle="toast" data-target="#cart-toast">Add to Cart</button>
                        </td>
                        <td>
                            <button class="btn btn-outline-primary btn-block" type="button" data-toggle="toast" data-target="#cart-toast">Thêm </button>
                        </td>
                        <td>
                            <button class="btn btn-outline-primary btn-block" type="button" data-toggle="toast" data-target="#cart-toast">Thêm </button>
                        </td>
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
                        <div class="row" style="margin-top:140px ;  background-color :#fff; ">
                            <c:forEach var="product" items="${product}">
                                <div class="col-12 col-md-4 col-lg-3 mb-5">
                                          <c:set var="id1" value="${prodetail[0]}" />
                                           <c:set var="id2" value="${prodetail[1]}" />
                                    <a class="product-item" href="MainControllner?action=com3&proid=${id1.getId()}&proid2=${id2.getId()}&proid3=${product.getId()}">
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
