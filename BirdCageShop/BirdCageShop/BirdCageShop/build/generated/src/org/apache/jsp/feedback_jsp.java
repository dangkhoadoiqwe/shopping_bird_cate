package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class feedback_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("          <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link rel='stylesheet prefetch' href='https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css'>\n");
      out.write("        <link href=\"css/feedback.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-6 col-md-6\"> <img src=\"images/product-1.png\" class=\"img-fluid product-thumbnail\"></div>\n");
      out.write("            <div class=\"col-6 col-md-6\">\n");
      out.write("            <div class=\"product-content\">\n");
      out.write("                <h2 class=\"product-title\">OD45345345435</h2>\n");
      out.write("                <div class=\"product-rating\">\n");
      out.write("                    <i class=\"fas fa-star\"></i>\n");
      out.write("                    <i class=\"fas fa-star\"></i>\n");
      out.write("                    <i class=\"fas fa-star\"></i>\n");
      out.write("                    <i class=\"fas fa-star\"></i>\n");
      out.write("                    <i class=\"fas fa-star-half-alt\"></i>\n");
      out.write("                   \n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"product-price\">\n");
      out.write("                       <p class=\"new-price\">Lồng chào mào <span>khung gỗ</span></p>\n");
      out.write("                     <p class=\"new-price\">Số lương: <span>1</span></p>\n");
      out.write("                    <p class=\"new-price\">Giá: <span>$249.00 (5%)</span></p>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"product-detail\">\n");
      out.write("                   \n");
      out.write("                    <p>ngày mua : 20/8/2023</p>\n");
      out.write("                     <p>ngày giao : 15/9/2023</p>\n");
      out.write("                    <ul>\n");
      out.write("                        <li>Màu: <span>nâu</span></li>\n");
      out.write("                        <li>chất liệu <span>gỗ</span></li>\n");
      out.write("                        <li>loại <span>Chào mào</span></li>\n");
      out.write("                        <li>hình dáng <span>tròn</span></li>\n");
      out.write("                        \n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                <div class=\"stars\">\n");
      out.write("                    <form action=\"\">\n");
      out.write("                        <input class=\"star star-5\" id=\"star-5\" type=\"radio\" name=\"star\"/>\n");
      out.write("                        <label class=\"star star-5\" for=\"star-5\"></label>\n");
      out.write("                        <input class=\"star star-4\" id=\"star-4\" type=\"radio\" name=\"star\"/>\n");
      out.write("                        <label class=\"star star-4\" for=\"star-4\"></label>\n");
      out.write("                        <input class=\"star star-3\" id=\"star-3\" type=\"radio\" name=\"star\"/>\n");
      out.write("                        <label class=\"star star-3\" for=\"star-3\"></label>\n");
      out.write("                        <input class=\"star star-2\" id=\"star-2\" type=\"radio\" name=\"star\"/>\n");
      out.write("                        <label class=\"star star-2\" for=\"star-2\"></label>\n");
      out.write("                        <input class=\"star star-1\" id=\"star-1\" type=\"radio\" name=\"star\"/>\n");
      out.write("                        <label class=\"star star-1\" for=\"star-1\"></label>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("                <section id=\"feedback\">\n");
      out.write("                    <h2>Đánh giá và phản hồi</h2>\n");
      out.write("                    <form id=\"feedback-form\">\n");
      out.write("                        <label for=\"comment\">Phản hồi:</label>\n");
      out.write("                        <textarea id=\"comment\" name=\"comment\" rows=\"4\" cols=\"50\" required></textarea>\n");
      out.write("                        <button type=\"submit\">Gửi</button>\n");
      out.write("                    </form>\n");
      out.write("                </section>\n");
      out.write("                 \n");
      out.write("            </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
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
