package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Profile_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"right-site-account\">\n");
      out.write("                    <div class=\"private-inf-account\">\n");
      out.write("                        <div class=\"header-inf\">\n");
      out.write("                            <p>ACCOUNT INFORMATION</p>\n");
      out.write("                        </div>\n");
      out.write("                        <form class=\"form-inf-account\">\n");
      out.write("                            <div class=\"icon-update\">\n");
      out.write("                                <a href=\"\"> <i class=\"fas fa-pen\" style=\"font-size:25px\"></i></a>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label for=\"exampleInputEmail1\">Email </label>\n");
      out.write("                                <input type=\"email\" class=\"form-control\" id=\"exampleInputEmail1\" aria-describedby=\"emailHelp\" value=\"\" readonly=\"\">\n");
      out.write("                                <small id=\"emailHelp\" class=\"form-text text-muted\">You never share your email with anyone else.</small>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label for=\"exampleInputPassword1\">Telephone number</label>\n");
      out.write("                                <input type=\"text\" class=\"form-control\" id=\"exampleInputPassword1\" value=\"0\" readonly=\"\">\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label for=\"exampleInputPassword1\">Full Name</label>\n");
      out.write("                                <input type=\"tel\" class=\"form-control\" id=\"exampleInputPassword1\" value=\"\" readonly=\"\">\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label for=\"exampleInputPassword1\">Password</label>\n");
      out.write("                                <input type=\"password\" class=\"form-control\" id=\"exampleInputPassword1\" value=\"\" readonly=\"\">\n");
      out.write("                            </div>\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                    <!-- Update account information form -->\n");
      out.write("<!--                    <form action=\"MainController\" method=\"post\">\n");
      out.write("                        <div class=\"private-inf-account\">\n");
      out.write("                            <div class=\"header-inf\">\n");
      out.write("                                <p>ACCOUNT UPDATE FORM</p>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-inf-account\">\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <div class=\"icon-update\">\n");
      out.write("                                        <a href=\"\"> <i class=\"fas fa-pen\" style=\"font-size:20px\"></i></a>\n");
      out.write("                                    </div>\n");
      out.write("                                    <label for=\"exampleInputEmail1\">Email address</label>\n");
      out.write("                                    <input type=\"email\" class=\"form-control\" id=\"exampleInputEmail1\" aria-describedby=\"emailHelp\" value=\"\" placeholder=\"Enter email\" name=\"email-update\" required=\"\" pattern=\".{1,40}@gmail\\.com\">\n");
      out.write("                                    <small id=\"emailHelp\" class=\"form-text text-muted\">You never share your email with anyone else.</small>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label for=\"exampleInputPassword1\">Telephone number</label>\n");
      out.write("                                    <input type=\"tel\" class=\"form-control\" id=\"exampleInputPassword1\" placeholder=\"Telephone\" value=\"\" name=\"phone-update\" required=\"\" pattern=\"[0-9]{10}\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label for=\"exampleInputPassword1\">Full Name</label>\n");
      out.write("                                    <input type=\"text\" class=\"form-control\" id=\"exampleInputPassword1\" placeholder=\"Name\" value=\"\" name=\"name-update\" required=\"\" pattern=\".{6,17}\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label for=\"exampleInputPassword1\">New Password</label>\n");
      out.write("                                    <input type=\"password\" class=\"form-control\" id=\"exampleInputPassword1\" value=\"\" name=\"password-update\" placeholder=\"*******\" required=\"\" pattern=\".{1,50}\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"form-group\">\n");
      out.write("                                    <label for=\"exampleInputPassword1\">Re-Password</label>\n");
      out.write("                                    <input type=\"password\" class=\"form-control\" id=\"exampleInputPassword1\" value=\"\" name=\"repass-update\" placeholder=\"*******\" required=\"\" pattern=\".{1,50}\">\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"btn-update-acc\">\n");
      out.write("                                    <a class=\"btn btn-danger btn-close\" href=\"homePage.jsp\"><p>Close</p></a>\n");
      out.write("                                    <input type=\"hidden\" name=\"accID\" value=\"\">\n");
      out.write("                                    <button class=\"btn btn-update btn-success\" value=\"Update_Account\" type=\"submit\" name=\"action\"><p>Update</p></button>\n");
      out.write("                                </div>\n");
      out.write("                                    <div style=\"color: red; font-size: 20px;\"></div>\n");
      out.write("                            </div>  \n");
      out.write("                        </div>\n");
      out.write("                    </form>-->\n");
      out.write("                </div>\n");
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
