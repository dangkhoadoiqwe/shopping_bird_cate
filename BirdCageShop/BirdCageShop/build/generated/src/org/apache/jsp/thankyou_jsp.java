package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class thankyou_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/headerGuest.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("  <meta charset=\"utf-8\">\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("  <meta name=\"author\" content=\"Untree.co\">\n");
      out.write("  <link rel=\"shortcut icon\" href=\"favicon.png\">\n");
      out.write("\n");
      out.write("  <meta name=\"description\" content=\"\" />\n");
      out.write("  <meta name=\"keywords\" content=\"bootstrap, bootstrap4\" />\n");
      out.write("\n");
      out.write("\t\t<!-- Bootstrap CSS -->\n");
      out.write("\t\t<link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("\t\t<link href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css\" rel=\"stylesheet\">\n");
      out.write("\t\t<link href=\"css/tiny-slider.css\" rel=\"stylesheet\">\n");
      out.write("\t\t<link href=\"css/style.css\" rel=\"stylesheet\">\n");
      out.write("                 <link href=\"css/login.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("\t\t<title>Furni Free Bootstrap 5 Template for Furniture and Interior Design Websites by Untree.co </title>\n");
      out.write("\t</head>\n");
      out.write("\n");
      out.write("\t<body>\n");
      out.write("\n");
      out.write("\t <header>\n");
      out.write("            ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <link href=\"scss/login.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js\">\n");
      out.write("        </script>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js\">\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <nav class=\"custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark\" arial-label=\"Furni navigation bar\">\n");
      out.write("\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <a class=\"navbar-brand\" href=\"homePage.jsp\">Furni<span>.</span></a>\n");
      out.write("\n");
      out.write("                <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#navbarsFurni\" aria-controls=\"navbarsFurni\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("                    <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("                </button>\n");
      out.write("\n");
      out.write("                <div class=\"collapse navbar-collapse\" id=\"navbarsFurni\">\n");
      out.write("                    <ul class=\"custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0\">\n");
      out.write("                        <li class=\"nav-item active\">\n");
      out.write("                            <a class=\"nav-link\" href=\"homePage.jsp\">Trang chủ</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li><a class=\"nav-link\" href=\"shop.jsp\">Cửa hàng</a></li>\n");
      out.write("                        <li><a class=\"nav-link\" href=\"blog.jsp\">Blog</a></li>\n");
      out.write("                        <li><a class=\"nav-link\" href=\"contact.jsp\">Liên hệ</a></li>\n");
      out.write("                    </ul>\n");
      out.write("\n");
      out.write("                    <ul class=\"custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5\">\n");
      out.write("                        <li><a class=\"cd-signin\" href=\"#\"><img style =\" margin-top:12px\" src=\"images/user.svg\"></a></li>\n");
      out.write("                        <li><a class=\"nav-link\" href=\"cart.html\"><img src=\"images/cart.svg\"></a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("        <div class=\"cd-user-modal\"> \n");
      out.write("            <!-- this is the entire modal form, including the background -->\n");
      out.write("            <div class=\"cd-user-modal-container\"> \n");
      out.write("                <!-- this is the container wrapper -->\n");
      out.write("                <ul class=\"cd-switcher\">\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"#0\">Đăng nhập\n");
      out.write("                        </a>\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"#0\">Tạo tài khoản\n");
      out.write("                        </a>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("                <div id=\"cd-login\"> \n");
      out.write("                    <!-- log in form -->\n");
      out.write("                    <form class=\"cd-form\">\n");
      out.write("                        <p class=\"fieldset\">\n");
      out.write("                            <label class=\"image-replace cd-email\" for=\"signin-email\">Email\n");
      out.write("                            </label>\n");
      out.write("                            <input class=\"full-width has-padding has-border\" id=\"signin-email\" type=\"email\" placeholder=\"E-mail\">\n");
      out.write("                            <span class=\"cd-error-message\">Email không được bỏ trống!\n");
      out.write("                            </span>\n");
      out.write("                        </p>\n");
      out.write("                        <p class=\"fieldset\">\n");
      out.write("                            <label class=\"image-replace cd-password\" for=\"signin-password\">Password\n");
      out.write("                            </label>\n");
      out.write("                            <input class=\"full-width has-padding has-border\" id=\"signin-password\" type=\"text\"  placeholder=\"Password\">\n");
      out.write("                            <a href=\"#0\" class=\"hide-password\">Hide\n");
      out.write("                            </a>\n");
      out.write("                            <span class=\"cd-error-message\">Password không được bỏ trống!\n");
      out.write("                            </span>\n");
      out.write("                        </p>\n");
      out.write("                        <p class=\"fieldset\">\n");
      out.write("                            <input type=\"checkbox\" id=\"remember-me\" checked>\n");
      out.write("                            <label for=\"remember-me\">Nhớ đăng nhập\n");
      out.write("                            </label>\n");
      out.write("                        </p>\n");
      out.write("                        <p class=\"fieldset\">\n");
      out.write("                            <input class=\"full-width\" type=\"submit\" value=\"Đăng nhập\">\n");
      out.write("                        </p>\n");
      out.write("                    </form>\n");
      out.write("                    <p class=\"cd-form-bottom-message\">\n");
      out.write("                        <a href=\"#0\">Quên mật khẩu?\n");
      out.write("                        </a>\n");
      out.write("                    </p>\n");
      out.write("                    <!-- <a href=\"#0\" class=\"cd-close-form\">Close</a> -->\n");
      out.write("                </div> \n");
      out.write("                <!-- cd-login -->\n");
      out.write("                <div id=\"cd-signup\"> \n");
      out.write("                    <!-- sign up form -->\n");
      out.write("                    <form class=\"cd-form\">\n");
      out.write("                        <p class=\"fieldset\">\n");
      out.write("                            <label class=\"image-replace cd-username\" for=\"signup-username\">Username\n");
      out.write("                            </label>\n");
      out.write("                            <input class=\"full-width has-padding has-border\" id=\"signup-username\" type=\"text\" placeholder=\"Username\">\n");
      out.write("                            <span class=\"cd-error-message\">Username không được bỏ trống!\n");
      out.write("                            </span>\n");
      out.write("                        </p>\n");
      out.write("                        <p class=\"fieldset\">\n");
      out.write("                            <label class=\"image-replace cd-email\" for=\"signup-email\">Email\n");
      out.write("                            </label>\n");
      out.write("                            <input class=\"full-width has-padding has-border\" id=\"signup-email\" type=\"email\" placeholder=\"E-mail\">\n");
      out.write("                            <span class=\"cd-error-message\">Email không được bỏ trống!\n");
      out.write("                            </span>\n");
      out.write("                        </p>\n");
      out.write("                        <p class=\"fieldset\">\n");
      out.write("                            <label class=\"image-replace cd-password\" for=\"signup-password\">Password\n");
      out.write("                            </label>\n");
      out.write("                            <input class=\"full-width has-padding has-border\" id=\"signup-password\" type=\"text\"  placeholder=\"Password\">\n");
      out.write("                            <a href=\"#0\" class=\"hide-password\">Hide\n");
      out.write("                            </a>\n");
      out.write("                            <span class=\"cd-error-message\">Password không được bỏ trống!\n");
      out.write("                            </span>\n");
      out.write("                        </p>\n");
      out.write("                        <p class=\"fieldset\">\n");
      out.write("                            <input type=\"checkbox\" id=\"accept-terms\">\n");
      out.write("                            <label for=\"accept-terms\">Tôi đồng ý với \n");
      out.write("                                <a href=\"#0\">Điều khoản & Chính sách\n");
      out.write("                                </a>\n");
      out.write("                            </label>\n");
      out.write("                        </p>\n");
      out.write("                        <p class=\"fieldset\">\n");
      out.write("                            <input class=\"full-width has-padding\" type=\"submit\" value=\"Tạo tài khoản\">\n");
      out.write("                        </p>\n");
      out.write("                    </form>\n");
      out.write("                    <!-- <a href=\"#0\" class=\"cd-close-form\">Close</a> -->\n");
      out.write("                </div> \n");
      out.write("                <!-- cd-signup -->\n");
      out.write("                <div id=\"cd-reset-password\"> \n");
      out.write("                    <!-- reset password form -->\n");
      out.write("                    <p class=\"cd-form-message\">Bạn quên mật khẩu? Vui lòng nhập email của bạn và chúng tôi sẽ gửi cho bạn một email có đường dẫn để thay đổi mật khẩu.\n");
      out.write("                    </p>\n");
      out.write("                    <form class=\"cd-form\">\n");
      out.write("                        <p class=\"fieldset\">\n");
      out.write("                            <label class=\"image-replace cd-email\" for=\"reset-email\">Email\n");
      out.write("                            </label>\n");
      out.write("                            <input class=\"full-width has-padding has-border\" id=\"reset-email\" type=\"email\" placeholder=\"E-mail\">\n");
      out.write("                            <span class=\"cd-error-message\">Email không được bỏ trống!\n");
      out.write("                            </span>\n");
      out.write("                        </p>\n");
      out.write("                        <p class=\"fieldset\">\n");
      out.write("                            <input class=\"full-width has-padding\" type=\"submit\" value=\"Reset password\">\n");
      out.write("                        </p>\n");
      out.write("                    </form>\n");
      out.write("                    <p class=\"cd-form-bottom-message\">\n");
      out.write("                        <a href=\"#0\">Quay lại đăng nhập\n");
      out.write("                        </a>\n");
      out.write("                    </p>\n");
      out.write("                </div> \n");
      out.write("                <!-- cd-reset-password -->\n");
      out.write("                <a href=\"#0\" class=\"cd-close-form\">Close\n");
      out.write("                </a>\n");
      out.write("            </div> \n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("    <script language=\"javascript\">\n");
      out.write("        jQuery(document).ready(function ($) {\n");
      out.write("            var $form_modal = $('.cd-user-modal'),\n");
      out.write("                    $form_login = $form_modal.find('#cd-login'),\n");
      out.write("                    $form_signup = $form_modal.find('#cd-signup'),\n");
      out.write("                    $form_forgot_password = $form_modal.find('#cd-reset-password'),\n");
      out.write("                    $form_modal_tab = $('.cd-switcher'),\n");
      out.write("                    $tab_login = $form_modal_tab.children('li').eq(0).children('a'),\n");
      out.write("                    $tab_signup = $form_modal_tab.children('li').eq(1).children('a'),\n");
      out.write("                    $forgot_password_link = $form_login.find('.cd-form-bottom-message a'),\n");
      out.write("                    $back_to_login_link = $form_forgot_password.find('.cd-form-bottom-message a'),\n");
      out.write("                    $main_nav = $('.cd-signin');\n");
      out.write("            //open modal\n");
      out.write("            $main_nav.on('click', function (event) {\n");
      out.write("                if ($(event.target).is($main_nav)) {\n");
      out.write("                    // on mobile open the submenu\n");
      out.write("                    $(this).children('ul').toggleClass('is-visible');\n");
      out.write("                } else {\n");
      out.write("                    // on mobile close submenu\n");
      out.write("                    $main_nav.children('ul').removeClass('is-visible');\n");
      out.write("                    //show modal layer\n");
      out.write("                    $form_modal.addClass('is-visible');\n");
      out.write("                    //show the selected form\n");
      out.write("                    ($(event.target).is('.cd-signup')) ? signup_selected() : login_selected();\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("            );\n");
      out.write("            //close modal\n");
      out.write("            $('.cd-user-modal').on('click', function (event) {\n");
      out.write("                if ($(event.target).is($form_modal) || $(event.target).is('.cd-close-form')) {\n");
      out.write("                    $form_modal.removeClass('is-visible');\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("            );\n");
      out.write("            //close modal when clicking the esc keyboard button\n");
      out.write("            $(document).keyup(function (event) {\n");
      out.write("                if (event.which == '27') {\n");
      out.write("                    $form_modal.removeClass('is-visible');\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("            );\n");
      out.write("            //switch from a tab to another\n");
      out.write("            $form_modal_tab.on('click', function (event) {\n");
      out.write("                event.preventDefault();\n");
      out.write("                ($(event.target).is($tab_login)) ? login_selected() : signup_selected();\n");
      out.write("            }\n");
      out.write("            );\n");
      out.write("            //hide or show password\n");
      out.write("            $('.hide-password').on('click', function () {\n");
      out.write("                var $this = $(this),\n");
      out.write("                        $password_field = $this.prev('input');\n");
      out.write("                ('password' == $password_field.attr('type')) ? $password_field.attr('type', 'text') : $password_field.attr('type', 'password');\n");
      out.write("                ('Hide' == $this.text()) ? $this.text('Show') : $this.text('Hide');\n");
      out.write("                //focus and move cursor to the end of input field\n");
      out.write("                $password_field.putCursorAtEnd();\n");
      out.write("            }\n");
      out.write("            );\n");
      out.write("            //show forgot-password form \n");
      out.write("            $forgot_password_link.on('click', function (event) {\n");
      out.write("                event.preventDefault();\n");
      out.write("                forgot_password_selected();\n");
      out.write("            }\n");
      out.write("            );\n");
      out.write("            //back to login from the forgot-password form\n");
      out.write("            $back_to_login_link.on('click', function (event) {\n");
      out.write("                event.preventDefault();\n");
      out.write("                login_selected();\n");
      out.write("            }\n");
      out.write("            );\n");
      out.write("            function login_selected() {\n");
      out.write("                $form_login.addClass('is-selected');\n");
      out.write("                $form_signup.removeClass('is-selected');\n");
      out.write("                $form_forgot_password.removeClass('is-selected');\n");
      out.write("                $tab_login.addClass('selected');\n");
      out.write("                $tab_signup.removeClass('selected');\n");
      out.write("            }\n");
      out.write("            function signup_selected() {\n");
      out.write("                $form_login.removeClass('is-selected');\n");
      out.write("                $form_signup.addClass('is-selected');\n");
      out.write("                $form_forgot_password.removeClass('is-selected');\n");
      out.write("                $tab_login.removeClass('selected');\n");
      out.write("                $tab_signup.addClass('selected');\n");
      out.write("            }\n");
      out.write("            function forgot_password_selected() {\n");
      out.write("                $form_login.removeClass('is-selected');\n");
      out.write("                $form_signup.removeClass('is-selected');\n");
      out.write("                $form_forgot_password.addClass('is-selected');\n");
      out.write("            }\n");
      out.write("            //Kiểm tra form hợp lệ \n");
      out.write("            $form_login.find('input[type=\"submit\"]').on('click', function (event) {\n");
      out.write("                event.preventDefault();\n");
      out.write("                if ($('#signin-email').val() == '') {\n");
      out.write("                    $form_login.find('input[type=\"email\"]').toggleClass('has-error').next('span').toggleClass('is-visible');\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("            );\n");
      out.write("            //IE9 placeholder fallback\n");
      out.write("            //credits http://www.hagenburger.net/BLOG/HTML5-Input-Placeholder-Fix-With-jQuery.html\n");
      out.write("            if (!Modernizr.input.placeholder) {\n");
      out.write("                $('[placeholder]').focus(function () {\n");
      out.write("                    var input = $(this);\n");
      out.write("                    if (input.val() == input.attr('placeholder')) {\n");
      out.write("                        input.val('');\n");
      out.write("                    }\n");
      out.write("                }\n");
      out.write("                ).blur(function () {\n");
      out.write("                    var input = $(this);\n");
      out.write("                    if (input.val() == '' || input.val() == input.attr('placeholder')) {\n");
      out.write("                        input.val(input.attr('placeholder'));\n");
      out.write("                    }\n");
      out.write("                }\n");
      out.write("                ).blur();\n");
      out.write("                $('[placeholder]').parents('form').submit(function () {\n");
      out.write("                    $(this).find('[placeholder]').each(function () {\n");
      out.write("                        var input = $(this);\n");
      out.write("                        if (input.val() == input.attr('placeholder')) {\n");
      out.write("                            input.val('');\n");
      out.write("                        }\n");
      out.write("                    }\n");
      out.write("                    )\n");
      out.write("                }\n");
      out.write("                );\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("        );\n");
      out.write("        //credits https://css-tricks.com/snippets/jquery/move-cursor-to-end-of-textarea-or-input/\n");
      out.write("        jQuery.fn.putCursorAtEnd = function () {\n");
      out.write("            return this.each(function () {\n");
      out.write("                // If this function exists...\n");
      out.write("                if (this.setSelectionRange) {\n");
      out.write("                    // ... then use it (Doesn't work in IE)\n");
      out.write("                    // Double the length because Opera is inconsistent about whether a carriage return is one character or two. Sigh.\n");
      out.write("                    var len = $(this).val().length * 2;\n");
      out.write("                    this.setSelectionRange(len, len);\n");
      out.write("                } else {\n");
      out.write("                    // ... otherwise replace the contents with itself\n");
      out.write("                    // (Doesn't work in Google Chrome)\n");
      out.write("                    $(this).val($(this).val());\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("            );\n");
      out.write("        };\n");
      out.write("        jQuery('#cody-info ul li').eq(1).on('click', function () {\n");
      out.write("            $('#cody-info').hide();\n");
      out.write("        }\n");
      out.write("        );\n");
      out.write("    </script>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("        </header>\n");
      out.write("\t\t<!-- End Header/Navigation -->\n");
      out.write("\n");
      out.write("\t\t<!-- Start Hero Section -->\n");
      out.write("\t\t\t<div class=\"hero\">\n");
      out.write("\t\t\t\t<div class=\"container\">\n");
      out.write("\t\t\t\t\t<div class=\"row justify-content-between\">\n");
      out.write("\t\t\t\t\t\t<div class=\"col-lg-5\">\n");
      out.write("\t\t\t\t\t\t\t<div class=\"intro-excerpt\">\n");
      out.write("\t\t\t\t\t\t\t\t<h1>Cart</h1>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<div class=\"col-lg-7\">\n");
      out.write("\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t<!-- End Hero Section -->\n");
      out.write("\n");
      out.write("\t\t\n");
      out.write("\n");
      out.write("\t\t<div class=\"untree_co-section\">\n");
      out.write("    <div class=\"container\">\n");
      out.write("      <div class=\"row\">\n");
      out.write("        <div class=\"col-md-12 text-center pt-5\">\n");
      out.write("          <span class=\"display-3 thankyou-icon text-primary\">\n");
      out.write("            <svg width=\"1em\" height=\"1em\" viewBox=\"0 0 16 16\" class=\"bi bi-cart-check mb-5\" fill=\"currentColor\" xmlns=\"http://www.w3.org/2000/svg\">\n");
      out.write("              <path fill-rule=\"evenodd\" d=\"M11.354 5.646a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L8 8.293l2.646-2.647a.5.5 0 0 1 .708 0z\"/>\n");
      out.write("              <path fill-rule=\"evenodd\" d=\"M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z\"/>\n");
      out.write("            </svg>\n");
      out.write("          </span>\n");
      out.write("          <h2 class=\"display-3 text-black\">Thank you!</h2>\n");
      out.write("          <p class=\"lead mb-5\">You order was successfuly completed.</p>\n");
      out.write("          <p><a href=\"shop.jsp\" class=\"btn btn-sm btn-outline-black\">Back to shop</a></p>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("\n");
      out.write("\t\t<!-- Start Footer Section -->\n");
      out.write("  <footer class=\"footer-section\">\n");
      out.write("            <div class=\"container relative\">\n");
      out.write("\n");
      out.write("                <div class=\"sofa-img\">\n");
      out.write("                    <!--<img src=\"\" alt=\"Image\" class=\"img-fluid\">-->\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-lg-8\">\n");
      out.write("                        <div class=\"subscription-form\">\n");
      out.write("                            <h3 class=\"d-flex align-items-center\"><span class=\"me-1\"><img src=\"images/envelope-outline.svg\" alt=\"Image\" class=\"img-fluid\"></span><span>Subscribe to Newsletter</span></h3>\n");
      out.write("\n");
      out.write("                            <form action=\"#\" class=\"row g-3\">\n");
      out.write("                                <div class=\"col-auto\">\n");
      out.write("                                    <input type=\"text\" class=\"form-control\" placeholder=\"Enter your name\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"col-auto\">\n");
      out.write("                                    <input type=\"email\" class=\"form-control\" placeholder=\"Enter your email\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"col-auto\">\n");
      out.write("                                    <button class=\"btn btn-primary\">\n");
      out.write("                                        <span class=\"fa fa-paper-plane\"></span>\n");
      out.write("                                    </button>\n");
      out.write("                                </div>\n");
      out.write("                            </form>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"row g-5 mb-5\">\n");
      out.write("                    <div class=\"col-lg-4\">\n");
      out.write("                        <div class=\"mb-4 footer-logo-wrap\"><a href=\"#\" class=\"footer-logo\">Furni<span>.</span></a></div>\n");
      out.write("                        <p class=\"mb-4\">Funi là cửa hàng sản phẩm lồng chim, phụ kiện lồng chim chính hãng từ  thương hiệu làng nghề thủ công mỹ nghệ hàng đầu Việt Nam Tự tin khẳng định chất lượng phục vụ với đội ngũ nhân viên năng động, chuyên nghiệp có khả năng am hiểu nhu cầu khách hàng cùng như thái độ phục vụ tận tụy.</p>\n");
      out.write("\n");
      out.write("                        <ul class=\"list-unstyled custom-social\">\n");
      out.write("                            <li><a href=\"#\"><span class=\"fa fa-brands fa-facebook-f\"></span></a></li>\n");
      out.write("                            <li><a href=\"#\"><span class=\"fa fa-brands fa-twitter\"></span></a></li>\n");
      out.write("                            <li><a href=\"#\"><span class=\"fa fa-brands fa-instagram\"></span></a></li>\n");
      out.write("                            <li><a href=\"#\"><span class=\"fa fa-brands fa-linkedin\"></span></a></li>\n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"col-lg-8\">\n");
      out.write("                        <div class=\"row links-wrap\">\n");
      out.write("                             <div class=\"col-6 col-sm-6 col-md-4\">\n");
      out.write("                                <ul class=\"list-unstyled\">\n");
      out.write("                                    <li><a style = color:red;>Cửa hàng</a></li>\n");
      out.write("                                    <li><a href=\"homePage.jsp\">Giới thiệu</a></li>\n");
      out.write("                                    <li><a href=\"shop.jsp\">Sản phẩm</a></li>\n");
      out.write("                                    <li><a href=\"blog.jsp\">Blog</a></li>\n");
      out.write("                                    <li><a href=\"contact.jsp\">Liên hệ</a></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                          <div class=\"col-6 col-sm-6 col-md-4\">\n");
      out.write("                                <ul class=\"list-unstyled\">\n");
      out.write("                                    <li><a style = color:red;>Chính sách</a></li>\n");
      out.write("                                    <li><a href=\"chinhsachdoitra.jsp\">Chính sách đổi trả</a></li>\n");
      out.write("                                    <li><a href=\"csMua.jsp\">Chính sách mua hàng</a></li>\n");
      out.write("                                    <li><a href=\"csbaomat.jsp\">Chính sách bảo mật</a></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <div class=\"col-6 col-sm-6 col-md-4\">\n");
      out.write("                                <ul class=\"list-unstyled\">\n");
      out.write("                                    <li><a style = color:red;>Liên hệ với chúng tôi</a></li>\n");
      out.write("                                    <li><a href=\"#\">Hotline:097777555</a></li>\n");
      out.write("                                    <li><a href=\"#\">funi@gmail.com</a></li>\n");
      out.write("                                    <li><a href=\"#\">Số 1 đường D1, Thành phố Thủ Đức,Thành Phố Hồ Chí Minh</a></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                       \n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("              \n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </footer>\n");
      out.write("\t\t<!-- End Footer Section -->\t\n");
      out.write("\n");
      out.write("\n");
      out.write("\t\t<script src=\"js/bootstrap.bundle.min.js\"></script>\n");
      out.write("\t\t<script src=\"js/tiny-slider.js\"></script>\n");
      out.write("\t\t<script src=\"js/custom.js\"></script>\n");
      out.write("\t</body>\n");
      out.write("\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
