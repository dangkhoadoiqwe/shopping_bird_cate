<%@page import="DTO.Account"%>
<%@page import="java.util.List"%>
<%@page import="DAO.VoucherDao"%>
<%@page import="DTO.Voucher"%>
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
        <link href="css/popupVoucher.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
        <c:choose>
            <c:when test="${not empty carts}">
                <div class="untree_co-section before-footer-section">
                    <div class="container">
                        <div class="row mb-5">
                            <div class="site-blocks-table">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th class="product-thumbnail">Hình ảnh</th>
                                            <th class="product-name">Tên sản phẩm</th>
                                            <th class="product-price">Giá</th>
                                            <th class="product-quantity">Số lượng</th>
                                            <th class="product-total">Tổng thành tiền</th>
                                            <th class="product-checkbox">
                                                <label for="selectAll"> <a>Xóa</a> </label>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="cart" items="${carts}">
                                            <tr>
                                                <td>  
                                                    <label for="" class="text-black collapsed" data-bs-toggle="collapse" href="" role="button"><input id="myCheckbox_${cart.getId()}" type="checkbox" onclick="checkCheckBox(${cart.getId()},${cart.getProduct().getId()}, document.getElementById('price_${cart.getProduct().getId()}'), document.getElementById('quantity_${cart.getProduct().getId()}'))" > </label>
                                                </td>
                                                <td class="product-thumbnail">
                                                    <img src="images/${cart.getProduct().getImage()}" alt="Image" class="img-fluid">
                                                </td>
                                                <td class="product-name">
                                                    <h2 cla-blass="h5 textck"><a href="MainController?action=ProDetail&proid=${cart.getProduct().getId()}">${cart.getProduct().getName()}</a> </h2>
                                                </td>
                                                <td>${cart.getProduct().getPrice()} VND</td>
                                                <td>
                                                    <div class="quantity-box type1">
                                                        <div class="qty-input" style="display: flex; justify-content: center">   
                                                            <button type="button" onclick="updateQuantity('decrease', document.getElementById('quantity_${cart.getProduct().getId()}'), ${cart.getProduct().getId()}, ${cart.getCartId()}, ${cart.getProduct().getPrice()})">-</button>
                                                            <input style="width: 50px; margin-left: 10px; margin-right: 10px;" class="form-control" type="text" name="quantity" id="quantity_${cart.getProduct().getId()}" value="${cart.getQuantity()}" oninput="updateQuantity('input', document.getElementById('quantity_${cart.getProduct().getId()}'), ${cart.getProduct().getId()}, ${cart.getCartId()}, ${cart.getProduct().getPrice()})">
                                                            <button type="button" onclick="updateQuantity('increase', document.getElementById('quantity_${cart.getProduct().getId()}'), ${cart.getProduct().getId()}, ${cart.getCartId()}, ${cart.getProduct().getPrice()})">+</button>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td id="price_${cart.getProduct().getId()}">${cart.getProduct().getPrice()*cart.getQuantity()} VND</td>
                                                <td><button type="button" id="deleteBtn_${cart.getProduct().getId()}" class="dropdown-item" data-toggle="modal" data-target="#delete_asset_${cart.getProduct().getId()}"><i class="fas fa-trash-alt m-r-5"></i> Xóa</button></td> 
                                            </tr>
                                        <div id="delete_asset_${cart.getProduct().getId()}" class="modal fade delete-modal" role="dialog">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-body text-center"> <img src="assets/img/sent.png" alt="" width="50" height="46">
                                                        <h3 class="delete_class">Bạn có chắc muốn xóa sản phẩm này?</h3>
                                                        <div class="m-t-20"> <a href="#" class="btn btn-white" id="close_Btn_${cart.getProduct().getId()}" data-dismiss="modal">Đóng</a>
                                                            <button type="button" onclick="deleteProduct(${account.getId()},${cart.getCartId()},${cart.getProduct().getId()})" class="btn btn-danger">Xóa</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="row mb-5">
                                    <div class="col-md-6 mb-3 mb-md-0">
                                        <a  href="RemoveAllFromCart?accID=${account.getId()}"><button class="btn btn-outline-black btn-sm btn-block" > Remove all</button> </a>
                                    </div>
                                    <div class="col-md-6" >
                                        <a href="MainController?action=shop" > <button class="btn btn-outline-black btn-sm btn-block" >Continue Shopping</button></a>
                                    </div>
                                </div>

                            </div>
                            <div id="btnThongbao" data-toggle="modal" data-target="#annoucement"></div>
                            <div id="annoucement" class="modal fade delete-modal" role="dialog">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-body text-center">
                                            <h5 id="announceMsg"  class="delete_class"></h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="cart-collaterals">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="cart_totals">
                                            <h2>Tổng giá sản phẩm đã chọn</h2>
                                            <table class="table table-responsive">
                                                <thead>
                                                    <tr>
                                                        <th class="product-name" colspan="2">Cộng giỏ hàng</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr class="cart-subtotal">
                                                        <th>Tổng tiền hàng</th>
                                                        <td data-title="Tạm tính">
                                                            <span id="productPrices" class="woocommerce-Price-amount amount">0<span class="woocommerce-Price-currencySymbol">₫</span></span>
                                                        </td>
                                                    </tr>
                                                    <tr class="cart-subtotal">
                                                        <th>Miễn phí vận chuyển</th>
                                                        <td data-title="Phí ship">
                                                            <span id="deliveryPrice" class="woocommerce-Price-amount amount">-0<span class="woocommerce-Price-currencySymbol">₫</span></span>
                                                        </td>
                                                    </tr>
                                                    <tr class="cart-subtotal">
                                                        <th>Voucher giảm giá</th>
                                                        <td data-title="Phí ship">
                                                            <span id="voucher_value" class="woocommerce-Price-amount amount">-0<span class="woocommerce-Price-currencySymbol">₫</span></span>
                                                        </td>
                                                    </tr>
                                                    <tr class="cart-subtotal">
                                                        <th>Điểm thưởng</th>
                                                        <td data-title="Phí ship">
                                                            <span class="woocommerce-Price-amount amount" id="pointEnd">-0<span class="woocommerce-Price-currencySymbol">₫</span></span>
                                                        </td>
                                                    </tr>
                                                    <tr class="order-total">
                                                        <th>Tổng số tiền</th>
                                                        <td data-title="Tổng">
                                                            <strong>
                                                                <span class="woocommerce-Price-amount amount" id="totalAll">0<span class="woocommerce-Price-currencySymbol">₫</span></span>
                                                            </strong>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="checkout-options">
                                            <div class="coupon">
                                                <h3 class="widget-title"><i class="icon-tag"></i> Phiếu ưu đãi</h3>
                                                <input type="text" name="coupon_code" class="input-text" id="coupon_code" value="" placeholder="Mã ưu đãi">
                                                <input type="button" class="btn btn-secondary is-form expand"  name="apply_coupon" data-toggle="modal" data-target=#select_voucher value="Áp dụng">
                                            </div>
                                            <br>
                                            <br>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <h4 class="widget-title" id="cus_point"><i class="icon-tag"></i> Điểm thưởng: ${account.getPoint()}</h4>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="coupon">
                                                        <input class="btn btn-secondary is-form expand" name="apply_point" onclick="usePoint()"  value="Sử dụng">
                                                    </div>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="checkout-button">
                                                <button class="btn btn-primary btn-lg py-3 btn-block" type="button" onclick="checkOut()">Thanh toán</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal fade" id="select_voucher" aria-hidden="true" role="dialog">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Voucher của bạn</h5>
                                                    <button type="button" id="close" class="close" onclick="clearContentText()" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
                                                </div>
                                                <div class="modal-body">
                                                    <%  VoucherDao voucherDao = new VoucherDao();
                                                        Account account = (Account) session.getAttribute("account");
                                                        List<Voucher> vouchers = voucherDao.getAllVoucherById(account.getId());
                                                    %>
                                                    <c:choose>
                                                        <c:when test="<%= vouchers != null%>">
                                                            <c:forEach var="voucher" items="<%= vouchers%>">
                                                                <table class="table">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>Mã voucher</th>
                                                                            <th>Tên voucher</th>
                                                                            <th>Ngày hết hạn</th>
                                                                            <th>Trạng thái</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>${voucher.getCode()}</td>
                                                                            <td>${voucher.getName()}</td>
                                                                            <td>${voucher.getDateEnd()}</td>
                                                                            <td>${voucher.getStatus() == 0 ? "Còn hiệu lực": "Hết hạn"}</td>
                                                                            <td><input type="radio" id="voucherCheckbox_${voucher.getId()}" name="selectedVoucher" onclick="useVoucher(${voucher.getId()},${voucher.getValue()},${voucher.getType()})"></td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <h5 style="text-align: center;">Bạn không có voucher nào hết</h5>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 50vh; text-align: center;">
                    <h3>Giỏ hàng của bạn đang trống</h3>
                    <a href="MainController?action=shop">
                        <button>Mua ngay</button>
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
        <!-- Begin Hidden JavaScript Code -->
        <script>
            var listProduct = [];
            var listCartDetailId = [];
            var isUsePoint = false;
            var isCoupon = false;
            var voucher = null;
            var size = 0;
            function checkCheckBox(cartDetailId, productId, proPrice, quantity) {
                var checkbox = document.getElementById("myCheckbox_" + cartDetailId);
                var cartItem = {
                    proId: productId,
                    cartDetailId: cartDetailId,
                    proPrice: proPrice.innerHTML.replace(/VND/g, ""),
                    quantity: quantity.value
                };
                if (checkbox.checked) {
                    listProduct[size++] = cartItem;
                    for (var i = 0; i < listProduct.length; i++) {
                        console.log(listProduct[i]);
                    }
                } else {
                    var index = listProduct.findIndex(item => item.proId === productId);
                    if (index !== -1) {
                        listProduct.splice(index, 1);
                        size--;
                    }
                }
                getPrices();
            }
            function getPrices() {
                var totalProductText = document.getElementById("productPrices");
                var deliveryPriceText = document.getElementById("deliveryPrice");
                var voucherText = document.getElementById("voucher_value");
                var voucherValue = voucher !== null ? voucher.voucherValue : 0;
                var cusPoint = document.getElementById("cus_point");
                var pointText = document.getElementById("pointEnd");
                var totalAll = document.getElementById("totalAll");
                var totalProductPrice = 0;
                listProduct.forEach(item => {
                    totalProductPrice += parseFloat(item.proPrice);
                });
                var point = isUsePoint ? cusPoint.innerText.replace("Điểm thưởng:", "") : 0;
                voucherText.innerHTML = "-" + voucherValue + "%";
                pointText.innerHTML = "-" + point + "₫";
                totalProductText.innerText = totalProductPrice + "₫";
                totalAll.innerHTML = (totalProductPrice - ((totalProductPrice * voucherValue) / 100) - point) + "₫";
            }
            function useVoucher(voucherId, value, type) {
                var voucherCheckbox = document.getElementById("voucherCheckbox_" + voucherId);
                const radioButtons = document.getElementsByName('selectedVoucher');
                for (var i = 0; i < radioButtons.length; i++) {
                    const radioButton = radioButtons[i];
                    if (radioButton.id === voucherCheckbox.id) {
                        if (voucherCheckbox.checked) {
                            voucher = {
                                voucherID: voucherId,
                                voucherValue: value,
                                type: type
                            };
                        } else {
                            voucher = null;
                        }
                    } else {
                        radioButton.checked = false;
                    }

                }
                getPrices();
            }
            function usePoint() {
                if (isUsePoint) {
                    isUsePoint = false;
                } else {
                    isUsePoint = true;
                }
                getPrices();
            }
            function updateListProduct(productId, price, quantity) {
                var item = listProduct.find(item => item.proId === productId);
                if (item) {
                    item.proPrice = price;
                    item.quantity = quantity;
                    getPrices();
                }
            }
            function deleteProduct(accId, cartId, productId) {
                $.ajax({
                    type: 'POST',
                    url: "DeleteProductInCart",
                    data: {
                        cartID: cartId,
                        productID: productId
                    },
                    success: function (response) {
                        window.alert("Xóa thành công");
                        document.getElementById("close_Btn_" + productId).click();
                        window.location.href = "MainController?action=MY_CART&accId=" + accId;
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        window.alert("Có lỗi xảy ra");
                    }
                });
            }
            function updateQuantity(action, quantity, productId, cartId, price) {
                if (action === "decrease") {
                    if (quantity.value - 1 <= 0) {
                        var btn = document.getElementById("deleteBtn_" + productId);
                        btn.click();
                        return;
                    } else {
                        quantity.value--;
                    }
                } else {
                    quantity.value++;
                }
                $.ajax({
                    type: "GET",
                    url: "ChangeCartQuantity",
                    data: {
                        cartID: cartId,
                        productID: productId,
                        quantity: quantity.value
                    },
                    success: function (response) {
                        var quantityElement = document.getElementById("quantity_" + productId);
                        var productPrice = document.getElementById("price_" + productId);
                        if (response.msg && response.msg !== "null") {
                            var btnAnnouce = document.getElementById("btnThongbao");
                            var msg = document.getElementById("announceMsg");
                            msg.innerHTML = response.msg;
                            btnAnnouce.click();
                        }
                        productPrice.innerHTML = response.newQuantity * price + " VND";
                        quantityElement.value = response.newQuantity;
                        updateListProduct(productId, parseInt(response.newQuantity * price), response.newQuantity);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        // Handle errors if needed
                    }
                });
            }
            function checkOut() {
                if (listProduct.length === 0) {
                    window.alert("Bạn vẫn chưa chọn sản phẩm nào để mua");
                    return;
                }
                $.ajax({
                    type: "POST",
                    url: "checkout",
                    data: {
                        listProduct: JSON.stringify(listProduct),
                        voucher: JSON.stringify(voucher)
                    },
                    success: function (response) {
                        window.location.href = "checkout.jsp";
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        window.alert("error");
                    }
                });
            }
            function sendDataTocheckout(data) {
                $.ajax({
                    type: 'POST',
                    url: "checkout.jsp",
                    data: data,
                    success: function (data, textStatus, jqXHR) {
                        window.location.href = "checkout.jsp";
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        window.alert("error");
                    }
                });
            }
            window.onload = function () {
                var msg = '<% request.getAttribute("msg");%>';
                if (msg && msg.trim().toLowerCase() !== "null") {
                    window.alert(msg);
                }
            };
        </script>
        <!-- End Hidden JavaScript Code -->
        <!-- Start Footer Section -->
        <jsp:include page="footer.jsp" ></jsp:include>
        <!-- End Footer Section -->	
        <script data-cfasync="false" src="../../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="assets/js/jquery-3.5.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="assets/plugins/datatables/datatables.min.js"></script>
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/plugins/raphael/raphael.min.js"></script>
        <script src="assets/js/script.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/tiny-slider.js"></script>
        <script src="js/custom.js"></script>
    </body>

</html>
