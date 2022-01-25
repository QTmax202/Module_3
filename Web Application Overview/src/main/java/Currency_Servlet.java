import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Currency_Servlet", value = "/Currency_Servlet")
public class Currency_Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float rate = Float.parseFloat(request.getParameter("rate"));
        float usd = Float.parseFloat(request.getParameter("usd"));

        float vnd = rate * usd;

        PrintWriter write = response.getWriter();
        write.write("<html>");
        write.write("<h1> Rate: "+rate+"</h1>");
        write.write("<h1> USD: "+usd+"</h1>");
        write.write("<h1> VND: "+vnd+"</h1>");
        write.write("</html>");
    }
}
