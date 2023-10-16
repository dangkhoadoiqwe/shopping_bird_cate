<%-- 
    Document   : checkout
    Created on : 19-09-2023, 22:19:43
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
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="css/tiny-slider.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="path/to/bootstrap.min.css">
        <style>
            .coupon {
    border-radius: 12px;
    box-shadow: 5px 8px 10px #d6d5d533;
    background: #fff;
}



        /* CSS cho popup */
        .popup {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1;
        }

        .popup-content {
            background-color: #fff;
            width: 80%;
            max-width: 700px;
            margin: 100px auto;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        .voucher {
            cursor: pointer;
            margin-bottom: 10px;
        }

        /* CSS cho nút "Add Voucher" */
        .add-voucher-button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .add-voucher-button:hover {
            background-color: #0056b3;
        }
    </style>
        <!-- Đường dẫn đến tệp JavaScript của Bootstrap (jQuery cần được bao gồm trước Bootstrap) -->
        <script src="path/to/jquery.min.js"></script>
        <script src="path/to/bootstrap.min.js"></script>
        <title>Furni Free Bootstrap 5 Template for Furniture and Interior Design Websites by Untree.co </title>
    </head>

    <body>

        <!-- Start Header/Navigation -->
        <header>


            <jsp:include page="headerUser.jsp" ></jsp:include>




            </header>
            <!-- End Header/Navigation -->

            <!-- Start Hero Section -->
            <div class="hero">
                <div class="container">
                    <div class="row justify-content-between">
                        <div class="col-lg-5">
                            <div class="intro-excerpt">
                                <h1>Checkout</h1>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <!-- End Hero Section -->

            <div class="untree_co-section">
                <div class="container"> 
                    <div class="row">
                    <c:set var="id1" value="${account}" />
                           <div class="col-12 mb-5 mb-md-0">
                        <h2 class="h3 mb-3 text-black">Coupon Code</h2> 
                        <div class="p-5 p-lg-5 border bg-white">

                            <label for="c_code" class="text-black mb-3">Enter your coupon code if you have one</label>
                             
                            <div class="input-group w-75 couponcode-wrap">
                                


                                    <div id="voucherPopup" class="popup">
                                        <div class="popup-content">
                                            <div class="row">
                                               
                                                <div class="col-sm-12">
                                                      <c:forEach var="c" items="${vouchers}" > 
                                                           <form action="${pageContext.request.contextPath}/checkout"  method="get">
                                                    <div class="coupon bg-white rounded mb-3 d-flex justify-content-between">
                                                        <div class="kiri p-3">
                                                            <div class="icon-container ">
                                                                <div class="icon-container_box">

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="tengah py-3 d-flex w-100 justify-content-start">
                                                            <div>

                                                        <c:choose>
                                                                    <c:when test="${c.getStatus() == 0}">
                                                                        <span class="badge badge-danger">   Invaild </span>
                                                                    </c:when>
                                                                    <c:when test="${c.getStatus() == 1}"> 
                                                                        <span class="badge badge-success">   vaild </span>
                                                                    </c:when> 
                                                                </c:choose> 
                                                                <h3 class="lead">${c.getName()} </h3>
                                                                <p class="text-muted mb-0">${c.getCode()}%</p>
                                                            </div>
                                                        </div>
                                                        <div class="kanan">
                                                            <div class="info m-3 d-flex align-items-center">
                                                                <div class="w-100">
                                                                    <div class="block">
                                                                        <span class="time font-weight-light">
                                                                            <span>${c.getDateEnd()}</span>
                                                                        </span>
                                                                    </div>

                                                                    <input class="form-control" type="hidden" name="accid" value="${id1.getId()}"  ><br>
                                                                    <input class="form-control" type="hidden" name="code" value="${c.getName()}"  ><br>
                                                                    <button class="btn btn-sm btn-outline-danger btn-block" type="submit" id="button-addon2">Apply</button>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                      </c:forEach>
                                                </div>




                                            </div>
                                            <button class="btn btn-black btn-sm"  id="closePopupButton">Close</button>
                                        </div>
                                    </div>
                            </div>
                            <input type="text" class="form-control me-2" id="c_code"  value="${code}" aria-label="Coupon Code" aria-describedby="button-addon2" name="code" maxlength="10"> 
                            <input class="form-control" type="hidden" name="accid" value="${id1.getId()}"  ><br>
                            <button class="btn btn-black btn-sm" id="addVoucherButton">Add Voucher</button>
                            

                        </div> 
                             </div>  
                         
                                <div class="col-md-12">
                        <div class="row mb-5">
                            <div class="col-md-12">
                        <h2 class="h1 mb-1 text-black">Billing Details</h2>
                        <form action="${pageContext.request.contextPath}/checkout"  method="POST">
                            <div class="p-3 p-lg-5 border bg-white">


                                <div class="form-group row">
                                    <div class="col-md-6">
                                        <label for="c_fname" class="text-black">Last Name <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="c_fname" name="Name" value="${id1.getName()}"  maxlength="50"> 
                                    </div>
                                </div>

                                <div class="form-group row mb-5">
                                    <div class="col-md-6">
                                        <label for="c_email_address" class="text-black">Phone  <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="c_email_address"  name="Phone" value="${id1.getPhone()}"  maxlength="12" >
                                    </div>
                                    <div class="col-md-6">
                                        <label for="c_address" class="text-black">Address <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="c_address" name="Address" placeholder="Street address"  value="${id1.getAddress()}" maxlength="50">
                                    </div>
                                </div> 
                                <div class="border p-3 mb-5">
                                    <label for="c_order_notes" class="text-black">Order Notes</label>
                                    <textarea  id="c_order_notes" cols="30" rows="5" class="form-control" placeholder="Write your notes here..." name="note"  maxlength="100"> </textarea>
                                </div> 
                            </div>         
                            </div>  
                        </div>         
                            </div>
 

                    <div class="col-md-12">
                        <div class="row mb-5">
                            <div class="col-md-12">
                                <h2 class="h3 mb-3 text-black">Your Order </h2>
                                <div class="p-3 p-lg-5 border bg-white">
                                    <table class="table site-block-order-table mb-5">
                                        <thead>
                                        <th>Product</th>
                                        <th>Total</th>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Product</td>
                                                <td>$${sessionScope.cart.getTotalBill()}</td>
                                            </tr>
                                            <tr>
                                                <td> Voucher  </td>
                                                <td> ${discount} %  </td>
                                            </tr>
                                            <tr>
                                                <td class="text-black font-weight-bold"><strong> Order total</strong></td>
                                                <td class="text-black font-weight-bold" name ="discountTotal">${discountTotal}VND</td>
                                            </tr>

                                        </tbody>

                                    </table> 
                                    <div class="border p-3 mb-3">
                                        <h3 class="h6 mb-0">
                                            <input type="radio"  id="vehicle1" name="status" value="2" required=""> Tiền mặt
                                        </h3>  
                                    </div>

                                    <div class="border p-3 mb-5">
                                        <h3 class="h6 mb-0">   <input type="radio" id="cashCheckbox" id="vehicle1" name="status" value="1" required=""  id="cashCheckbox"> Chuyển khoản</h3>
                                        
                                    </div>
                                              <img id="paymentImage" src="images/2.png" style="display: none; "> 
                                    <input class="form-control" type="hidden" name="discountTotal" value="${discountTotal}"  ><br>
                                     <input class="form-control" type="hidden" name="voucherid" value="${id}"  ><br>
                                    <div class="form-group">
                                        <button class="btn btn-default check_out " type="submit">Thanh toán</button>
                                    </div>    
                                </div>
                            </div>

                        </div>

                    </div>
                                       </form> 
                </div>
              
            </div>
        </div>

        <jsp:include page="footer.jsp" ></jsp:include>
        
        <script>
    // Lắng nghe sự kiện click trên radio button "Chuyển khoản"
    const cashCheckbox = document.getElementById('cashCheckbox');
    const paymentImage = document.getElementById('paymentImage');

    cashCheckbox.addEventListener('click', function() {
        if (cashCheckbox.checked) {
            paymentImage.style.display = 'block'; // Hiển thị hình ảnh khi radio button được chọn
        } else {
            paymentImage.style.display = 'none'; // Ẩn hình ảnh khi radio button không được chọn
        }
    });
</script>

        <script> // script.js
            document.getElementById("openPopupButton").addEventListener("click", function () {
                document.getElementById("popup").style.display = "block";
            });

            document.getElementById("closePopupButton").addEventListener("click", function () {
                document.getElementById("popup").style.display = "none";
            });
        </script>
         <script>
        // Lấy nút "Add Voucher" và popup
        var addVoucherButton = document.getElementById("addVoucherButton");
        var voucherPopup = document.getElementById("voucherPopup");

        // Hiển thị popup khi nhấn nút "Add Voucher"
        addVoucherButton.addEventListener("click", function() {
            voucherPopup.style.display = "block";
        });

        // Ẩn popup khi nhấn nút "Close"
        var closePopupButton = document.getElementById("closePopupButton");
        closePopupButton.addEventListener("click", function() {
            voucherPopup.style.display = "none";
        });

        // Xử lý khi một voucher được chọn
        var vouchers = document.querySelectorAll(".voucher");
        vouchers.forEach(function(voucher) {
            voucher.addEventListener("click", function() {
                // Xử lý khi một voucher được chọn
                console.log("Selected Voucher: " + voucher.textContent);
            });
        });
    </script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/tiny-slider.js"></script>
        <script src="js/custom.js"></script>
    </body>

</html>