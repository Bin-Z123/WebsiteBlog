package model.Entity;

import java.util.Objects;

public class NewsLetters {

	private String email;
	private boolean status;

	public NewsLetters() {
		super();
	}

	public NewsLetters(String email, boolean status) {
		this.email = email;
		this.status = status;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@Override
	public int hashCode() {
		return Objects.hash(email, status);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		NewsLetters other = (NewsLetters) obj;
		return Objects.equals(email, other.email) && status == other.status;
	}

	@Override
	public String toString() {
		return "NewsLetters [email=" + email + ", status=" + status + "]";
	}

}

