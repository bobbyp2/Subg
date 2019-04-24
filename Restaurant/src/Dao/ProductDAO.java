package Dao;
import java.util.*;
import model.Product;
public interface ProductDAO {
	public void addProduct(Product product);
	public Product getUserById(int inventory_Id);
	public List<Product> getAllProducts();
	public void updateProduct(Product product);
	public void deleteproduct(int inventory_Id);
	public List<Product> searchProductByName(String pname);
}

