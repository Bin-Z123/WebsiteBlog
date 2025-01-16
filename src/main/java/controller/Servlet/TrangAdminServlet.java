package controller.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.DAO.CategoriesDAO;
import model.DAO.NewsDAO;
import model.DAO.UsersDAO;
import model.Entity.Categories;
import model.Entity.News;
import model.Entity.Users;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * Servlet implementation class TrangAdminServlet
 */
@MultipartConfig()
@WebServlet({ 
	"/TrangAdminServlet/tintuc",
	"/TrangAdminServlet/delete",
	"/TrangAdminServlet/update",
	"/TrangAdminServlet/insert",
	"/TrangAdminServlet/nguoidung",
	"/TrangAdminServlet/danhmuc"
	})
public class TrangAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String uri = request.getRequestURI();
		// News
		News news = new News();
		NewsDAO newsDAO = new NewsDAO();
		// Category
		Categories cate = new Categories();
		CategoriesDAO cateDAO = new CategoriesDAO();
		// Users
		Users users = new Users();
		UsersDAO uDAO = new UsersDAO();

		try {
			// Fill loại tin lên combobox
			List<Categories> listCate = cateDAO.getAll();
			request.setAttribute("listCate", listCate);
			
			// Fill nguoi dang len combobox
			List<Users> listUser = uDAO.getAll();
			session.setAttribute("listUser", listUser);
			
			// count
			int countNews = newsDAO.getCountNews();
			request.setAttribute("count", countNews);
			// count van hoa
			int countVanHoa = newsDAO.getCountCategory(1);
			request.setAttribute("countVanHoa", countVanHoa);
			// count phap luat
			int countPhapLuat = newsDAO.getCountCategory(2);
			request.setAttribute("countPhapLuat", countPhapLuat);
			// count the thao
			int countTheThao = newsDAO.getCountCategory(3);
			request.setAttribute("countTheThao", countTheThao);
			
			
			int sid = (int) session.getAttribute("idtable");
			users = uDAO.getById(sid);
			
			//Tin Tuc
			if(uri.contains("tintuc")) {
				//admin
				request.setAttribute("tin", "Danh Sách Tin");
				if (users.isRole()) {
					// fill du lieu len bang va form
					List<Object[]> data = newsDAO.getNewsTable();
					request.setAttribute("data", data);
				}else{
					int id = (int) session.getAttribute("idtable");
					List<Object[]> list = newsDAO.getTableByUser(id);
					request.setAttribute("data", list);
				}
			}
			
			// Nguoi Dung
			if(uri.contains("nguoidung")) {
				request.setAttribute("tin", "Danh Sách Người Dùng");
				List<Users> list = uDAO.getAll();
				request.setAttribute("listAllUser", list);
			}
			
			//Loai Tin
			if(uri.contains("danhmuc")) {
				request.setAttribute("tin", "Danh Sách Danh Mục");
				List<Categories> list = cateDAO.getAll();
				request.setAttribute("listAllCate", list);
			}
			
			
			
			request.getRequestDispatcher("/views/index-admin.jsp").forward(request, response);
			session.removeAttribute("toastMessage");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		NewsDAO newsDAO = new NewsDAO();
		Users users = new Users();
		UsersDAO uDAO = new UsersDAO();
		HttpSession session = request.getSession();

		try {
			// Xoa
			if (uri.contains("delete")) {
				String delete = request.getParameter("iddel");
				int id = Integer.parseInt(delete);
				newsDAO.delete(id);
				session.setAttribute("toastMessage", "Xóa Tin Thành Công! <br> ID: "+id);
			}
			// Update
			if (uri.contains("update")) {
				if(validateForm(request, response)) {
					News news = new News();
					String id = request.getParameter("idup");
					String title = request.getParameter("title");
					String category = request.getParameter("category");
					String content = request.getParameter("content");
	//				String view = request.getParameter("view");
					String home = request.getParameter("home");
					news = newsDAO.getById(Integer.parseInt(id));
					// Lay hinh anh
					String photo = request.getParameter("imgSrc");
					System.out.println("PHOTO: "+photo);
					Part part = request.getPart("photo");
					String imgName = part.getSubmittedFileName();
					String path = request.getServletContext().getRealPath("images");
					File dir = new File(path);
					if (!dir.exists()) {
						dir.mkdir();
					}
					//Kiem tra hinh anh co chua
					if (imgName != "") {
						part.write(path + "/" + part.getSubmittedFileName());
						news.setImage(imgName);
					}
					request.setAttribute("imagename", part.getSubmittedFileName());
	
					
					// set form
					news.setId(Integer.parseInt(id));
					news.setTitle(title);
					news.setCategoryId(Integer.parseInt(category));
					news.setContent(content);
	//				news.setViewCount(Integer.parseInt(view));
					System.out.println("HOME: "+home);
					news.setHome(Boolean.parseBoolean(home));
					// cap nhat du lieu
					newsDAO.update(news);
					
					session.setAttribute("toastMessage", "Cập Nhật Tin Thành Công! <br> ID: "+id);
				}else {
					session.setAttribute("toastMessage", "Cập Nhật Tin Thất Bại!");
				}
			}
			// INssert
			if (uri.contains("insert")) {
				if(validateForm(request, response)) {
					News news = new News();
					Date date = new Date();
					// Lay du lieu tu form
					String title = request.getParameter("title");
					String category = request.getParameter("category");
					int author = (int) session.getAttribute("idtable");
					String content = request.getParameter("content");
					String view = request.getParameter("views");
					// Lay anh
					Part part = request.getPart("photo");
					String path = request.getServletContext().getRealPath("images");
					File dir = new File(path);
					if (!dir.exists()) {
						dir.mkdir();
					}
					part.write(path + "/" + part.getSubmittedFileName());
					request.setAttribute("imageName", part.getSubmittedFileName());
					String imgName = part.getSubmittedFileName();
					// Xuat ra console
					System.out.println("-----------INSERT--------------");
					System.out.println("Title: " + title + "\n, Category: " + category + "\n" + ", Author: " + author
							+ "\n, Content: " + content + "\nDate: " + date + "\n, Img: " + imgName);
					System.out.println("-----------INSERT--------------");
					// getform
					news.setTitle(title);
					news.setViewCount(Integer.parseInt(view));
					news.setCategoryId(Integer.parseInt(category));
					news.setAuthor(author);
					news.setContent(content);
					news.setImage(imgName);
					news.setPostedDate(new Date());
					// Thuc hien insert
					newsDAO.add(news);
					session.setAttribute("toastMessage", "Thêm Tin Mới Thành Công! <br> ID: "+news.getId());
				}else {
					session.setAttribute("toastMessage", "Thêm Tin Mới Thất Bại!");
				}
			}
			//sau khi update se chuyen huong
			int idup = (int) session.getAttribute("idtable");//lay id cua user khi dang nhap
			try {
				users = uDAO.getById(idup);
				if(users.isRole()) {//admin
					request.getRequestDispatcher("/views/chuyenhuong.jsp").forward(request, response);
				}else if(!users.isRole()){//phong vien
					request.getRequestDispatcher("/views/chuyenhuong-pv.jsp").forward(request, response);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	private boolean validateForm(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		try {
			if(title.trim().isEmpty()) {
				request.setAttribute("errorTitle", "Vui lòng không để trống tiêu đề tin!");
				return false;
			}
			if(content.trim().isEmpty()) {
				request.setAttribute("errorContent", "Vui lòng không để trống nội dung tin!");
				return false;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}

}
