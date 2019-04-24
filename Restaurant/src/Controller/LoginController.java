package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.UserDaoImpl;
import model.User;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String uname=request.getParameter("uname");
		String pwd=request.getParameter("pwd");
		UserDaoImpl implObj=new UserDaoImpl();
		User user=implObj.getUserByName(uname);
		if(user==null) {
			request.getSession().setAttribute("access", "Invalid Credentials");
			response.sendRedirect("index.jsp");
		}
		else {
		if(user.getUser_name().equals(uname))
		{
		if(user.getPassword().equals(pwd))
		{
		
			request.getSession().setAttribute("Current_User_Name", user.getUser_name().toUpperCase());
			response.sendRedirect("home.jsp");
		}else
		{
			request.getSession().setAttribute("access", "Invalid Credentials");
			response.sendRedirect("index.jsp");
			
		}
		}
		else
		{	
			request.getSession().setAttribute("access", "Invalid Credentials");
			response.sendRedirect("login.jsp");
			
		}
		
		}
		}

}
