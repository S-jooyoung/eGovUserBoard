package egovframework.example.main.dto;

public class Board {

	private int _id;
	private String name;
	private String belongString;
	private String phone;
	
	public int get_id() {
		return _id;
	}
	public void set_id(int _id) {
		this._id = _id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBelongString() {
		return belongString;
	}
	public void setBelongString(String belongString) {
		this.belongString = belongString;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
