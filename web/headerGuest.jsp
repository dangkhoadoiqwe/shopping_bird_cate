<%-- 
    Document   : headerGuest
    Created on : Sep 18, 2023, 11:27:27 AM
    Author     : Quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="scss/login.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js">
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js">
        </script>
    </head>
    <body>
        <nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="Furni navigation bar">

            <div class="container">
                <a class="navbar-brand" href="homePage.jsp">Furni<span>.</span></a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni" aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarsFurni">
                    <ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
                        <li class="nav-item active">
                            <a class="nav-link" href="MainController?action=LOAD_HOME_PAGE">Trang chủ</a>
                        </li>
                        <li><a class="nav-link" href="MainController?action=shop">Cửa hàng</a></li>
                        <li><a class="nav-link" href="blog.jsp">Blog</a></li>
                        <li><a class="nav-link" href="contact.jsp">Liên hệ</a></li>
                    </ul>
                    <!--                                        Thêm menu "Setting" -->


                    <ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
                        <li><a class="cd-signin" href="#"><img style =" margin-top:12px" src="images/user.svg"></a></li>
                        <li><a class="cd-signin" href="#"><img  style =" margin-top:12px"src="images/cart.svg"></a></li>
                    </ul>
                </div>
            </div>

        </nav>

        <div class="cd-user-modal"> 
            <!-- this is the entire modal form, including the background -->
            <div class="cd-user-modal-container"> 
                <!-- this is the container wrapper -->
                <ul class="cd-switcher">
                    <li>
                        <a href="#0">Đăng nhập
                        </a>
                    </li>
                    <li>
                        <a href="#0">Tạo tài khoản
                        </a>
                    </li>
                </ul>
                <div id="cd-login"> 
                    <!-- log in form -->
                    <form class="cd-form" action="MainController" method="post">
                        <input type="hidden" name="webUrl" id="url">
                        <p class="fieldset">
                            <label class="image-replace cd-email" for="signin-email">Email
                            </label>
                            <input class="full-width has-padding has-border" type="text" name="username" placeholder="E-mail" required="">
                            <span class="cd-error-message">Email không được bỏ trống!
                            </span>
                        </p>
                        <p class="fieldset">
                            <label class="image-replace cd-password" for="signin-password">Password
                            </label>
                            <input class="full-width has-padding has-border" type="text" name="password"  placeholder="Password" required="">
                            <a href="#0" class="hide-password">Hide
                            </a>
                            <span class="cd-error-message">Password không được bỏ trống!
                            </span>
                        </p>
                        <p class="fieldset">
                            <input type="checkbox" id="remember-me" checked>
                            <label for="remember-me">Nhớ đăng nhập
                            </label>
                        </p>
                        <p>${msg}</p>
                        <p class="fieldset">
                            <!--<input class="full-width" type="submit" name="action" value="login">-->
                            <button class="full-width" type="submit" name="action" value="login">Login</button>
                        </p>
                    </form>
                    <p class="cd-form-bottom-message">
                        <a href="#0">Quên mật khẩu?
                        </a>
                    </p>
                    <!-- <a href="#0" class="cd-close-form">Close</a> -->
                </div> 
                <!-- cd-login -->
                <div id="cd-signup"> 
                    <!-- sign up form -->
                    <form class="cd-form" action="RegisterController1" method="post">
                        <p class="fieldset">
                            <label class="image-replace cd-username" for="signup-username">Username
                            </label>
                            <input class="full-width has-padding has-border" id="signup-username" type="text" name="regisname" placeholder="Họ và tên" required="">
                            <span class="cd-error-message">Username không được bỏ trống!
                            </span>
                        </p>
                        <p class="fieldset">
                            <label class="image-replace cd-email" for="signup-email">Email
                            </label>
                            <input class="full-width has-padding has-border" id="signup-email" type="email" name="regismail" placeholder="E-mail" required="">
                            <span class="cd-error-message">Email không được bỏ trống!
                            </span>
                        </p>

                        <p class="fieldset">
                            <label class="image-replace cd-password" for="signup-phone">Phone
                            </label>
                            <input class="full-width has-padding has-border" id="signup-phone" type="text" name ="regisphone"  placeholder="Số điện thoại" required="">
                            <span class="cd-error-message">Password không được bỏ trống!
                            </span>
                        </p>
                        <p class="fieldset">
                            <label class="image-replace cd-password" for="signup-password">Password
                            </label>
                            <input class="full-width has-padding has-border" id="signup-password" type="text" name ="regispass"  placeholder="Password" required="">
                            <a href="#0" class="hide-password">Hide
                            </a>
                            <span class="cd-error-message">Password không được bỏ trống!
                            </span>
                        </p>
                        <p class="fieldset">
                            <label class="image-replace cd-password" for="signup-repassword">Password
                            </label>
                            <input class="full-width has-padding has-border" id="signup-repassword" type="text" name ="regisrepass"  placeholder="Password" required="">
                            <a href="#0" class="hide-password">Hide
                            </a>
                            <span class="cd-error-message">Password không được bỏ trống!
                            </span>
                        </p>
                        <p class="fieldset">
                            <input type="checkbox" id="accept-terms">
                            <label for="accept-terms">Tôi đồng ý với 
                                <a href="#0">Điều khoản & Chính sách
                                </a>
                            </label>
                        </p>
                        <p class="fieldset">
                            <button class="full-width has-padding" type="submit"  >Đăng ký</button>
                        </p>
                    </form>
                    <!-- <a href="#0" class="cd-close-form">Close</a> -->
                </div> 
                <!-- cd-signup -->
                <div id="cd-reset-password"> 
                    <!-- reset password form -->
                    <p class="cd-form-message">Bạn quên mật khẩu? Vui lòng nhập email của bạn và chúng tôi sẽ gửi cho bạn một email có đường dẫn để thay đổi mật khẩu.
                    </p>
                    <form class="cd-form">
                        <p class="fieldset">
                            <label class="image-replace cd-email" for="reset-email">Email
                            </label>
                            <input class="full-width has-padding has-border" id="reset-email" type="email" placeholder="E-mail">
                            <span class="cd-error-message">Email không được bỏ trống!
                            </span>
                        </p>
                        <p class="fieldset">
                            <input class="full-width has-padding" type="submit" value="Reset password">
                        </p>
                    </form>
                    <p class="cd-form-bottom-message">
                        <a href="#0">Quay lại đăng nhập
                        </a>
                    </p>
                </div> 
                <!-- cd-reset-password -->
                <a href="#0" class="cd-close-form">Close
                </a>
            </div> 
    </body>

    <script language="javascript">
        jQuery(document).ready(function ($) {
            var $form_modal = $('.cd-user-modal'),
                    $form_login = $form_modal.find('#cd-login'),
                    $form_signup = $form_modal.find('#cd-signup'),
                    $form_forgot_password = $form_modal.find('#cd-reset-password'),
                    $form_modal_tab = $('.cd-switcher'),
                    $tab_login = $form_modal_tab.children('li').eq(0).children('a'),
                    $tab_signup = $form_modal_tab.children('li').eq(1).children('a'),
                    $forgot_password_link = $form_login.find('.cd-form-bottom-message a'),
                    $back_to_login_link = $form_forgot_password.find('.cd-form-bottom-message a'),
                    $main_nav = $('.cd-signin');
            //open modal
            $main_nav.on('click', function (event) {
                if ($(event.target).is($main_nav)) {
                    // on mobile open the submenu
                    $(this).children('ul').toggleClass('is-visible');
                } else {
                    // on mobile close submenu
                    $main_nav.children('ul').removeClass('is-visible');
                    //show modal layer
                    $form_modal.addClass('is-visible');
                    //show the selected form
                    ($(event.target).is('.cd-signup')) ? signup_selected() : login_selected();
                }
            }
            );
            //close modal
            $('.cd-user-modal').on('click', function (event) {
                if ($(event.target).is($form_modal) || $(event.target).is('.cd-close-form')) {
                    $form_modal.removeClass('is-visible');
                }
            }
            );
            //close modal when clicking the esc keyboard button
            $(document).keyup(function (event) {
                if (event.which == '27') {
                    $form_modal.removeClass('is-visible');
                }
            }
            );
            //switch from a tab to another
            $form_modal_tab.on('click', function (event) {
                event.preventDefault();
                ($(event.target).is($tab_login)) ? login_selected() : signup_selected();
            }
            );
            //hide or show password
            $('.hide-password').on('click', function () {
                var $this = $(this),
                        $password_field = $this.prev('input');
                ('password' == $password_field.attr('type')) ? $password_field.attr('type', 'text') : $password_field.attr('type', 'password');
                ('Hide' == $this.text()) ? $this.text('Show') : $this.text('Hide');
                //focus and move cursor to the end of input field
                $password_field.putCursorAtEnd();
            }
            );
            //show forgot-password form 
            $forgot_password_link.on('click', function (event) {
                event.preventDefault();
                forgot_password_selected();
            }
            );
            //back to login from the forgot-password form
            $back_to_login_link.on('click', function (event) {
                event.preventDefault();
                login_selected();
            }
            );
            function login_selected() {
                $form_login.addClass('is-selected');
                $form_signup.removeClass('is-selected');
                $form_forgot_password.removeClass('is-selected');
                $tab_login.addClass('selected');
                $tab_signup.removeClass('selected');
            }
            function signup_selected() {
                $form_login.removeClass('is-selected');
                $form_signup.addClass('is-selected');
                $form_forgot_password.removeClass('is-selected');
                $tab_login.removeClass('selected');
                $tab_signup.addClass('selected');
            }
            function forgot_password_selected() {
                $form_login.removeClass('is-selected');
                $form_signup.removeClass('is-selected');
                $form_forgot_password.addClass('is-selected');
            }
            //Kiểm tra form hợp lệ 
            $form_login.find('input[type="submit"]').on('click', function (event) {
                event.preventDefault();
                if ($('#signin-email').val() == '') {
                    $form_login.find('input[type="email"]').toggleClass('has-error').next('span').toggleClass('is-visible');
                }
            }
            );
            //IE9 placeholder fallback
            //credits http://www.hagenburger.net/BLOG/HTML5-Input-Placeholder-Fix-With-jQuery.html
            if (!Modernizr.input.placeholder) {
                $('[placeholder]').focus(function () {
                    var input = $(this);
                    if (input.val() == input.attr('placeholder')) {
                        input.val('');
                    }
                }
                ).blur(function () {
                    var input = $(this);
                    if (input.val() == '' || input.val() == input.attr('placeholder')) {
                        input.val(input.attr('placeholder'));
                    }
                }
                ).blur();
                $('[placeholder]').parents('form').submit(function () {
                    $(this).find('[placeholder]').each(function () {
                        var input = $(this);
                        if (input.val() == input.attr('placeholder')) {
                            input.val('');
                        }
                    }
                    )
                }
                );
            }
            window.onload = function () {
                var errorMessage = '<%= request.getAttribute("msg")%>';
                console.log(errorMessage);
                if (errorMessage && errorMessage.trim().toLowerCase() !== "null") {
//                document.getElementById("error-message").textContent = errorMessage;
                    $form_modal.addClass('is-visible');
                    $form_login.addClass('is-selected');
                    $form_signup.removeClass('is-selected');
                    $form_forgot_password.removeClass('is-selected');
                    $tab_login.addClass('selected');
                    $tab_signup.removeClass('selected');
                }
            };
        }
        );
        //credits https://css-tricks.com/snippets/jquery/move-cursor-to-end-of-textarea-or-input/
        jQuery.fn.putCursorAtEnd = function () {
            return this.each(function () {
                // If this function exists...
                if (this.setSelectionRange) {
                    // ... then use it (Doesn't work in IE)
                    // Double the length because Opera is inconsistent about whether a carriage return is one character or two. Sigh.
                    var len = $(this).val().length * 2;
                    this.setSelectionRange(len, len);
                } else {
                    // ... otherwise replace the contents with itself
                    // (Doesn't work in Google Chrome)
                    $(this).val($(this).val());
                }
            }
            );
        };
        jQuery('#cody-info ul li').eq(1).on('click', function () {
            $('#cody-info').hide();
        }
        );
    </script>
    <script>
        // Get the current URL
        var webUrl = window.location.href;
        var lines = webUrl.split("/");
        document.getElementById('url').value = lines[lines.length - 1];
        console.log(lines[lines.length - 1]);
    </script>
</html>
