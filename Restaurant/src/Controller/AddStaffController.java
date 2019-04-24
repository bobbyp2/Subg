package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.StaffDaoImpl;
import model.Staff;

/**
 * Servlet implementation class AddStaffController
 */
@WebServlet("/AddStaffController")
public class AddStaffController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStaffController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		int age=Integer.parseInt(request.getParameter("age"));
		String gender=request.getParameter("gender");
		String address=request.getParameter("address");
		
		Staff staff=new Staff(fname,lname,age,gender,address);
		StaffDaoImpl implObj=new StaffDaoImpl();
		int flag=implObj.addStaff(staff);
		PrintWriter out=response.getWriter();
		if(flag!=0)
		{
			
			request.getAttribute("myname");
			request.getRequestDispatcher("displayStaff.jsp").forward(request, response);
			out.print("Successfully Added");
		}
		else
		{
			out.print("Error");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
