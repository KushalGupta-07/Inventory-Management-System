import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/welcome")
public class welcome extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String sql = "INSERT INTO products (product_name, invoice_code, category, supplier, unit_price, stock_quantity, reorder_level, warehouser, description) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    String url = "jdbc:mysql://localhost:3306/USERS";
    String username = "root";
    String password = "kushalgupta@27";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productname = request.getParameter("productname");
		String invoicecode = request.getParameter("code");
		String category = request.getParameter("category");
		String supplier = request.getParameter("supplier");
		String unitprice = request.getParameter("unitprice");
		String stockquantity = request.getParameter("stockquantity");
		String reorderlevel = request.getParameter("reorderlevel");
		String warehouser = request.getParameter("warehouser");
		String desc = request.getParameter("desc");
		
		if(productname != null && invoicecode != null && category != null && supplier != null && unitprice != null && stockquantity != null && reorderlevel != null && warehouser != null) {
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            try (Connection con = DriverManager.getConnection(url, username, password);
	                 PreparedStatement st = con.prepareStatement(sql)) {
	                st.setString(1, productname);
	                st.setString(2, invoicecode);
	                st.setString(3, category);
	                st.setString(4, supplier);
	                st.setString(5, unitprice);
	                st.setString(6, stockquantity);
	                st.setString(7, reorderlevel);
	                st.setString(8, warehouser);
	                st.setString(9, desc);
	                
	                int count= st.executeUpdate();
	                if (count == 0) {
	                    System.out.println("Product not added");
	                } else {
	                    response.sendRedirect("welcome.jsp");
	                }
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		} else {
			response.sendRedirect("welcome.jsp");
		}
	}
}
