<%-- 
    Document   : login
    Created on : May 29, 2023, 5:06:25 PM
    Author     : MSI AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <!-- doccure/login.jsp  30 Nov 2019 04:12:20 GMT -->

    <head>
        <meta charset="utf-8">
        <title>thedearbird | Login</title>

        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <!-- Favicons -->
        <link rel="shortcut icon" type="image/x-icon" href="admin/assets/img/logo-icon.png">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
                        <script src="assets/js/html5shiv.min.js"></script>
                        <script src="assets/js/respond.min.js"></script>
                <![endif]-->

    </head>

    <body class="account-page">

        <!-- Main Wrapper -->
        <div class="main-wrapper">


  <jsp:include page="Headeruser.jsp"/>
            <!-- /Header -->

            <!-- Page Content -->
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-8 offset-md-2">

                            <!-- Login Tab Content -->
                            <div class="account-content">
                                <div class="row align-items-center justify-content-center">
                                    <div class="col-md-7 col-lg-6 login-left">
                                        <img src="assets/img/login-banner-1.png" class="img-fluid" alt="thedearbird Login">
                                    </div>
                                    <div class="col-md-12 col-lg-6 login-right">
                                        <div class="login-header">
                                            <h3>Login to thedearbird</h3>
                                        </div>
                                        <form action="MainController" method="post">
                                            <div class="form-group form-focus">
                                                <input name="username" type="text" class="form-control floating">
                                                <label class="focus-label">Username</label>
                                            </div>

                                            <div class="box">
                                                <div class="form-group form-focus inputBox">
                                                    <input name="password" type="password" id="pass" class="form-control floating">
                                                    <label class="focus-label">Password</label>                                       
                                                    <span id="toggleBtn"></span>
                                                    <p style="
                                                       margin-top: 5px;
                                                       width: 280px;
                                                       padding-left: 3px;
                                                       padding-right: 3px;
                                                       border-radius: 3px;
                                                       background: #F8ECEC;
                                                       color: #be4b49;">${errorLogin}</p>
                                                </div>
                                            </div>
                                            <style>
                                                .box {
                                                    position: relative;
                                                }
                                                .box .inputBox input{
                                                    position: relative;
                                                    outline: none;
                                                }
                                                .box .inputBox #toggleBtn{
                                                    position: absolute;
                                                    width: 35px;
                                                    height: 35px;
                                                    background: rgba(0,0,0,0.05);
                                                    top: 7px;
                                                    right: 10px;
                                                    border-radius: 50%;
                                                    cursor: pointer;
                                                    display: flex;
                                                    justify-content: center;
                                                    align-items: center;
                                                }
                                                .box .inputBox #toggleBtn::before {
                                                    content: '\f06e';
                                                    font-family: fontAwesome;
                                                }

                                                .box .inputBox #toggleBtn.hide::before  {
                                                    content: '\f070';
                                                }
                                            </style>

                                            <script>
                                                let pass = document.getElementById('pass');
                                                let toggleBtn = document.getElementById('toggleBtn');

                                                toggleBtn.onclick = function () {
                                                    if (pass.type === 'password') {
                                                        pass.setAttribute('type', 'text');
                                                        toggleBtn.classList.add('hide');
                                                    } else {
                                                        pass.setAttribute('type', 'password');
                                                        toggleBtn.classList.remove('hide');

                                                    }
                                                }
                                            </script>
                                            <div class="text-right">
                                                <a class="forgot-link" href="forgot-password.jsp">Forgot Password ?</a>
                                            </div>

                                            <button name="action" value="login" class="btn btn-primary btn-block btn-lg login-btn"
                                                    type="submit">Login</button>
                                            <div class="login-or">
                                                <span class="or-line"></span>
                                                <span class="span-or">or</span>
                                            </div>
                                            <div class="row form-row social-login">
                                                <div style="margin-left: auto; margin-right: auto;" class="col-6">
                                                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/bird-clinic-system/LoginGoogleController&response_type=code
                                                       &client_id=973433615683-gfjr1bno4eukjdgpfahqr08ct4llmumq.apps.googleusercontent.com&approval_prompt=force" class="btn btn-google btn-block"><i
                                                            class="fab fa-google mr-1"></i>Login</a>
                                                </div>
                                            </div>
                                            <div class="text-center dont-have">Don’t have an account? <a
                                                    href="register.jsp">Register</a></div>
                                            <p style="color: green; margin-left: 10px;">${successSignUp}</p>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- /Login Tab Content -->

                        </div>
                    </div>

                </div>

            </div>
            <!-- /Page Content -->

            <footer class="footer-section">
			<div class="container relative">

				

				<div class="row g-5 mb-5">
					<div class="col-lg-4">
						<div class="mb-4 footer-logo-wrap"><a href="#" class="footer-logo">Furni<span>.</span></a></div>
						<p class="mb-4">Donec facilisis quam ut purus rutrum lobortis. Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam vulputate velit imperdiet dolor tempor tristique. Pellentesque habitant</p>

						<ul class="list-unstyled custom-social">
							<li><a href="#"><span class="fa fa-brands fa-facebook-f"></span></a></li>
							<li><a href="#"><span class="fa fa-brands fa-twitter"></span></a></li>
							<li><a href="#"><span class="fa fa-brands fa-instagram"></span></a></li>
							<li><a href="#"><span class="fa fa-brands fa-linkedin"></span></a></li>
						</ul>
					</div>

					<div class="col-lg-8">
						<div class="row links-wrap">
							<div class="col-6 col-sm-6 col-md-3">
								<ul class="list-unstyled">
									<li><a href="#">About us</a></li>
									<li><a href="#">Services</a></li>
									<li><a href="#">Blog</a></li>
									<li><a href="#">Contact us</a></li>
								</ul>
							</div>

							<div class="col-6 col-sm-6 col-md-3">
								<ul class="list-unstyled">
									<li><a href="#">Support</a></li>
									<li><a href="#">Knowledge base</a></li>
									<li><a href="#">Live chat</a></li>
								</ul>
							</div>

							<div class="col-6 col-sm-6 col-md-3">
								<ul class="list-unstyled">
									<li><a href="#">Jobs</a></li>
									<li><a href="#">Our team</a></li>
									<li><a href="#">Leadership</a></li>
									<li><a href="#">Privacy Policy</a></li>
								</ul>
							</div>

							<div class="col-6 col-sm-6 col-md-3">
								<ul class="list-unstyled">
									<li><a href="#">Nordic Chair</a></li>
									<li><a href="#">Kruzo Aero</a></li>
									<li><a href="#">Ergonomic Chair</a></li>
								</ul>
							</div>
						</div>
					</div>

				</div>

				<div class="border-top copyright">
					<div class="row pt-4">
						<div class="col-lg-6">
							<p class="mb-2 text-center text-lg-start">Copyright &copy;<script>document.write(new Date().getFullYear());</script>. All Rights Reserved. &mdash; Designed with love by <a href="https://untree.co">Untree.co</a> Distributed By <a hreff="https://themewagon.com">ThemeWagon</a>  <!-- License information: https://untree.co/license/ -->
            </p>
						</div>

						<div class="col-lg-6 text-center text-lg-end">
							<ul class="list-unstyled d-inline-flex ms-auto">
								<li class="me-4"><a href="#">Terms &amp; Conditions</a></li>
								<li><a href="#">Privacy Policy</a></li>
							</ul>
						</div>

					</div>
				</div>

			</div>
		</footer>

        </div>
        <!-- /Main Wrapper -->

        <!-- jQuery -->
        <script src="assets/js/jquery.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>

    </body>

    <!-- doccure/login.jsp  30 Nov 2019 04:12:20 GMT -->

</html>