package model;

import java.util.Date;

public class Product {
	private int inventory_Id;
	private String inventory_Name;
	private Date creation_date;
	private Date Start_date;
	private Date end_date;
	private int total_Stock;
	public Product(int inventory_Id, String inventory_Name, Date creation_date, Date start_date, Date end_date,
			int total_Stock) {
		super();
		this.inventory_Id = inventory_Id;
		this.inventory_Name = inventory_Name;
		this.creation_date = creation_date;
		Start_date = start_date;
		this.end_date = end_date;
		this.total_Stock = total_Stock;
	}
	public Product() {
		super();
	}
	public int getInventory_Id() {
		return inventory_Id;
	}
	public void setInventory_Id(int inventory_Id) {
		this.inventory_Id = inventory_Id;
	}
	public String getInventory_Name() {
		return inventory_Name;
	}
	public void setInventory_Name(String inventory_Name) {
		this.inventory_Name = inventory_Name;
	}
	public Date getCreation_date() {
		return creation_date;
	}
	public void setCreation_date(Date creation_date) {
		this.creation_date = creation_date;
	}
	public Date getStart_date() {
		return Start_date;
	}
	public void setStart_date(Date start_date) {
		Start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public int getTotal_Stock() {
		return total_Stock;
	}
	public void setTotal_Stock(int total_Stock) {
		this.total_Stock = total_Stock;
	}
}
