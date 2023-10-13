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
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="css/tiny-slider.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="path/to/bootstrap.min.css">

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
                    <div class="col-md-6 mb-5 mb-md-0">

                        <h2 class="h3 mb-3 text-black">Coupon Code</h2>
                        <div class="p-3 p-lg-5 border bg-white">

                            <label for="c_code" class="text-black mb-3">Enter your coupon code if you have one</label>
                            <div class="input-group w-75 couponcode-wrap">
                                <form action="${pageContext.request.contextPath}/checkout"  method="get">
                                    <input type="text" class="form-control me-2" id="c_code" placeholder="Coupon Code" aria-label="Coupon Code" aria-describedby="button-addon2" name="code" maxlength="10"> 
                                    <input class="form-control" type="hidden" name="accid" value="${id1.getId()}"  ><br>
                                    <button class="btn btn-black btn-sm" type="submit" id="button-addon2">Apply</button>
                                </form>

                            </div>

                        </div>

                        <h2 class="h3 mb-3 text-black">Billing Details</h2>
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
                                       <div class="border p-3 mb-3">
                                                <h3 class="h6 mb-0">
                                                        <input type="checkbox" id="cashCheckbox" id="vehicle1" name="vehicle1" value="Bike"> Tiền mặt
                                                </h3>  <div class="collapse" id="collapsecheque">
                                                        
                                                </div>
                                                <div class="collapse" id="collapsecheque">
                                                    <div class="py-2">
                                                        <p class="mb-0">Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won?t be shipped until the funds have cleared in our account.</p>
                                                    </div>
                                                </div>
                                            </div>

                                    <div class="border p-3 mb-5">
                                        <h3 class="h6 mb-0"><a class="d-block" data-bs-toggle="collapse" href="#collapsepaypal" role="button" aria-expanded="false" aria-controls="collapsepaypal">Chuyển khoản </a></h3>

                                        <div class="collapse" id="collapsepaypal">
                                            <div class="py-2">
                                                <p class="mb-0">Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won?t be shipped until the funds have cleared in our account.</p>
                                            </div>
                                        </div>
                                    </div>
                                
                                           <input class="form-control" type="hidden" name="discountTotal" value="${discountTotal}"  ><br>
                                    <div class="form-group">
                                        <button class="btn btn-default check_out " type="submit">Thanh toán</button>
                                    </div> 
                            </div>         
                        </form> 


                    </div>

                    <div class="col-md-6">
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
                                                <td class="text-black font-weight-bold" name ="discountTotal">${discountTotal}VND</td>
                                            </tr>

                                        </tbody>
                                    </table>
                                         


                                          

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