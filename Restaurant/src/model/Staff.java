package model;

public class Staff {
	private String first_name,last_name;
	private int age;
	private String gender,address;
	private String staff_id;
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getStaff_id() {
		return staff_id;
	}
	public void setStaff_id(String staff_id) {
		this.staff_id = staff_id;
	}
	public Staff(String first_name, String last_name, int age, String gender, String address,String staff_id) {
		super();
		this.first_name = first_name;
		this.last_name = last_name;
		this.age = age;
		this.gender = gender;
		this.address = address;
		this.staff_id = staff_id;
	}
	
	public Staff(String first_name, String last_name, int age, String gender, String address) {
		super();
		this.first_name = first_name;
		this.last_name = last_name;
		this.age = age;
		this.gender = gender;
		this.address = address;
	}
	public Staff() {
		// TODO Auto-generated constructor stub
	}
	
	
}
