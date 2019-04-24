package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ProductDAO;
import Dao.ProductDAOImpl;
import model.Product;

/**
 * Servlet implementation class SearchProductController
 */
@WebServlet("/SearchProductController")
public class SearchProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		
		String pname = request.getParameter("pname");
		
		//for dynamic search;
		String product_name =request.getParameter("q");
		
		System.out.println(pname );
		System.out.println(product_name);
		if(product_name != null) {
			ProductDAO dao = new ProductDAOImpl();
			List<Product> productList = new ArrayList<Product>();
			productList = dao.searchProductByName(product_name);
			
			if(productList.isEmpty()) {
				out.println(" No Product Found :( ");
			}
			out.println("<html><head></head><body><table width = '100%'> ");
			for( Product temp : productList) {
			out.println("<tr width='100%'><td>"+temp.getInventory_Id()+ "</td> <td> "+temp.getInventory_Name()+"</td> <td>"+temp.getCreation_date()+"</td><td>"+temp.getStart_date()+
					"</td><td>"+temp.getEnd_date()+"</td><td>"+temp.getTotal_Stock()+"</td> <td><a href='EditProductController?id="
					+temp.getInventory_Id()+"'class=\"btn btn-info\" ><span class='glyphicon glyphicon-edit'></span> EDIT</a></td><td><a href='EditProductController?id="
					+temp.getInventory_Id()+"' class=\"btn btn-danger\" ><span class=\"glyphicon glyphicon-trash\"></span> DELETE</a></td> </tr>");
			System.out.println(temp.getInventory_Id()+" "+temp.getTotal_Stock());
			}
			out.println("</table> </body></html>");
			pname=null;
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
