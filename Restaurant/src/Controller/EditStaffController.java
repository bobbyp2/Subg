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
 * Servlet implementation class EditStaffController
 */
@WebServlet("/EditStaffController")
public class EditStaffController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditStaffController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String staff_id = request.getParameter("id");
		System.out.println(staff_id);
		Staff staff = new Staff();
		
		StaffDaoImpl dao = new StaffDaoImpl();
		staff = dao.getStaffById(staff_id);
		request.setAttribute("key2", staff);
		request.getRequestDispatcher("editStaff.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		int age=Integer.parseInt(request.getParameter("age"));
		String gender=request.getParameter("gender");
		String address=request.getParameter("address");
		String staff_id = request.getParameter("staffid");
		Staff staff=new Staff(fname,lname,age,gender,address,staff_id);
		System.out.println("controller "+staff.getStaff_id());
		StaffDaoImpl implObj=new StaffDaoImpl();
		implObj.updateStaff(staff);
		PrintWriter out=response.getWriter();		
			response.sendRedirect("displayStaff.jsp");
			out.print("Successfully Added");
	}

}

