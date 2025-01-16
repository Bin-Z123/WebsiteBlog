package controller.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DAO.NewsDAO;
import model.Entity.News;

import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class TrangTinTuc
 */
@WebServlet(urlPatterns = {"/trangchitiet","/trangvanhoa","/trangphapluat","/trangthethao" })
public class TrangTinTuc extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		News news = new News();
		NewsDAO newsDAO = new NewsDAO();
		
		try {
			List<News> newsList = newsDAO.getAll();
			String tin = "";
			//Trang Chu
			if(uri.contains("TrangTinTuc")) {
				List<News> newList = newsDAO.getAll();
				News top1News = newsDAO.getTop1();
				
				tin = "Trang Chủ - Tin Nổi Bật";
				request.setAttribute("tin", tin);
				request.setAttribute("top1News", top1News);
				request.setAttribute("newList", newList);
				
				//Xem nhieu
				List<News> top5News = newsDAO.getTop5();
				request.setAttribute("top5News", top5News);
//				for (News news2 : top5News) {
//					if(news2.isHome()) {
//						System.out.println("top5 News 2: "+news2);
//						
//					}
//				}
				// Tin Moi Nhat
				List<News> top5NewsNew = newsDAO.getTop5NewsNew();
				request.setAttribute("top5NewsNew", top5NewsNew);
				
				request.getRequestDispatcher("/views/index.jsp").forward(request, response);
			}
			// Trang Chi Tiet
			if(uri.contains("trangchitiet")) {
				String sid = request.getParameter("id");
				int id = Integer.parseInt(sid);
				News newsDetail = newsDAO.getById(id);
				System.out.println("News Detail: "+newsDetail);
				//tang view
				newsDAO.updateViews(id);
				
				request.setAttribute("newsDetail", newsDetail);
				request.getRequestDispatcher("/views/detail.jsp").forward(request, response);
			}
			// Trang Van Hoa
			if(uri.contains("trangvanhoa")) {
				String scategoryId = request.getParameter("categoryId");
				News top1VanHoa = newsDAO.getTop1News(Integer.parseInt(scategoryId));
				tin = "Văn Hóa - Tin Nổi Bật";
				//Tin xem nhieu nhat
				List<News> top5News = newsDAO.getTop5();
				System.out.println("top1VanHoa: "+top1VanHoa);
				// Tin Moi Nhat
				List<News> top5NewsNew = newsDAO.getTop5NewsNew();
				request.setAttribute("top5NewsNew", top5NewsNew);
				
				
				request.setAttribute("tin", tin);
				request.setAttribute("top1News", top1VanHoa);
				request.setAttribute("top5News", top5News);
				request.getRequestDispatcher("/views/index.jsp").forward(request, response);
			}
			// Trang phap luat
			if(uri.contains("trangphapluat")) {
				String scategoryId = request.getParameter("categoryId");
				News top1PhapLuat = newsDAO.getTop1News(Integer.parseInt(scategoryId));
				tin = "Pháp Luật - Tin Nổi Bật";
				//Tin xem nhieu nhat
				List<News> top5News = newsDAO.getTop5();
				// Tin Moi Nhat
				List<News> top5NewsNew = newsDAO.getTop5NewsNew();
				request.setAttribute("top5NewsNew", top5NewsNew);
				
				
				request.setAttribute("tin", tin);
				request.setAttribute("top1News", top1PhapLuat);
				request.setAttribute("top5News", top5News);
				request.getRequestDispatcher("/views/index.jsp").forward(request, response);
			}
			// Trang the thao
			if(uri.contains("trangthethao")) {
				String scategoryId = request.getParameter("categoryId");
				News top1TheThao = newsDAO.getTop1News(Integer.parseInt(scategoryId));
				tin = "Thể Thao - Tin Nổi Bật";
				//Tin xem nhieu nhat
				List<News> top5News = newsDAO.getTop5();
				// Tin Moi Nhat
				List<News> top5NewsNew = newsDAO.getTop5NewsNew();
				request.setAttribute("top5NewsNew", top5NewsNew);
				
				request.setAttribute("tin", tin);
				request.setAttribute("top1News", top1TheThao);
				request.setAttribute("top5News", top5News);
				request.getRequestDispatcher("/views/index.jsp").forward(request, response);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
