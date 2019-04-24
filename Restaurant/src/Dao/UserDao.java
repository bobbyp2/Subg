package Dao;
import java.util.List;
import model.*;

public interface UserDao {
		public void addUser(User user);
		public User getUserById(String user_id);
		public List<User> getAllUsers();
		public boolean checkUserId(String userid);
		public void deleteUser(String user_id);
		public User getUserByName(String uname);
		public boolean getuserwhileregistration(String uname);
		void passwordChange(String user_id, String password);
		
}
