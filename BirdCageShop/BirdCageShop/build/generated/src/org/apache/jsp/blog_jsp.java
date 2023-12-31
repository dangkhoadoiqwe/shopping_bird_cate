package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class blog_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("        <meta name=\"author\" content=\"Untree.co\">\n");
      out.write("        <link rel=\"shortcut icon\" href=\"favicon.png\">\n");
      out.write("\n");
      out.write("        <meta name=\"description\" content=\"\" />\n");
      out.write("        <meta name=\"keywords\" content=\"bootstrap, bootstrap4\" />\n");
      out.write("\n");
      out.write("        <!-- Bootstrap CSS -->\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"css/tiny-slider.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"css/style.css\" rel=\"stylesheet\">\n");
      out.write("        <title>Furni Free Bootstrap 5 Template for Furniture and Interior Design Websites by Untree.co </title>\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <!-- Start Header/Navigation -->\n");
      out.write("        <nav class=\"custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark\" arial-label=\"Furni navigation bar\">\n");
      out.write("\n");
      out.write("                <div class=\"container\">\n");
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
      out.write("                        <li><a class=\"cd-signin\" href=\"#\">Đăng nhập<img src=\"images/user.svg\"></a></li>\n");
      out.write("                        <li><a class=\"nav-link\" href=\"cart.html\"><img src=\"images/cart.svg\"></a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </nav>\n");
      out.write("        <!-- End Header/Navigation -->\n");
      out.write("\n");
      out.write("        <!-- Start Hero Section -->\n");
      out.write("        <div class=\"hero\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row justify-content-between\">\n");
      out.write("                    <div class=\"col-lg-5\">\n");
      out.write("                        <div class=\"intro-excerpt\">\n");
      out.write("                            <h1>Blog</h1>\n");
      out.write("<!--                            <p class=\"mb-4\">Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam vulputate velit imperdiet dolor tempor tristique.</p>-->\n");
      out.write("                            <!--<p><a href=\"\" class=\"btn btn-secondary me-2\">Shop Now</a><a href=\"#\" class=\"btn btn-white-outline\">Explore</a></p>-->\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-lg-7\">\n");
      out.write("                        <div class=\"hero-img-wrap\">\n");
      out.write("                            <!--<img src=\"images/couch.png\" class=\"img-fluid\">-->\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!-- End Hero Section -->\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- Start Blog Section -->\n");
      out.write("        <div class=\"blog-section\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row mb-5\">\n");
      out.write("                    <div class=\"col-md-6\">\n");
      out.write("                        <h2 class=\"section-title\"> Blog</h2>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-6 text-start text-md-end\">\n");
      out.write("                        <a href=\"blog.jsp\" class=\"more\">Xem thêm</a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"row\">\n");
      out.write("\n");
      out.write("                    <div class=\"col-12 col-sm-6 col-md-4 mb-4 mb-md-0\">\n");
      out.write("                        <div class=\"post-entry\">\n");
      out.write("                            <a href=\"#\" class=\"post-thumbnail\"><img src=\"images/post-4.jpg\" alt=\"Image\" class=\"img-fluid\"></a>\n");
      out.write("                            <div class=\"post-content-entry\">\n");
      out.write("                                <h3><a href=\"#\">Lồng chim độc đáo</a></h3>\n");
      out.write("                                <div class=\"meta\">\n");
      out.write("                                    <span>by <a href=\"#\">Quang</a></span> <span>on <a href=\"#\">19-12, 2021</a></span>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"col-12 col-sm-6 col-md-4 mb-4 mb-md-0\">\n");
      out.write("                        <div class=\"post-entry\">\n");
      out.write("                            <a href=\"#\" class=\"post-thumbnail\"><img src=\"images/post-2.jpg\" alt=\"Image\" class=\"img-fluid\"></a>\n");
      out.write("                            <div class=\"post-content-entry\">\n");
      out.write("                                <h3><a href=\"#\">Môi trường sống động </a></h3>\n");
      out.write("                                <div class=\"meta\">\n");
      out.write("                                    <span>by <a href=\"#\">Quang</a></span> <span>on <a href=\"#\"> 15-12, 2021</a></span>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"col-12 col-sm-6 col-md-4 mb-4 mb-md-0\">\n");
      out.write("                        <div class=\"post-entry\">\n");
      out.write("                            <a href=\"#\" class=\"post-thumbnail\"><img src=\"images/img-grid-12.jpg\" alt=\"Image\" class=\"img-fluid\"></a>\n");
      out.write("                            <div class=\"post-content-entry\">\n");
      out.write("                                <h3><a href=\"#\">Không gian độc đáo cho những đôi cánh</a></h3>\n");
      out.write("                                <div class=\"meta\">\n");
      out.write("                                    <span>by <a href=\"#\">Quang</a></span> <span>on <a href=\"#\">12 12, 2021</a></span>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!-- End Blog Section -->\t\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- Start Testimonial Slider -->\n");
      out.write("        <div class=\"testimonial-section before-footer-section\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-lg-7 mx-auto text-center\">\n");
      out.write("                        <h2 class=\"section-title\">Testimonials</h2>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"row justify-content-center\">\n");
      out.write("                    <div class=\"col-lg-12\">\n");
      out.write("                        <div class=\"testimonial-slider-wrap text-center\">\n");
      out.write("\n");
      out.write("                            <div id=\"testimonial-nav\">\n");
      out.write("                                <span class=\"prev\" data-controls=\"prev\"><span class=\"fa fa-chevron-left\"></span></span>\n");
      out.write("                                <span class=\"next\" data-controls=\"next\"><span class=\"fa fa-chevron-right\"></span></span>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <div class=\"testimonial-slider\">\n");
      out.write("\n");
      out.write("                                <div class=\"item\">\n");
      out.write("                                    <div class=\"row justify-content-center\">\n");
      out.write("                                        <div class=\"col-lg-8 mx-auto\">\n");
      out.write("\n");
      out.write("                                            <div class=\"testimonial-block text-center\">\n");
      out.write("                                                <blockquote class=\"mb-5\">\n");
      out.write("                                                    <p>&ldquo;Donec facilisis quam ut purus rutrum lobortis. Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam vulputate velit imperdiet dolor tempor tristique. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer convallis volutpat dui quis scelerisque.&rdquo;</p>\n");
      out.write("                                                </blockquote>\n");
      out.write("\n");
      out.write("                                                <div class=\"author-info\">\n");
      out.write("                                                    <div class=\"author-pic\">\n");
      out.write("                                                        <img src=\"images/person-1.png\" alt=\"Maria Jones\" class=\"img-fluid\">\n");
      out.write("                                                    </div>\n");
      out.write("                                                    <h3 class=\"font-weight-bold\">Maria Jones</h3>\n");
      out.write("                                                    <span class=\"position d-block mb-3\">CEO, Co-Founder, XYZ Inc.</span>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div> \n");
      out.write("                                <!-- END item -->\n");
      out.write("\n");
      out.write("                                <div class=\"item\">\n");
      out.write("                                    <div class=\"row justify-content-center\">\n");
      out.write("                                        <div class=\"col-lg-8 mx-auto\">\n");
      out.write("\n");
      out.write("                                            <div class=\"testimonial-block text-center\">\n");
      out.write("                                                <blockquote class=\"mb-5\">\n");
      out.write("                                                    <p>&ldquo;Donec facilisis quam ut purus rutrum lobortis. Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam vulputate velit imperdiet dolor tempor tristique. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer convallis volutpat dui quis scelerisque.&rdquo;</p>\n");
      out.write("                                                </blockquote>\n");
      out.write("\n");
      out.write("                                                <div class=\"author-info\">\n");
      out.write("                                                    <div class=\"author-pic\">\n");
      out.write("                                                        <img src=\"images/person-1.png\" alt=\"Maria Jones\" class=\"img-fluid\">\n");
      out.write("                                                    </div>\n");
      out.write("                                                    <h3 class=\"font-weight-bold\">Maria Jones</h3>\n");
      out.write("                                                    <span class=\"position d-block mb-3\">CEO, Co-Founder, XYZ Inc.</span>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div> \n");
      out.write("                                <!-- END item -->\n");
      out.write("\n");
      out.write("                                <div class=\"item\">\n");
      out.write("                                    <div class=\"row justify-content-center\">\n");
      out.write("                                        <div class=\"col-lg-8 mx-auto\">\n");
      out.write("\n");
      out.write("                                            <div class=\"testimonial-block text-center\">\n");
      out.write("                                                <blockquote class=\"mb-5\">\n");
      out.write("                                                    <p>&ldquo;Donec facilisis quam ut purus rutrum lobortis. Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam vulputate velit imperdiet dolor tempor tristique. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer convallis volutpat dui quis scelerisque.&rdquo;</p>\n");
      out.write("                                                </blockquote>\n");
      out.write("\n");
      out.write("                                                <div class=\"author-info\">\n");
      out.write("                                                    <div class=\"author-pic\">\n");
      out.write("                                                        <img src=\"images/person-1.png\" alt=\"Maria Jones\" class=\"img-fluid\">\n");
      out.write("                                                    </div>\n");
      out.write("                                                    <h3 class=\"font-weight-bold\">Maria Jones</h3>\n");
      out.write("                                                    <span class=\"position d-block mb-3\">CEO, Co-Founder, XYZ Inc.</span>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div> \n");
      out.write("                                <!-- END item -->\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!-- End Testimonial Slider -->\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- Start Footer Section -->\n");
      out.write("      <footer class=\"footer-section\">\n");
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
      out.write("        <!-- End Footer Section -->\t\n");
      out.write("\n");
      out.write("\n");
      out.write("        <script src=\"js/bootstrap.bundle.min.js\"></script>\n");
      out.write("        <script src=\"js/tiny-slider.js\"></script>\n");
      out.write("        <script src=\"js/custom.js\"></script>\n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("</html>");
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
