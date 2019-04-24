package Dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.DB;
import model.Product;

public class ProductDAOImpl implements ProductDAO{

	public void addProduct(Product product) {
		try
		{
			Connection con = DB.getConnection();
			String query = "insert into manager values(?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, product.getInventory_Id());
			ps.setString(2, product.getInventory_Name());
			ps.setDate(3, (Date) product.getCreation_date());
			ps.setDate(4, (Date) product.getStart_date());
			ps.setDate(5, (Date) product.getEnd_date());
			ps.setInt(6, product.getTotal_Stock());
			ps.executeUpdate();
			System.out.println("rows inserted 1 ");
			con.close();
		}catch(Exception e)
		{
			System.out.println("error"+e);
		}
	}

	@Override
	public Product getUserById(int inventory_Id) {
		
		Product m = new Product();
try {
			
			Connection con = DB.getConnection();
			String sql ="select * from manager where inventory_id =?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, inventory_Id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			  m = new Product(rs.getInt(1), rs.getString(2),rs.getDate(3), rs.getDate(4),rs.getDate(5), rs.getInt(6));
			con.close();
			
		}catch(Exception e) {
			System.out.println("Error in getallManager() : "+ e);
		}
		return m;
	}

	@Override
	public List<Product> getAllProducts() {
		List<Product> managerList = new ArrayList<>();
		try {
			
			Connection con = DB.getConnection();
			String sql ="select * from manager ";
			Statement st = con.createStatement();
			ResultSet rs= st.executeQuery(sql);
			while(rs.next()) {
				Product product = new Product(rs.getInt(1), rs.getString(2),rs.getDate(3), rs.getDate(4),rs.getDate(5), rs.getInt(6));
				managerList.add(product);
			}
			
		}catch(Exception e) {
			System.out.println("Error in getallManager() : "+ e);
		}
		return  managerList;
	}

	@Override
	public void updateProduct(Product product) {
		 try {
				Connection con = DB.getConnection();
				String sql = "update manager set inventory_name =?, creation_date=?, start_date=?, end_date=?, total_stock = ? where inventory_id=?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, product.getInventory_Name());
				ps.setDate(2, (Date) product.getCreation_date());
				ps.setDate(3,(Date) product.getStart_date());
				ps.setDate(4,(Date) product.getEnd_date());
				ps.setInt(5, product.getTotal_Stock());
				ps.setInt(6, product.getInventory_Id());
				int rowaffected = 	ps.executeUpdate();
				System.out.println(rowaffected + " rows updated ");
				con.close();
				
				 }catch(Exception e){
					 System.out.println("Error: " + e);
					 }
	
	}

	@Override
	public void deleteproduct(int inventory_Id) {
		try{
			Connection con = DB.getConnection();
		String sql = "delete from manager where inventory_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, inventory_Id);
		int rowaffected = 	ps.executeUpdate();
		System.out.println(rowaffected + " rows Deleted ");
		con.close();
		 }catch(Exception e){
			 System.out.println("Error Manager Dao Adddetails method : " + e);
	}
}

	@Override
	public List<Product> searchProductByName(String inventory_Name) {
		List<Product> productList = new ArrayList<>();
		try {
			
			Connection con = DB.getConnection();
			String sql ="select * from manager where inventory_name like '%"+inventory_Name+"%'";
			PreparedStatement ps = con.prepareStatement(sql);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				productList.add( new Product(rs.getInt(1), rs.getString(2),rs.getDate(3), rs.getDate(4),rs.getDate(5), rs.getInt(6)));
				System.out.println(rs.getInt(1) + " = " + rs.getString(2));
			}
			con.close();
			System.out.println("DAO->searchProductByName() Executed successfully");
			
		} catch (Exception e) {
System.out.println("Error in listAllProducts() : "+ e);
		}

		return productList;
	}

}
