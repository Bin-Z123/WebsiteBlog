package model.Entity;
import java.util.Date;
import java.util.Objects;

import lombok.Data;
@Data
public class News {
	private Integer id;
	private String title;
	private String content;
	private String image;
	private Date postedDate;
	private int author;
	private int viewCount = 0;
	private int categoryId;
	private int status = 0;
	private boolean home = true;

	public News() {
		super();
	}

	public News(Integer id, String title, String content, String image, Date postedDate, int author,
			int viewCount, int categoryId, int status, boolean home) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.image = image;
		this.postedDate = postedDate;
		this.author = author;
		this.viewCount = viewCount;
		this.categoryId = categoryId;
		this.status = status;
		this.home = home;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Date getPostedDate() {
		return postedDate;
	}

	public void setPostedDate(Date postedDate) {
		this.postedDate = postedDate;
	}

	public int getAuthor() {
		return author;
	}

	public void setAuthor(int author) {
		this.author = author;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public boolean isHome() {
		return home;
	}

	public void setHome(boolean home) {
		this.home = home;
	}

	@Override
	public String toString() {
		return "News [id=" + id + ", title=" + title + ", content=" + content + ", image=" + image + ", postedDate="
				+ postedDate + ", author=" + author + ", viewCount=" + viewCount + ", categoryId=" + categoryId
				+ ", status=" + status + ", home=" + home + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(author, categoryId, content, home, id, image, postedDate, status, title, viewCount);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		News other = (News) obj;
		return author == other.author && categoryId == other.categoryId && Objects.equals(content, other.content)
				&& home == other.home && Objects.equals(id, other.id) && Objects.equals(image, other.image)
				&& Objects.equals(postedDate, other.postedDate) && status == other.status
				&& Objects.equals(title, other.title) && viewCount == other.viewCount;
	}

}
