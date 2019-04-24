package Dao;

import java.util.List;

import model.Staff;

public interface StaffDao {
		public int addStaff(Staff staff);
		public Staff getStaffByName(String first_name);
		public List<Staff> getAllStaff();
		public void updateStaff(Staff staff);
		public void deleteStaff(String staff_id);
		public Staff getStaffById(String staff_id);
}
