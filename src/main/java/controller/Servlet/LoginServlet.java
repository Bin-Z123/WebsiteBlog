package controller.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.DAO.UsersDAO;
import model.Entity.Users;

import java.io.IOException;
import java.util.Base64;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet({"/admin/login","/admin/logout"})
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		//xoa session sau khi log out
		if(uri.endsWith("logout")) {
			 Cookie cookie = new Cookie("user", null);
        	 cookie.setMaxAge(0);
        	 cookie.setPath("/");
        	 response.addCookie(cookie);
        	 session.invalidate();
        	 request.getRequestDispatcher("/views/login-admin.jsp").forward(request, response);
        	 return;
		}
		//tim cookie
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("user")) {
					String encoded = cookie.getValue();
					byte[] bytes = Base64.getDecoder().decode(encoded);
					String[] userinfo = new String(bytes).split(",");
					
					request.setAttribute("username", userinfo[0]);
					request.setAttribute("password", userinfo[1]);
					
					String username = request.getParameter("username");
					String password = request.getParameter("password");
					Users users = new Users();
					UsersDAO usersDAO = new UsersDAO();
					try {
						users = usersDAO.getUserAndPassword(userinfo[0], userinfo[1]);
						session.setAttribute("users", users);
						if(users.isRole()) {
							session.setAttribute("wellcome","ADMIN: "+ users.getFullname());
							session.setAttribute("idtable", users.getId());
							session.setAttribute("fullname", users.getFullname());
							session.setAttribute("selectUser", users.getFullname());
							request.getRequestDispatcher("/views/chuyenhuong.jsp").forward(request, response);
							return;
						}else if(!users.isRole()){
							session.setAttribute("wellcome","PHÓNG VIÊN: "+ users.getFullname());
							session.setAttribute("idtable", users.getId());
							session.setAttribute("fullname", users.getFullname());
							session.setAttribute("selectUser", users.getFullname());
							request.getRequestDispatcher("/views/chuyenhuong-pv.jsp").forward(request, response);
							return;
						}
					} catch (Exception e) {
						 e.printStackTrace();
					}
				}
			}
		}
		request.getRequestDispatcher("/views/login-admin.jsp").forward(request, response);
   	 	return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember-me");
		request.setAttribute("username", username);
		request.setAttribute("password", password);
		String uri = request.getRequestURI();
		UsersDAO usersDAO = new UsersDAO();
		//Dang nhap
		try {
			if(uri.contains("login")) {
				if(username.trim().isEmpty() || password.trim().isEmpty()) {
					request.setAttribute("error", "Vui lòng không để trống 'Tên Đăng Nhập' hoặc 'Mật Khẩu'");
					request.getRequestDispatcher("/views/login-admin.jsp").forward(request, response);
					return;
				}else {
					Users users = new Users();
					users = usersDAO.getUserAndPassword(username, password);
					if(users != null) {
						// Cookie
						session.setAttribute("users", users);
						if(remember != null) {
							byte[] bytes = (users.getUsername()+","+users.getPassword()).getBytes();
							String userinfo = Base64.getEncoder().encodeToString(bytes);
							Cookie cookie = new Cookie("user",userinfo);
							cookie.setMaxAge(60*60*24);
							cookie.setPath("/");
							response.addCookie(cookie);
						}else if(remember == null) {//xoa cookie
							Cookie[] cookies = request.getCookies();
							if(cookies != null) {
								for (Cookie cookie : cookies) {
									if(cookie.getName().equals("user")) {
										cookie.setMaxAge(0);
										cookie.setPath("/");
										response.addCookie(cookie);
									}
								}
							}
						}
						// Phan Quyen
						if(users.isRole()) {
							session.setAttribute("wellcome","ADMIN: "+ users.getFullname());
							session.setAttribute("fullname", users.getFullname());
							session.setAttribute("selectUser", users.getFullname());
							session.setAttribute("idtable", users.getId());
							request.getRequestDispatcher("/views/chuyenhuong.jsp").forward(request, response);
						}else if(!users.isRole()) {
							session.setAttribute("wellcome","PHÓNG VIÊN: "+ users.getFullname());
							session.setAttribute("idtable", users.getId());
							session.setAttribute("selectUser", users.getFullname());
							session.setAttribute("fullname", users.getFullname());
							request.getRequestDispatcher("/views/chuyenhuong-pv.jsp").forward(request, response);
						}
					}else {
						request.setAttribute("error", "Đăng Nhập Thất Bại!\nSai 'Tên Đăng Nhập' hoặc 'Mật Khẩu'");
						request.getRequestDispatcher("/views/login-admin.jsp").forward(request, response);
						return;
					}
				}
				
			}
			
		} catch (Exception e) {
			request.setAttribute("errorLogin", "Đăng Nhập Thất Bại");
		}
		
		
	}

}
