package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

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
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link href=\"css/login.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <!DOCTYPE html>\n");
      out.write("    <header role=\"banner\">\n");
      out.write("        <div id=\"cd-logo\">\n");
      out.write("            <a href=\"#0\">\n");
      out.write("                <img src=\"https://blog.luyencode.net/wp-content/uploads/2020/10/cd-logo.png\" alt=\"Logo\">\n");
      out.write("            </a>\n");
      out.write("        </div>\n");
      out.write("        <nav class=\"main-nav\">\n");
      out.write("            <ul>\n");
      out.write("                <!-- inser more links here -->\n");
      out.write("                <li>\n");
      out.write("                    <a class=\"cd-signin\" href=\"#0\">Đăng nhập\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("                <li>\n");
      out.write("                    <a class=\"cd-signup\" href=\"#0\">Đăng ký\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("            </ul>\n");
      out.write("        </nav>\n");
      out.write("    </header>\n");
      out.write("    <div class=\"cd-user-modal\"> \n");
      out.write("        <!-- this is the entire modal form, including the background -->\n");
      out.write("        <div class=\"cd-user-modal-container\"> \n");
      out.write("            <!-- this is the container wrapper -->\n");
      out.write("            <ul class=\"cd-switcher\">\n");
      out.write("                <li>\n");
      out.write("                    <a href=\"#0\">Đăng nhập\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("                <li>\n");
      out.write("                    <a href=\"#0\">Tạo tài khoản\n");
      out.write("                    </a>\n");
      out.write("                </li>\n");
      out.write("            </ul>\n");
      out.write("            <div id=\"cd-login\"> \n");
      out.write("                <!-- log in form -->\n");
      out.write("                <form class=\"cd-form\">\n");
      out.write("                    <p class=\"fieldset\">\n");
      out.write("                        <label class=\"image-replace cd-email\" for=\"signin-email\">Email\n");
      out.write("                        </label>\n");
      out.write("                        <input class=\"full-width has-padding has-border\" id=\"signin-email\" type=\"email\" placeholder=\"E-mail\">\n");
      out.write("                        <span class=\"cd-error-message\">Email không được bỏ trống!\n");
      out.write("                        </span>\n");
      out.write("                    </p>\n");
      out.write("                    <p class=\"fieldset\">\n");
      out.write("                        <label class=\"image-replace cd-password\" for=\"signin-password\">Password\n");
      out.write("                        </label>\n");
      out.write("                        <input class=\"full-width has-padding has-border\" id=\"signin-password\" type=\"text\"  placeholder=\"Password\">\n");
      out.write("                        <a href=\"#0\" class=\"hide-password\">Hide\n");
      out.write("                        </a>\n");
      out.write("                        <span class=\"cd-error-message\">Password không được bỏ trống!\n");
      out.write("                        </span>\n");
      out.write("                    </p>\n");
      out.write("                    <p class=\"fieldset\">\n");
      out.write("                        <input type=\"checkbox\" id=\"remember-me\" checked>\n");
      out.write("                        <label for=\"remember-me\">Nhớ đăng nhập\n");
      out.write("                        </label>\n");
      out.write("                    </p>\n");
      out.write("                    <p class=\"fieldset\">\n");
      out.write("                        <input class=\"full-width\" type=\"submit\" value=\"Đăng nhập\">\n");
      out.write("                    </p>\n");
      out.write("                </form>\n");
      out.write("                <p class=\"cd-form-bottom-message\">\n");
      out.write("                    <a href=\"#0\">Quên mật khẩu?\n");
      out.write("                    </a>\n");
      out.write("                </p>\n");
      out.write("                <!-- <a href=\"#0\" class=\"cd-close-form\">Close</a> -->\n");
      out.write("            </div> \n");
      out.write("            <!-- cd-login -->\n");
      out.write("            <div id=\"cd-signup\"> \n");
      out.write("                <!-- sign up form -->\n");
      out.write("                <form class=\"cd-form\">\n");
      out.write("                    <p class=\"fieldset\">\n");
      out.write("                        <label class=\"image-replace cd-username\" for=\"signup-username\">Username\n");
      out.write("                        </label>\n");
      out.write("                        <input class=\"full-width has-padding has-border\" id=\"signup-username\" type=\"text\" placeholder=\"Username\">\n");
      out.write("                        <span class=\"cd-error-message\">Username không được bỏ trống!\n");
      out.write("                        </span>\n");
      out.write("                    </p>\n");
      out.write("                    <p class=\"fieldset\">\n");
      out.write("                        <label class=\"image-replace cd-email\" for=\"signup-email\">Email\n");
      out.write("                        </label>\n");
      out.write("                        <input class=\"full-width has-padding has-border\" id=\"signup-email\" type=\"email\" placeholder=\"E-mail\">\n");
      out.write("                        <span class=\"cd-error-message\">Email không được bỏ trống!\n");
      out.write("                        </span>\n");
      out.write("                    </p>\n");
      out.write("                    <p class=\"fieldset\">\n");
      out.write("                        <label class=\"image-replace cd-password\" for=\"signup-password\">Password\n");
      out.write("                        </label>\n");
      out.write("                        <input class=\"full-width has-padding has-border\" id=\"signup-password\" type=\"text\"  placeholder=\"Password\">\n");
      out.write("                        <a href=\"#0\" class=\"hide-password\">Hide\n");
      out.write("                        </a>\n");
      out.write("                        <span class=\"cd-error-message\">Password không được bỏ trống!\n");
      out.write("                        </span>\n");
      out.write("                    </p>\n");
      out.write("                    <p class=\"fieldset\">\n");
      out.write("                        <input type=\"checkbox\" id=\"accept-terms\">\n");
      out.write("                        <label for=\"accept-terms\">Tôi đồng ý với \n");
      out.write("                            <a href=\"#0\">Điều khoản & Chính sách\n");
      out.write("                            </a>\n");
      out.write("                        </label>\n");
      out.write("                    </p>\n");
      out.write("                    <p class=\"fieldset\">\n");
      out.write("                        <input class=\"full-width has-padding\" type=\"submit\" value=\"Tạo tài khoản\">\n");
      out.write("                    </p>\n");
      out.write("                </form>\n");
      out.write("                <!-- <a href=\"#0\" class=\"cd-close-form\">Close</a> -->\n");
      out.write("            </div> \n");
      out.write("            <!-- cd-signup -->\n");
      out.write("            <div id=\"cd-reset-password\"> \n");
      out.write("                <!-- reset password form -->\n");
      out.write("                <p class=\"cd-form-message\">Bạn quên mật khẩu? Vui lòng nhập email của bạn và chúng tôi sẽ gửi cho bạn một email có đường dẫn để thay đổi mật khẩu.\n");
      out.write("                </p>\n");
      out.write("                <form class=\"cd-form\">\n");
      out.write("                    <p class=\"fieldset\">\n");
      out.write("                        <label class=\"image-replace cd-email\" for=\"reset-email\">Email\n");
      out.write("                        </label>\n");
      out.write("                        <input class=\"full-width has-padding has-border\" id=\"reset-email\" type=\"email\" placeholder=\"E-mail\">\n");
      out.write("                        <span class=\"cd-error-message\">Email không được bỏ trống!\n");
      out.write("                        </span>\n");
      out.write("                    </p>\n");
      out.write("                    <p class=\"fieldset\">\n");
      out.write("                        <input class=\"full-width has-padding\" type=\"submit\" value=\"Reset password\">\n");
      out.write("                    </p>\n");
      out.write("                </form>\n");
      out.write("                <p class=\"cd-form-bottom-message\">\n");
      out.write("                    <a href=\"#0\">Quay lại đăng nhập\n");
      out.write("                    </a>\n");
      out.write("                </p>\n");
      out.write("            </div> \n");
      out.write("            <!-- cd-reset-password -->\n");
      out.write("            <a href=\"#0\" class=\"cd-close-form\">Close\n");
      out.write("            </a>\n");
      out.write("        </div> \n");
      out.write("        <!-- cd-user-modal-container -->\n");
      out.write("    </div> \n");
      out.write("    <!-- cd-user-modal -->\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("<script>\n");
      out.write("    // Hàm hiển thị popup đăng nhập\n");
      out.write("    function showLoginPopup() {\n");
      out.write("        var loginPopup = document.getElementById(\"cd-login\");\n");
      out.write("        loginPopup.style.display = \"block\";\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    // Hàm hiển thị popup đăng ký\n");
      out.write("    function showSignupPopup() {\n");
      out.write("        var signupPopup = document.getElementById(\"cd-signup\");\n");
      out.write("        signupPopup.style.display = \"block\";\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    // Hàm ẩn popup\n");
      out.write("    function hidePopup() {\n");
      out.write("        var popups = document.getElementsByClassName(\"cd-user-modal-container\");\n");
      out.write("        for (var i = 0; i < popups.length; i++) {\n");
      out.write("            popups[i].style.display = \"none\";\n");
      out.write("        }\n");
      out.write("    }\n");
      out.write("</script>\n");
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
