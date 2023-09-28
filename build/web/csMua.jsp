<%-- 
    Document   : csMua
    Created on : 15-09-2023, 10:36:41
    Author     : Quang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            <!DOCTYPE html>
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                <link href="scss/style.css" rel="stylesheet" type="text/css"/>
                <link href="css/Csschinhsach.css" rel="stylesheet">


                <title>JSP Page</title>
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
                <div id="banner">
                    <div class="box-left">
                        <h2>


                            <span>FURNI</span>
                            <br>
                            <span  style="font-size: 16px;">Kh�ng gian ??c ?�o cho nh?ng ?�i c�nh - L?ng chim, ??ng c?p d�n ch?i!</span>

                        </h2>

                        <p>Chuy�n cung c?p c�c lo?i l?ng chim cho t?ng lo?i chim c?a kh�ch h�ng gi�p cho chim c?a kh�ch h�ng c� 1 kh�ng gian tho?i m�i nh?t</p>

                        <button>Mua ngay</button>
                    </div>
                    <div class="to-bottom">
                        <a href="">
                            <img src="assets/to_bottom.png" alt="">
                        </a>
                    </div>
                </div>
                <!-- End Hero Section -->


                <div class="ace">





                    <div>
                        <h1 style="text-align: center;"><strong>Ch�nh S�ch Mua H�ng</strong></h1>
                        <h2><span style="color: #d83131;"><b>1. Thanh to�n t?i ?i?m giao d?ch</b></span></h2>
                        <ul>
                            <li style="font-weight: 400;" aria-level="1"><span style="font-weight: 400;">B??c 1: Kh�ch h�ng ??t h�ng.</span></li>
                            <li style="font-weight: 400;" aria-level="1"><span style="font-weight: 400;">B??c 2: Kh�ch h�ng v� nh�n vi�n b�n h�ng x�c th?c ??n h�ng (?i?n tho?i, tin nh?n, email).</span></li>
                            <li style="font-weight: 400;" aria-level="1"><span style="font-weight: 400;">B??c 3: Nh�n vi�n b�n h�ng x�c nh?n th�ng tin kh�ch h�ng.</span></li>
                            <li style="font-weight: 400;" aria-level="1"><span style="font-weight: 400;">B??c 4: Kh�ch h�ng ??n v?n ph�ng c?a c�ng ty, n?i kh�ch h�ng y�u c?u.</span></li>
                            <li style="font-weight: 400;" aria-level="1"><span style="font-weight: 400;">B??c 5: Kh�ch h�ng nh?n h�ng v� thanh to�n t?i qu?y thu ng�n.</span></li>
                        </ul>
                        <h2><span style="color: #d83131;"><b>2. Thanh to�n t?i nh�</b></span></h2>
                        <ul>
                            <li style="font-weight: 400;" aria-level="1"><span style="font-weight: 400;">B??c 1: Kh�ch h�ng ??t h�ng.</span></li>
                            <li style="font-weight: 400;" aria-level="1"><span style="font-weight: 400;">B??c 2: Kh�ch h�ng v� Nh�n vi�n b�n h�ng x�c th?c ??n h�ng (?i?n tho?i, tin nh?n, email).</span></li>
                            <li style="font-weight: 400;" aria-level="1"><span style="font-weight: 400;">B??c 3: Nh�n vi�n b�n h�ng x�c nh?n th�ng tin kh�ch h�ng.</span></li>
                            <li style="font-weight: 400;" aria-level="1"><span style="font-weight: 400;">B??c 3: Nh�n vi�n b�n h�ng y�u c?u nh�n vi�n ?i giao h�ng cho kh�ch.</span></li>
                            <li style="font-weight: 400;" aria-level="1"><span style="font-weight: 400;">B??c 4: Kh�ch h�ng nh?n h�ng v� thanh to�n ngay v?i nh�n vi�n giao h�ng </span></li>
                        </ul>
                        <p><b style="color: #d83131; font-size: 23.04px;">3. Thanh to�n qua Internet&nbsp; Banking</b></p>
                        <ul>
                            <li style="font-weight: 400;" aria-level="1"><span style="font-weight: 400;">B??c 1: ??ng nh?p ?ng d?ng Mobile Banking c?a m?t trong c�c ng�n h�ng t�ch c� h?p t�nh n?ng QR Pay nh? BIDV, VietinBank, Agribank, Vietcombank, ABBANK, SCB, IVB, NCB, SHB, Maritime Bank?</span></li>
                            <li style="font-weight: 400;" aria-level="1"><span style="font-weight: 400;">B??c 2: B?n ch?n t�nh n?ng chuy?n ti?n</span></li>
                            <li style="font-weight: 400;" aria-level="1"><span style="font-weight: 400;">B??c 3: nh?p th�ng tin chuy?n kho?n c?a ch�ng t�i</span></li>
                        </ul>
                        <p style="padding-left: 40px;"><b><span lang="VI">T�n TK: DANG NGUYEN NGOC THOAI</span></b></p>
                        <p style="padding-left: 40px;"><b><span lang="VI">T?i: NG�N H�NG TMCP � CH�U (ACB) ? CN HCM</span></b></p>
                        <p style="padding-left: 40px;"><b><span lang="VI">S? TK: 11883407</span></b></p>
                        <ul>
                            <li style="font-weight: 400;" aria-level="1"><span style="font-weight: 400;">B??c 4: Nh?p s? ti?n thanh to�n</span></li>
                            <li style="font-weight: 400;" aria-level="1"><span style="font-weight: 400;">B??c 5: X�c minh gia d?ch b?ng m?t kh?u, v�n tay ho?c FaceID. Nh?n th�ng b�o giao d?ch ho�n th�nh.</span></li>
                        </ul>


                    </div>



                </div>
                <!-- Start Footer Section -->
                <footer class="footer-section">
                    <div class="container relative">

                        <div class="sofa-img">
                            <!--<img src="" alt="Image" class="img-fluid">-->
                        </div>

                        <div class="row">
                            <div class="col-lg-8">
                                <div class="subscription-form">
                                    <h3 class="d-flex align-items-center"><span class="me-1"><img src="images/envelope-outline.svg" alt="Image" class="img-fluid"></span><span>Subscribe to Newsletter</span></h3>

                                    <form action="#" class="row g-3">
                                        <div class="col-auto">
                                            <input type="text" class="form-control" placeholder="Enter your name">
                                        </div>
                                        <div class="col-auto">
                                            <input type="email" class="form-control" placeholder="Enter your email">
                                        </div>
                                        <div class="col-auto">
                                            <button class="btn btn-primary">
                                                <span class="fa fa-paper-plane"></span>
                                            </button>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>

                        <div class="row g-5 mb-5">
                            <div class="col-lg-4">
                                <div class="mb-4 footer-logo-wrap"><a href="#" class="footer-logo">Furni<span>.</span></a></div>
                                <p class="mb-4">Funi l� c?a h�ng s?n ph?m l?ng chim, ph? ki?n l?ng chim ch�nh h�ng t?  th??ng hi?u l�ng ngh? th? c�ng m? ngh? h�ng ??u Vi?t Nam T? tin kh?ng ??nh ch?t l??ng ph?c v? v?i ??i ng? nh�n vi�n n?ng ??ng, chuy�n nghi?p c� kh? n?ng am hi?u nhu c?u kh�ch h�ng c�ng nh? th�i ?? ph?c v? t?n t?y.</p>

                                <ul class="list-unstyled custom-social">
                                    <li><a href="#"><span class="fa fa-brands fa-facebook-f"></span></a></li>
                                    <li><a href="#"><span class="fa fa-brands fa-twitter"></span></a></li>
                                    <li><a href="#"><span class="fa fa-brands fa-instagram"></span></a></li>
                                    <li><a href="#"><span class="fa fa-brands fa-linkedin"></span></a></li>
                                </ul>
                            </div>

                            <div class="col-lg-8">
                                <div class="row links-wrap">
                                    <div class="col-6 col-sm-6 col-md-4">
                                        <ul class="list-unstyled">
                                            <li><a style = color:red;>C?a h�ng</a></li>
                                            <li><a href="#">Gi?i thi?u</a></li>
                                            <li><a href="#">S?n ph?m</a></li>
                                            <li><a href="#">Blog</a></li>
                                            <li><a href="#">Li�n h?</a></li>
                                        </ul>
                                    </div>

                                    <div class="col-6 col-sm-6 col-md-4">
                                        <ul class="list-unstyled">
                                            <li><a style = color:red;>Ch�nh s�ch</a></li>
                                            <li><a href="chinhsachdoitra.jsp">Ch�nh s�ch ??i tr?</a></li>
                                            <li><a href="csMua.jsp">Ch�nh s�ch mua h�ng</a></li>
                                            <li><a href="csbaomat.jsp">Ch�nh s�ch b?o m?t</a></li>
                                        </ul>
                                    </div>

                                    <div class="col-6 col-sm-6 col-md-4">
                                        <ul class="list-unstyled">
                                            <li><a style = color:red;>Li�n h? v?i ch�ng t�i</a></li>
                                            <li><a href="#">Hotline:097777555</a></li>
                                            <li><a href="#">funi@gmail.com</a></li>
                                            <li><a href="#">S? 1 ???ng D1, Th�nh ph? Th? ??c,Th�nh Ph? H? Ch� Minh</a></li>
                                        </ul>
                                    </div>


                                </div>
                            </div>

                        </div>



                    </div>
                </footer>
                <script src="js/bootstrap.bundle.min.js"></script>
                <script src="js/tiny-slider.js"></script>
                <script src="js/custom.js"></script>
            </body>
        </html>

    </body>
</html>

</body>
</html>
