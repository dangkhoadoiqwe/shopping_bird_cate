
<!-- /*
* Bootstrap 5
* Template Name: Furni
* Template Author: Untree.co
* Template URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="author" content="Untree.co">
        <link rel="shortcut icon" href="favicon.png">
        <style>/* styles.css */
            .popup {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0,0,0,0.7);
                z-index: 1;
            }

            .popup-content {
                background-color: #fff;
                border: 1px solid #ccc;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                padding: 20px;
            }

            .close {
                position: absolute;
                top: 10px;
                right: 10px;
                font-size: 20px;
                cursor: pointer;
            }
        </style>
        <meta name="description" content="" />
        <meta name="keywords" content="bootstrap, bootstrap4" />

        <!-- Bootstrap CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="css/tiny-slider.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <title>Furni Free Bootstrap 5 Template for Furniture and Interior Design Websites by Untree.co </title>
    </head>

    <body>

        <!-- Start Header/Navigation -->
        <c:choose>
            <c:when test="${sessionScope.account.role == 1}">
                <jsp:include page="Headeruser.jsp" ></jsp:include>
            </c:when>

            <c:otherwise>
                <jsp:include page="Headerguest.jsp" ></jsp:include>
            </c:otherwise>
        </c:choose>

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
                    <div class="col-lg-7">

                    </div>
                </div>
            </div>
        </div>
        <!-- End Hero Section -->

        <div class="untree_co-section">
            <div class="container">
                <div class="row mb-5">
                   
                </div>
                <div class="row">
                    <div class="col-md-6 mb-5 mb-md-0">
                        <h2 class="h3 mb-3 text-black">Billing Details</h2>
                        <div class="p-3 p-lg-5 border bg-white">
                            
                            <c:set var="id1" value="${account}" />

                            <div class="form-group row">
                                <div class="col-md-6">
                                    <label for="c_fname" class="text-black">Last Name <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="c_fname" name="Name" value="${id1.getLastName()}">
                                </div>
                               
                            </div>

                       

                            <div class="form-group row">
                                <div class="col-md-12">
                                    <label for="c_address" class="text-black">Address <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="c_address" name="c_address" placeholder="Street address"  value="${id1.getAddress()}">
                                </div>
                            </div>

                            
                          

                            <div class="form-group row mb-5">
                                <div class="col-md-6">
                                    <label for="c_email_address" class="text-black">Email Address <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="c_email_address" name="c_email_address" value="${id1.getEmail()}">
                                </div>
                                <div class="col-md-6">
                                    <label for="c_phone" class="text-black">Phone <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="c_phone" name="c_phone" placeholder="Phone Number"  value="${id1.getPhone()}">
                                </div>
                            </div> 
                            <div class="form-group">
                                <label for="c_order_notes" class="text-black">Order Notes</label>
                                <textarea name="c_order_notes" id="c_order_notes" cols="30" rows="5" class="form-control" placeholder="Write your notes here..."></textarea>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-6">

                        <div class="row mb-5">
                            <div class="col-md-12">
                                <h2 class="h3 mb-3 text-black">Coupon Code</h2>
                                <div class="p-3 p-lg-5 border bg-white">

                                    <label for="c_code" class="text-black mb-3">Enter your coupon code if you have one</label>
                                    <div class="input-group w-75 couponcode-wrap">
                                        <form action="${pageContext.request.contextPath}/CheckOut"  method="get">
                                            <input type="text" class="form-control me-2" id="c_code" placeholder="Coupon Code" aria-label="Coupon Code" aria-describedby="button-addon2" name="code" maxlength="10">
                                            <input class="form-control" type="hidden" name="discountTotal" value="${id1.getId()}"  ><br>
                                            <button class="btn btn-black btn-sm" type="submit" id="button-addon2">Apply</button>
                                        </form>

                                    </div>

                                </div>
                            </div>
                        </div>

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
                                                <td> ${discount} %</td>
                                            </tr>
                                            <tr>
                                                <td class="text-black font-weight-bold"><strong> Order total</strong></td>
                                                <td class="text-black font-weight-bold">${discountTotal}VND</td>
                                            </tr>
                                            <!--		                    <tr>
                                                                                  <td class="text-black font-weight-bold"><strong>Order Total</strong></td>
                                                                                  <td class="text-black font-weight-bold"><strong>$350.00</strong></td>
                                                                                </tr>-->
                                        </tbody>
                                    </table>

                                 

                                    <div class="border p-3 mb-3">
                                            <h3 class="h6 mb-0"><a class="d-block" data-bs-toggle="collapse" href="#collapsecheque" role="button" aria-expanded="false" aria-controls="collapsecheque">Tien mat</a></h3>

                                        <div class="collapse" id="collapsecheque">
                                            <div class="py-2">
                                                <p class="mb-0">Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won?t be shipped until the funds have cleared in our account.</p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="border p-3 mb-5">
                                        <h3 class="h6 mb-0"><a class="d-block" data-bs-toggle="collapse" href="#collapsepaypal" role="button" aria-expanded="false" aria-controls="collapsepaypal">Chuyen khoan </a></h3>

                                        <div class="collapse" id="collapsepaypal">
                                            <div class="py-2">
                                                <p class="mb-0">Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won?t be shipped until the funds have cleared in our account.</p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <button class="btn btn-black btn-lg py-3 btn-block"  id="openPopupButton">Confirm</button>
                                    </div>
                                    <form action="${pageContext.request.contextPath}/CheckOut"  method="POST">
                                        <div id="popup" class="popup">
                                            <div class="popup-content">
                                                <span class="close" id="closePopupButton">&times;</span>
                                                <input class="form-control" type="hidden" value="${id1.getId()}"  ><br>
                                                <label for="c_lname" class="text-black">Total:</label>
                                                <p class="text-danger">${discountTotal}VND </p>

                                                <input class="form-control" type="hidden" name="discountTotal" value="${discountTotal}"  ><br>
                                                <label for="c_lname" class="text-black"> Name <span class="text-danger">*</span></label>
                                                <input class="form-control" type="text" name="Name" required="" value="${id1.getLastName()}" maxlength="50" ><br>
                                                <label for="c_lname" class="text-black">Address <span class="text-danger">*</span></label>
                                                <input class="form-control" type="text" name="Address" required value="${id1.getAddress()}"  maxlength="50" ><br>
                                                <label for="c_lname" class="text-black">Phone <span class="text-danger">*</span></label>
                                                <input class="form-control" type="text" required name="Phone" value="${id1.getPhone()}"  maxlength="10" ><br>
                                                <label for="c_lname" class="text-black">Notes <span class="text-danger">*</span></label>
                                                <input class="form-control" type="text" required name="note" value=""  maxlength="100" ><br>
                                                <button class="btn btn-default check_out " type="submit">Accept</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- </form> -->
            </div>
        </div>

        <jsp:include page="footer.jsp" ></jsp:include>
        <script> // script.js
            document.getElementById("openPopupButton").addEventListener("click", function () {
                document.getElementById("popup").style.display = "block";
            });

            document.getElementById("closePopupButton").addEventListener("click", function () {
                document.getElementById("popup").style.display = "none";
            });
        </script>

        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/tiny-slider.js"></script>
        <script src="js/custom.js"></script>
    </body>

</html>
