package model.DAO;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import controller.Utils.JDBCHelper;
import model.Entity.NewsLetters;
import model.Interface.BaseDAO;



public class NewsLettersDAO implements BaseDAO<NewsLetters, String> {
	 @Override
	    public void add(NewsLetters entity) throws Exception {
	        String sql = "INSERT INTO newsLetters (email, status) VALUES (?, ?)";
	        JDBCHelper.executeUpdate(sql, entity.getEmail(), entity.isStatus());
	    }

	    @Override
	    public void update(NewsLetters entity) throws Exception {
	        String sql = "UPDATE newsLetters SET status = ? WHERE email = ?";
	        JDBCHelper.executeUpdate(sql, entity.isStatus(), entity.getEmail());
	    }

	    @Override
	    public void delete(String email) throws Exception {
	        String sql = "DELETE FROM newsLetters WHERE email = ?";
	        JDBCHelper.executeUpdate(sql, email);
	    }

	    @Override
	    public NewsLetters getById(String email) throws Exception {
	        String sql = "SELECT * FROM newsLetters WHERE email = ?";
	        List<NewsLetters> list = getAllBySQL(sql, email);
	        return list.isEmpty() ? null : list.get(0);
	    }

	    @Override
	    public List<NewsLetters> getAll() throws Exception {
	        String sql = "SELECT * FROM newsLetters";
	        return getAllBySQL(sql);
	    }

	    @Override
	    public List<NewsLetters> getAllBySQL(String sql, Object... args) throws Exception {
	        List<NewsLetters> list = new ArrayList<>();
	        try (ResultSet rs = JDBCHelper.executeQuery(sql, args)) {
	            while (rs.next()) {
	                NewsLetters entity = new NewsLetters();
	                entity.setEmail(rs.getString("email"));
	                entity.setStatus(rs.getBoolean("status"));
	                list.add(entity);
	            }
	        }
	        return list;
	    }
}
