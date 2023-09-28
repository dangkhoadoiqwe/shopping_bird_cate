<%-- 
    Document   : Profile
    Created on : 26-09-2023, 22:39:32
    Author     : Quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
       <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="css/tiny-slider.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="scss/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <link href="css/account.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
          
         <header>
             <%@include file="headerGuest.jsp"%>
        </header>
        <div class="right-site-account">
                    <div class="private-inf-account">
                        <div class="header-inf">
                            <p>Thông tin cá nhân</p>
                        </div>
                        <form class="form-inf-account">
                           
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email </label>
                                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="" readonly="">
                                <small id="emailHelp" class="form-text text-muted">You never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Phone</label>
                                <input type="text" class="form-control" id="exampleInputPassword1" value="0" readonly="">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Tên</label>
                                <input type="tel" class="form-control" id="exampleInputPassword1" value="" readonly="">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" class="form-control" id="exampleInputPassword1" value="" readonly="">
                            </div>
                        </form>
                    </div>
                    <!-- Update account information form -->
<!--                    <form action="MainController" method="post">
                        <div class="private-inf-account">
                            <div class="header-inf">
                                <p>ACCOUNT UPDATE FORM</p>
                            </div>
                            <div class="form-inf-account">
                                <div class="form-group">
                                    <div class="icon-update">
                                        <a href=""> <i class="fas fa-pen" style="font-size:20px"></i></a>
                                    </div>
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="" placeholder="Enter email" name="email-update" required="" pattern=".{1,40}@gmail\.com">
                                    <small id="emailHelp" class="form-text text-muted">You never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Telephone number</label>
                                    <input type="tel" class="form-control" id="exampleInputPassword1" placeholder="Telephone" value="" name="phone-update" required="" pattern="[0-9]{10}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Full Name</label>
                                    <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Name" value="" name="name-update" required="" pattern=".{6,17}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">New Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" value="" name="password-update" placeholder="*******" required="" pattern=".{1,50}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Re-Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" value="" name="repass-update" placeholder="*******" required="" pattern=".{1,50}">
                                </div>
                                <div class="btn-update-acc">
                                    <a class="btn btn-danger btn-close" href="homePage.jsp"><p>Close</p></a>
                                    <input type="hidden" name="accID" value="">
                                    <button class="btn btn-update btn-success" value="Update_Account" type="submit" name="action"><p>Update</p></button>
                                </div>
                                    <div style="color: red; font-size: 20px;"></div>
                            </div>  
                        </div>
                    </form>-->
                </div>
         <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/tiny-slider.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>
