<%-- 
    Document   : profile
    Created on : 03-10-2023, 17:07:47
    Author     : Quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
﻿<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Hotel Dashboard Template</title>
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/css/feathericon.min.css">
        <link rel="stylesheet" href="assets/plugins/morris/morris.css">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="assets/css/style.css"> </head>
 
    <body>
     <div class="page-header mt-12">   <div class="col-lg-12"></div>      <nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="Furni navigation bar">

            <div class="container">
                <a class="navbar-brand" href="homePage.jsp" style="margin-left: 30px">Furni<span>.</span></a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni" aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarsFurni">
                    <ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
                        <li class="nav-item active">
                            <a class="nav-link" href="homePage.jsp">Trang chủ</a>
                        </li>
                        <li><a class="nav-link" href="shop.jsp">Cửa hàng</a></li>
                        <li><a class="nav-link" href="blog.jsp">Blog</a></li>
                        <li><a class="nav-link" href="contact.jsp">Liên hệ</a></li>
                    </ul>
                    <ul><!-- Thêm menu "Setting" -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="settingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="margin-top:15px;color:#ffffff; ">
                                Tôi
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="settingDropdown">
                                <li><a class="dropdown-item" href="Profile.jsp">Profile</a></li>
                                <li><a class="dropdown-item" href="delivery.jsp">Logout</a></li>
                            </ul>
                        </li></ul>
                    <ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
                        <li><a class="cd-signin" href="#"><img style =" margin-top:12px" src="images/user.svg"></a></li>
                        <li><a class="nav-link" href="cart.jsp"><img src="images/cart.svg"></a></li>
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
                    <form class="cd-form">
                        <p class="fieldset">
                            <label class="image-replace cd-email" for="signin-email">Email
                            </label>
                            <input class="full-width has-padding has-border" id="signin-email" type="email" placeholder="E-mail">
                            <span class="cd-error-message">Email không được bỏ trống!
                            </span>
                        </p>
                        <p class="fieldset">
                            <label class="image-replace cd-password" for="signin-password">Password
                            </label>
                            <input class="full-width has-padding has-border" id="signin-password" type="text"  placeholder="Password">
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
                        <p class="fieldset">
                            <input class="full-width" type="submit" value="Đăng nhập">
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
                    <form class="cd-form">
                        <p class="fieldset">
                            <label class="image-replace cd-username" for="signup-username">Username
                            </label>
                            <input class="full-width has-padding has-border" id="signup-username" type="text" placeholder="Username">
                            <span class="cd-error-message">Username không được bỏ trống!
                            </span>
                        </p>
                        <p class="fieldset">
                            <label class="image-replace cd-email" for="signup-email">Email
                            </label>
                            <input class="full-width has-padding has-border" id="signup-email" type="email" placeholder="E-mail">
                            <span class="cd-error-message">Email không được bỏ trống!
                            </span>
                        </p>
                        <p class="fieldset">
                            <label class="image-replace cd-password" for="signup-password">Password
                            </label>
                            <input class="full-width has-padding has-border" id="signup-password" type="text"  placeholder="Password">
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
                            <input class="full-width has-padding" type="submit" value="Tạo tài khoản">
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

     </div> </div> 
        <div class="main-wrapper">
          
         
          
                <div class="content container-fluid">
                    <div class="page-header mt-12">
                        <div class="row">
                            <div class="col">
                                <h3 class="page-title">Profile</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Profile</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
