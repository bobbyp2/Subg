package Controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ProductDAOImpl;
import model.Product;

/**
 * Servlet implementation class EditManagerController
 */
@WebServlet("/EditProductController")
public class EditProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt( request.getParameter("id") );
		
		Product m = new Product();
		ProductDAOImpl dao = new ProductDAOImpl();
		m = dao.getUserById(id);
		request.setAttribute("key1", m);
		request.getRequestDispatcher("editdetails.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		//
		int inventoryid = Integer.parseInt( request.getParameter("inventoryid") );
		
		String inventoryname = request.getParameter("inventoryname");
		String creationdate =  request.getParameter("creationdate");
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		try {
			date = sdf1.parse(creationdate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		java.sql.Date creationdate1 = new java.sql.Date(date.getTime());  
		String startdate = request.getParameter("startdate");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			 date = sdf.parse(startdate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		java.sql.Date startdate1 = new java.sql.Date(date.getTime());  
		
		String enddate = request.getParameter("enddate");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
		try {
			date = sdf2.parse(enddate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		java.sql.Date enddate1 = new java.sql.Date(date.getTime());
		int totalstock = Integer.parseInt(request.getParameter("totalstock"));
		Product product = new Product(inventoryid, inventoryname, creationdate1, startdate1, enddate1, totalstock);
		ProductDAOImpl dao = new ProductDAOImpl();
		dao.updateProduct(product);
		response.sendRedirect("display.jsp");
		
	}

}
