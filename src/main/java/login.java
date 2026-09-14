import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.logindao.LoginDao;


@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("email");
		String pass=request.getParameter("pass");
		
		PrintWriter out=response.getWriter();
		
		LoginDao Dao =new LoginDao();
		
		if(Dao.check(name,pass)) {
			response.sendRedirect("welcome.jsp");
			HttpSession session=request.getSession();
			session.setAttribute("username",name);

		}
		else {
			response.sendRedirect("login.jsp");
			out.print("invalid");
		}
	}


}
