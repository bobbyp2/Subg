package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.StaffDaoImpl;
import Dao.UserDaoImpl;
import model.User;

/**
 * Servlet implementation class PasswordController
 */
@WebServlet("/PasswordController")
public class PasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordController() {
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
		doGet(request, response);
		String userid=request.getParameter("userid");
		String cpwd=request.getParameter("cpwd");
		String npwd=request.getParameter("npwd");
		UserDaoImpl implObj=new UserDaoImpl();
		User user=implObj.getUserById(userid);
		System.out.println(user);
		
		if(user.getPassword().equals(cpwd))
		{
			implObj.passwordChange(userid,npwd);
			System.out.println("Trying to change password for "+ userid + " with new password : " + cpwd);
			PrintWriter out=response.getWriter();
			out.println("Password Changed Successfully");
			response.sendRedirect("login.jsp");
		}
		
		
		
		
	}

}
