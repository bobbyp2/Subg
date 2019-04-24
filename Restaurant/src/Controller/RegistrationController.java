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
 * Servlet implementation class RegistrationController
 */
@WebServlet("/RegistrationController")
public class RegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationController() {
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
		//doGet(request, response);
		String id=request.getParameter("uid");
		String uname=request.getParameter("uname");
		String pwd=request.getParameter("pwd");
		UserDaoImpl implObj=new UserDaoImpl();
		boolean count = implObj.getuserwhileregistration(uname);
		boolean check = implObj.checkUserId(id);
		if(check == false)
		{
		if(count==false)
		{
		User u=new User(id, uname, pwd);
		implObj.addUser(u);
		request.getSession().setAttribute("regname",uname);
		response.sendRedirect("index.jsp");	
		}
		else
		{
			request.getSession().setAttribute("myname",uname);
			response.sendRedirect("index.jsp");
		}
	}else
	{
		request.getSession().setAttribute("myid",id);
		response.sendRedirect("index.jsp");
	}
	}

}
