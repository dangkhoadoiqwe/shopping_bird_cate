package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class chinhsachdoitra_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <link href=\"scss/style.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"css/Csschinhsach.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <!-- Start Header/Navigation -->\n");
      out.write("        <nav class=\"custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark\" arial-label=\"Furni navigation bar\">\n");
      out.write("\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <a class=\"navbar-brand\" href=\"index.html\">Furni<span>.</span></a>\n");
      out.write("\n");
      out.write("                <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#navbarsFurni\" aria-controls=\"navbarsFurni\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("                    <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("                </button>\n");
      out.write("\n");
      out.write("                <div class=\"collapse navbar-collapse\" id=\"navbarsFurni\">\n");
      out.write("                    <ul class=\"custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0\">\n");
      out.write("                        <li class=\"nav-item active\">\n");
      out.write("                            <a class=\"nav-link\" href=\"index.html\">Trang chủ</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li><a class=\"nav-link\" href=\"shop.html\">Cửa hàng</a></li>\n");
      out.write("                        <li><a class=\"nav-link\" href=\"blog.html\">Blog</a></li>\n");
      out.write("                        <li><a class=\"nav-link\" href=\"contact.html\">Liên hệ</a></li>\n");
      out.write("                    </ul>\n");
      out.write("\n");
      out.write("                    <ul class=\"custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5\">\n");
      out.write("                        <li><a class=\"nav-link\" href=\"#\"><img src=\"images/user.svg\"></a></li>\n");
      out.write("                        <li><a class=\"nav-link\" href=\"cart.html\"><img src=\"images/cart.svg\"></a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </nav>\n");
      out.write("        <!-- End Header/Navigation -->\n");
      out.write("\n");
      out.write("        <!-- Start Hero Section -->\n");
      out.write("        <div id=\"banner\">\n");
      out.write("            <div class=\"box-left\">\n");
      out.write("                <h2>\n");
      out.write("\n");
      out.write("\n");
      out.write("                    <span>FURNI</span>\n");
      out.write("                    <br>\n");
      out.write("                    <span  style=\"font-size: 16px;\">Không gian độc đáo cho những đôi cánh - Lồng chim, đẳng cấp dân chơi!</span>\n");
      out.write("\n");
      out.write("                </h2>\n");
      out.write("\n");
      out.write("                <p>Chuyên cung cấp các loại lồng chim cho từng loại chim của khách hàng giúp cho chim của khách hàng có 1 không gian thoải mái nhất</p>\n");
      out.write("\n");
      out.write("                <button>Mua ngay</button>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"to-bottom\">\n");
      out.write("                <a href=\"\">\n");
      out.write("                    <img src=\"assets/to_bottom.png\" alt=\"\">\n");
      out.write("                </a>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!-- End Hero Section -->\n");
      out.write("        \n");
      out.write("                    <div class=\"ace\">\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                        <h1 style=\"text-align: center;\"><strong>Chính Sách Đổi Trả</strong></h1>\n");
      out.write("                        <p><span style=\"font-weight: 400;\">funi sẽ thực hiện việc đổi/trả hàng và hoàn tiền cho khách hàng trong những trường hợp sau.</span></p>\n");
      out.write("                        <h2><b>1. Sản phẩm  giao không đúng đơn đặt hàng</b></h2>\n");
      out.write("                        <p><span style=\"font-weight: 400;\">Bạn nghĩ rằng sản phẩm giao cho bạn không đúng với đơn đặt hàng? Hãy liên hệ với chúng tôi càng sớm càng tốt, hệ thống của chúng tôi sẽ kiểm tra nếu hàng của bạn bị gửi nhầm. Trong trường hợp đó, chúng tôi sẽ thay thế đúng mặt hàng bạn yêu cầu (khi có hàng).</span></p>\n");
      out.write("                        <h2><b>2. Sản phẩm mua rồi nhưng không ưng ý</b></h2>\n");
      out.write("                        <p><span style=\"font-weight: 400;\">Người mua có thể trả hàng khi không vừa ý trong vòng 3 ngày kể từ ngày nhận hàng, chúng tôi</span> <span style=\"font-weight: 400;\">sẽ đổi sản phẩm cho khách.</span></p>\n");
      out.write("                        <p><span style=\"font-weight: 400;\">Tiền vận chuyển lắp đặt quý khách phải tự trả. </span></p>\n");
      out.write("                        <h2><strong>3. Sản phẩm mua bị lỗi</strong></h2>\n");
      out.write("                        <p><span style=\"font-weight: 400;\">Quý khách vui lòng kiểm tra sản phẩm trước khi thanh toán. Trong trường hợp sản phẩm bị hư hại trong quá trình vận chuyển, quý khách vui lòng từ chối và gửi lại sản phẩm cho chúng tôi</span></p>\n");
      out.write("                        <p><span style=\"font-weight: 400;\">Trong thời hạn bảo hành sản phẩm hư hỏng nhiều lần quý khách được đổi hoặc trả máy khách miễn phí với sản phẩm đồng giá hoặc bù thêm tiền khi đổi sản phẩm có giá trị cao hơn .</span></p>\n");
      out.write("                        <h2><span style=\"color: #d83131;\"><b>4. Điều kiện đổi trả hàng</b></span></h2>\n");
      out.write("                        <p><i><span style=\"font-weight: 400;\">Điều kiện về thời gian đổi trả</span></i><span style=\"font-weight: 400;\">: trong vòng 3 ngày kể từ khi nhận được hàng.</span></p>\n");
      out.write("                        <p><i><span style=\"font-weight: 400;\">Điều kiện về sản phẩm</span></i><span style=\"font-weight: 400;\">:</span></p>\n");
      out.write("                        <p><span style=\"font-weight: 400;\">– Hàng hóa còn đầy đủ các bộ phận, không có dấu hiệu sử dụng quá nhiều hoặc hỏng hóc.</span></p>\n");
      out.write("                        <p><span style=\"font-weight: 400;\">– Có đầy đủ các giấy tờ kèm theo (hóa đơn mua hàng hoặc phiếu bảo hành .) và các linh kiện, tặng phẩm kèm theo (nếu có).</span></p>\n");
      out.write("                        <p><span style=\"font-weight: 400;\">– Khách hàng chịu chi phí vận chuyển cho việc đổi, trả hàng.</span></p>\n");
      out.write("                        <p><span style=\"font-weight: 400;\">– Trường hợp không đủ các điều kiện trên thì quyền quyết định đổi, trả hàng thuộc về funi</span></p>\n");
      out.write("\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("       \n");
      out.write("    </body>\n");
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
