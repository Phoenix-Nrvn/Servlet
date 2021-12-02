package userInfo;

import java.io.Serializable;

public class User implements Serializable {
	private String choice;
	private String id;
	private String username;
	private String password;
	private String name;
	private String tel;
	private String email;
	private String apart;
	private String usertype;
	
	public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	
	public String getChoice() {
		return choice;
	}
	
	public void setChoice(String choice) {
		this.choice = choice;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getApart() {
		return apart;
	}

	public void setApart(String apart) {
		this.apart = apart;
	}
}
