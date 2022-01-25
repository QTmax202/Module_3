import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountServlet", value = "/DiscountServlet")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        float price = Float.parseFloat(request.getParameter("price"));
        float percent = Float.parseFloat(request.getParameter("percent"));

        float discountAmount = (float) (price * percent * 0.01);
        float discountPrice =(float) ( price + discountAmount);

        PrintWriter write = response.getWriter();
        write.write("<html>");
        write.write("<h1> Product Name: "+name+"</h1>");
        write.write("<h1> Discount Amount: "+discountAmount+"</h1>");
        write.write("<h1> Discount Price: "+discountPrice+"</h1>");
        write.write("</html>");
    }
}