<!--                            <div class="profile-header">
                                <div class="row align-items-center">
                                    <div class="col-auto profile-image">
                                        <a href="#"> <img class="rounded-circle" alt="User Image" src="assets/img/profiles/avatar-02.jpg"> </a>
                                    </div>
                                    <div class="col ml-md-n2 profile-user-info">
                                        <h4 class="user-name mb-3">David Alvarez</h4>
                                        <h6 class="text-muted mt-1">Manager</h6>
                                        <div class="user-Location mt-1"><i class="fas fa-map-marker-alt"></i> Florida, United States</div>
                                        <div class="about-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</div>
                                    </div>
                                    <div class="col-auto profile-btn"> <a href="" class="btn btn-primary">
                                            Message
                                        </a> <a href="edit-profile.html" class="btn btn-primary">
                                            Edit
                                        </a> </div>
                                </div>
                            </div>-->
                            <div class="profile-menu">
                                <ul class="nav nav-tabs nav-tabs-solid">
                                    <li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#per_details_tab">About</a> </li>
                                    <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#password_tab">Password</a> </li>
                                </ul>
                            </div>
                            <div class="tab-content profile-tab-cont">
                                <div class="tab-pane fade show active" id="per_details_tab">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h5 class="card-title d-flex justify-content-between">
                                                        <span>Personal Details</span>
                                                        <a class="edit-link" data-toggle="modal" href="#edit_personal_details"><i class="fa fa-edit mr-1"></i>Sửa</a>
                                                    </h5>
                                                    <div class="row mt-5">
                                                        <p class="col-sm-3 text-sm-right mb-0 mb-sm-3">Tên</p>
                                                        <p class="col-sm-9">Quang</p>
                                                    </div>
                                                    <div class="row">
                                                        <p class="col-sm-3 text-sm-right mb-0 mb-sm-3">Phone</p>
                                                        <p class="col-sm-9">011111</p>
                                                    </div>
                                                    <div class="row">
                                                        <p class="col-sm-3 text-sm-right mb-0 mb-sm-3">Email  </p>
                                                        <p class="col-sm-9"><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="caaeabbca3aeaba6bcabb8afb08aafb2aba7baa6afe4a9a5a7">[email&#160;protected]</a></p>
                                                    </div>
<!--                                                    <div class="row">
                                                        <p class="col-sm-3 text-sm-right mb-0 mb-sm-3">Mobile</p>
                                                        <p class="col-sm-9">305-310-5857</p>
                                                    </div>-->
                                                    <div class="row">
                                                        <p class="col-sm-3 text-sm-right mb-0">Address</p>
                                                        <p class="col-sm-9 mb-0">4663 Agriculture Lane,
                                                            <br> Miami,
                                                            <br> Florida - 33165,
                                                            <br> United States.</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal fade" id="edit_personal_details" aria-hidden="true" role="dialog">
                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Personal Details</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form>
                                                                <div class="row form-row">
                                                                    <div class="col-12 col-sm-6">
                                                                        <div class="form-group">
                                                                            <label>Tên</label>
                                                                            <input type="text" class="form-control" value="John"> </div>
                                                                    </div>
<!--                                                                    <div class="col-12 col-sm-6">
                                                                        <div class="form-group">
                                                                            <label>Last Name</label>
                                                                            <input type="text" class="form-control" value="Doe"> </div>
                                                                    </div>-->
                                                                    <div class="col-12-sm-6">
                                                                        <div class="form-group">
                                                                            <label>Phone</label>
                                                                            
                                                                                <input type="text" class="form-control" value="09122222"> 
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-12 col-sm-6">
                                                                        <div class="form-group">
                                                                            <label>Email </label>
                                                                            <input type="email" class="form-control" value="johndoe@example.com"> </div>
                                                                    </div>
<!--                                                                    <div class="col-12 col-sm-6">
                                                                        <div class="form-group">
                                                                            <label>Mobile</label>
                                                                            <input type="text" value="+1 202-555-0125" class="form-control"> </div>
                                                                    </div>-->
                                                                    <div class="col-12">
                                                                        <h5 class="form-title"><span>Địa chỉ</span></h5> </div>
                                                                    <div class="col-12">
                                                                        <div class="form-group">
                                                                            <label>Địa chỉ</label>
                                                                            <input type="text" class="form-control" value="4663 Agriculture Lane"> </div>
                                                                    </div>
                                                                    <div class="col-12 col-sm-6">
                                                                        <div class="form-group">
                                                                            <label>Thành phố</label>
                                                                            <input type="text" class="form-control" value="Miami"> </div>
                                                                    </div>
                                                                    <div class="col-12 col-sm-6">
                                                                        <div class="form-group">
                                                                            <label>Quận</label>
                                                                            <input type="text" class="form-control" value="Florida"> </div>
                                                                    </div>
                                                                    <div class="col-12 col-sm-6">
                                                                        <div class="form-group">
                                                                            <label>Phường</label>
                                                                            <input type="text" class="form-control" value="22434"> </div>
                                                                    </div>
<!--                                                                    <div class="col-12 col-sm-6">
                                                                        <div class="form-group">
                                                                            <label>Country</label>
                                                                            <input type="text" class="form-control" value="United States"> </div>
                                                                    </div>-->
                                                                </div>
                                                                <button type="submit" class="btn btn-primary btn-block">Lưu</button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h5 class="card-title d-flex justify-content-between">
                                                        <span>Ảnh đại diện</span>
                                                        <a class="edit-link" data-toggle="modal" href="#edit_personal"><i class="fa fa-edit mr-1"></i>Thay đổi</a>
                                                    </h5>
                                                    <img class="avatar-img rounded-circle" alt="User Image" src="assets/img/profiles/avatar-02.jpg">
<!--                                                    <div class="row mt-5">
                                                        <p class="col-sm-3 text-sm-right mb-0 mb-sm-3">Name</p>
                                                        <p class="col-sm-9">David Alvarez</p>
                                                    </div>
                                                    <div class="row">
                                                        <p class="col-sm-3 text-sm-right mb-0 mb-sm-3">Date of Birth</p>
                                                        <p class="col-sm-9">24 Jul 1983</p>
                                                    </div>
                                                    <div class="row">
                                                        <p class="col-sm-3 text-sm-right mb-0 mb-sm-3">Email ID </p>
                                                        <p class="col-sm-9"><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="385c594e515c59544e594a5d42785d40595548545d165b5755">[email&#160;protected]</a></p>
                                                    </div>
                                                    <div class="row">
                                                        <p class="col-sm-3 text-sm-right mb-0 mb-sm-3">Mobile</p>
                                                        <p class="col-sm-9">305-310-5857</p>
                                                    </div>
                                                    <div class="row">
                                                        <p class="col-sm-3 text-sm-right mb-0">Address</p>
                                                        <p class="col-sm-9 mb-0">4663 Agriculture Lane,
                                                            <br> Miami,
                                                            <br> Florida - 33165,
                                                            <br> United States.</p>
                                                    </div>-->
                                                </div>
                                            </div>
                                            <div class="modal fade" id="edit_personal" aria-hidden="true" role="dialog">
                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Ảnh đại diện</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            
                                                            <form>
                                                                <div class="row form-row">
                                                                    <div class="col-12 col-sm-6">
                                                                        <div class="form-group">
<!--                                                                            <label>First Name</label>
                                                                            <input type="text" class="form-control" value="John"> </div>-->
                                                                             <input type="file" name="newAvatar" accept="image/*">
                                                           
                                                                    </div>
<!--                                                                    <div class="col-12 col-sm-6">
                                                                        <div class="form-group">
                                                                            <label>Last Name</label>
                                                                            <input type="text" class="form-control" value="Doe"> </div>
                                                                    </div>
                                                                    <div class="col-12">
                                                                        <div class="form-group">
                                                                            <label>Date of Birth</label>
                                                                            <div class="cal-icon">
                                                                                <input type="text" class="form-control" value="24-07-1983"> </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-12 col-sm-6">
                                                                        <div class="form-group">
                                                                            <label>Email ID</label>
                                                                            <input type="email" class="form-control" value="johndoe@example.com"> </div>
                                                                    </div>
                                                                    <div class="col-12 col-sm-6">
                                                                        <div class="form-group">
                                                                            <label>Mobile</label>
                                                                            <input type="text" value="+1 202-555-0125" class="form-control"> </div>
                                                                    </div>
                                                                    <div class="col-12">
                                                                        <h5 class="form-title"><span>Address</span></h5> </div>
                                                                    <div class="col-12">
                                                                        <div class="form-group">
                                                                            <label>Address</label>
                                                                            <input type="text" class="form-control" value="4663 Agriculture Lane"> </div>
                                                                    </div>
                                                                    <div class="col-12 col-sm-6">
                                                                        <div class="form-group">
                                                                            <label>City</label>
                                                                            <input type="text" class="form-control" value="Miami"> </div>
                                                                    </div>
                                                                    <div class="col-12 col-sm-6">
                                                                        <div class="form-group">
                                                                            <label>State</label>
                                                                            <input type="text" class="form-control" value="Florida"> </div>
                                                                    </div>
                                                                    <div class="col-12 col-sm-6">
                                                                        <div class="form-group">
                                                                            <label>Zip Code</label>
                                                                            <input type="text" class="form-control" value="22434"> </div>
                                                                    </div>
                                                                    <div class="col-12 col-sm-6">
                                                                        <div class="form-group">
                                                                            <label>Country</label>
                                                                            <input type="text" class="form-control" value="United States"> </div>
                                                                    </div>-->
                                                                </div>
                                                                    </div>
                                                                <button type="submit" class="btn btn-primary btn-block">Lưu</button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="password_tab" class="tab-pane fade">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title">Thay đổi mật khẩu</h5>
                                            <div class="row">
                                                <div class="col-md-10 col-lg-6">
                                                    <form>
                                                        <div class="form-group">
                                                            <label>Mật khẩu cũ</label>
                                                            <input type="password" class="form-control"> </div>
                                                        <div class="form-group">
                                                            <label>Mật khẩu mới</label>
                                                            <input type="password" class="form-control"> </div>
                                                        <div class="form-group">
                                                            <label>Nhập lại mật khẩu</label>
                                                            <input type="password" class="form-control"> </div>
                                                        <button class="btn btn-primary" type="submit">Lưu</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<!--             avatar-->
        
        </div>
        <script data-cfasync="false" src="../../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="assets/js/jquery-3.5.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
        <script src="assets/js/script.js"></script>
   
    
    </body>

</html>
