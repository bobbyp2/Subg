package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Dao.StaffDaoImpl;

@WebServlet("/DeleteStaffController")
public class DeleteStaffController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteStaffController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String Staff_id = request.getParameter("s1");
//		PrintWriter out = response.getWriter();
//		out.print("You have selected " + Staff_id);
		new StaffDaoImpl().deleteStaff(Staff_id);
		response.sendRedirect("displayStaff.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
