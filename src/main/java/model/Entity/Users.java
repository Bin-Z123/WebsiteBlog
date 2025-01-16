package model.Entity;

import java.time.LocalDateTime;
import java.util.Objects;

public class Users {

	private Integer id;
	private String username;
	private String password;
	private String fullname;
	private LocalDateTime birthday;
	private boolean gender;
	private int phone;
	private String email;
	private boolean role = true;

	public Users() {
		super();
	}

	public Users(Integer id, String username, String password, String fullname, LocalDateTime birthday, boolean gender,
			int phone, String email, boolean role) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.birthday = birthday;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.role = role;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
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

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public LocalDateTime getBirthday() {
		return birthday;
	}

	public void setBirthday(LocalDateTime birthday) {
		this.birthday = birthday;
	}

	public boolean isGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isRole() {
		return role;
	}

	public void setRole(boolean role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "Users [id=" + id + ", username=" + username + ", password=" + password + ", fullname=" + fullname
				+ ", birthday=" + birthday + ", gender=" + gender + ", phone=" + phone + ", email=" + email + ", role="
				+ role + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(birthday, email, fullname, gender, id, password, phone, role, username);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Users other = (Users) obj;
		return Objects.equals(birthday, other.birthday) && Objects.equals(email, other.email)
				&& Objects.equals(fullname, other.fullname) && gender == other.gender && Objects.equals(id, other.id)
				&& Objects.equals(password, other.password) && phone == other.phone && role == other.role
				&& Objects.equals(username, other.username);
	}

}

