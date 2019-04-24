package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.DB;
import model.Staff;
import model.User;

public class StaffDaoImpl implements StaffDao {

	@Override
	public int addStaff(Staff staff) {
		// TODO Auto-generated method stub
		int count = 0;
		try {
			Connection con = DB.getConnection();
			PreparedStatement ps = con.prepareStatement("insert into staff values(?,?,?,?,?,?)");
			ps.setString(1, staff.getFirst_name());
			ps.setString(2, staff.getLast_name());
			ps.setInt(3, staff.getAge());
			ps.setString(4, staff.getGender());
			ps.setString(5, staff.getAddress());
			ps.setString(6, "STAFF" + generateStaffId());
			count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return count;
		}
	}

	public int generateStaffId() {
		try {
			Connection con = DB.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from staff order by staff_id");
			ResultSet rs = ps.executeQuery();
			rs.last();
			System.out.println(" last row " + rs.getString(1) + " his/her staff id is : " + rs.getString(6));
			String sid = rs.getString(6);
			int newid = Integer.parseInt(sid.substring(5));
			System.out.println("New proposed id :  " + (++newid));
			return newid;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Error " + e);
		}

		return 0;
	}

	@Override
	public List<Staff> getAllStaff() {
		List<Staff> staffList = new ArrayList<>();
		try {

			Connection con = DB.getConnection();
			String sql = "select * from staff";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				Staff staff = new Staff(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4),
						rs.getString(5), rs.getString(6));
				staffList.add(staff);
			}

		} catch (Exception e) {
			System.out.println("Error in getallStaff() : " + e);
		}
		return staffList;
	}

	@Override
	public void updateStaff(Staff staff) {
		System.out.println("testing testing"+staff.getStaff_id());
		try
		{
			Connection con = DB.getConnection();
			String qry = "update Staff set first_name=?,last_name =?,age =?,gender =?,address =? where Staff_id=?";
			PreparedStatement ps = con.prepareStatement(qry);
			System.out.println(ps);
			ps.setString(1, staff.getFirst_name());
			ps.setString(2, staff.getLast_name());
			ps.setInt(3, staff.getAge());
			ps.setString(4, staff.getGender());
			ps.setString(5, staff.getAddress());
			ps.setString(6, staff.getStaff_id());
			int rowupdated = ps.executeUpdate();
			System.out.println(rowupdated);
			con.close();
		}catch(Exception ex) {
			System.out.println("Error : "+ex);
			
		}
		
	}

	@Override
	public void deleteStaff(String staff_id) {
		try {
			System.out.println("DAO->deleteStaff() Tryinrg to delete Staff with id " + staff_id.trim());
			Connection con = DB.getConnection();
			String sql = "delete from Staff where Staff_id=?";
			System.out.println(sql);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, staff_id);
			System.out.println(ps.toString());
			int rowaffected = ps.executeUpdate();
			System.out.println(rowaffected + " rows Deleted ");
			con.close();
		} catch (Exception e) {
			System.out.println("Error Staff Dao DisplayStaff method : " + e);
		}

	}
	@Override
	public Staff getStaffByName(String first_name) {
		try
		{
			Connection con=DB.getConnection();
			PreparedStatement ps=con.prepareStatement("select * from staff where first_name=?");
			ps.setString(1, first_name);
			ResultSet rs=ps.executeQuery();
			rs.next();
			Staff staff=new Staff(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getString(5));
			con.close();
			return staff;
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error at getUserByName Method : "+e );
		}
		
		return null;
	}

	@Override
	public Staff getStaffById(String staff_id) {
		try
		{
			Connection con=DB.getConnection();
			PreparedStatement ps=con.prepareStatement("select * from staff where staff_id=?");
			ps.setString(1, staff_id);
			ResultSet rs=ps.executeQuery();
			rs.next();
			Staff staff=new Staff(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6));
			con.close();
			return staff;
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error at getUserByName Method : "+e );
		}
		
		return null;
	}
}
