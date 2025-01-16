package model.DAO;

import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import controller.Utils.JDBCHelper;
import model.Entity.News;
import model.Interface.BaseDAO;

public class NewsDAO implements BaseDAO<News, Integer> {

	@Override
	public void add(News entity) throws Exception {
		String sql = "INSERT INTO news (title, content, image, postedDate, author, viewCount, categoryId, status, home) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		int generatedId = JDBCHelper.executeInsertAndGetGeneratedKey(sql, entity.getTitle(), entity.getContent(),
				entity.getImage(), entity.getPostedDate(), entity.getAuthor(), entity.getViewCount(),
				entity.getCategoryId(), entity.getStatus(), entity.isHome());
		entity.setId(generatedId);
	}

	@Override
	public void update(News entity) throws Exception {
		String sql = "UPDATE news SET title = ?, content = ?, image = ?, postedDate = ?, author = ?, viewCount = ?, categoryId = ?, status = ?, home = ? WHERE id = ?";
		JDBCHelper.executeUpdate(sql, entity.getTitle(), entity.getContent(), entity.getImage(),
				entity.getPostedDate(), entity.getAuthor(), entity.getViewCount(),
				entity.getCategoryId(), entity.getStatus(), entity.isHome(), entity.getId());
	}	

	@Override
	public void delete(Integer id) throws Exception {
		String sql = "DELETE FROM news WHERE id = ?";
		JDBCHelper.executeUpdate(sql, id);
	}

	@Override
	public News getById(Integer id) throws Exception {
		String sql = "SELECT * FROM news WHERE id = ?";
		List<News> list = getAllBySQL(sql, id);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public List<News> getAll() throws Exception {
		String sql = "SELECT * FROM news";
		return getAllBySQL(sql);
	}

	@Override
	public List<News> getAllBySQL(String sql, Object... args) throws Exception {
		List<News> list = new ArrayList<>();
		try (ResultSet rs = JDBCHelper.executeQuery(sql, args)) {
			while (rs.next()) {
				News entity = new News();
				entity.setId(rs.getInt("id"));
				entity.setTitle(rs.getString("title"));
				entity.setContent(rs.getString("content"));
				entity.setImage(rs.getString("image"));
				entity.setPostedDate(new Date());
				entity.setAuthor(rs.getInt("author"));
				entity.setViewCount(rs.getInt("viewCount"));
				entity.setCategoryId(rs.getInt("categoryId"));
				entity.setStatus(rs.getInt("status"));
				entity.setHome(rs.getBoolean("home"));
				list.add(entity);
			}
		}
		return list;
	}

	public List<News> getTop5() throws Exception {
		String sql = "SELECT TOP 5 * FROM news WHERE home = 1 ORDER BY viewCount DESC";
		List<News> list = getAllBySQL(sql);
		return list.isEmpty() ? new ArrayList<News>() : list;
	}

	public News getTop1() throws Exception {
		String sql = "SELECT TOP 1 * FROM news WHERE home = 1 ORDER BY viewCount DESC";
		List<News> list = getAllBySQL(sql);
		return list.isEmpty() ? null : list.get(0);
	}

	public News getTop1News(Integer categoryId) throws Exception {
		String sql = "SELECT TOP 1 * FROM news where home=1 and categoryId = " + categoryId + " ORDER BY viewCount DESC";
		List<News> list = getAllBySQL(sql);
		return list.isEmpty() ? null : list.get(0);
	}

	public List<News> getTop5NewsNew() throws Exception {
		String sql = "SELECT TOP 5 * FROM news WHERE home = 1 ORDER BY postedDate DESC";
		List<News> list = getAllBySQL(sql);
		return list.isEmpty() ? new ArrayList<News>() : list;
	}
	

	public void updateViews(Integer id) throws Exception {
		String sql = "UPDATE news SET viewCount = viewCount + 1 WHERE id = ?";
		JDBCHelper.executeUpdate(sql, id);
	}

	private List<Object[]> getListOfArray(String sql, String[] cols, Object... args) {
		try {
			List<Object[]> list = new ArrayList<>();
			ResultSet rs = JDBCHelper.executeQuery(sql, args);
			while (rs.next()) {
				Object[] vals = new Object[cols.length];
				for (int i = 0; i < cols.length; i++) {
					vals[i] = rs.getObject(cols[i]);
				}
				list.add(vals);
			}
			rs.getStatement().getConnection().close();
			return list;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
//news.id, news.title, categories.name, news.postedDate, users.fullname
	public List<Object[]> getNewsTable() {
		String sql = "SELECT * \r\n"
				+ "from  news join  categories on news.categoryId = categories.id\r\n"
				+ "join users on news.author = users.id;";
		String[] cols = {"title","name","postedDate","fullname","id","viewCount","content","image","author","categoryId","home"};
						// 0        1        2           3        4        5         6         7       8          9         10       
		return getListOfArray(sql, cols);
	}
	
	public int getCountNews() throws Exception{
		String sql = "SELECT COUNT(*) from news";
		ResultSet rs = JDBCHelper.executeQuery(sql);
		if(rs.next()) {
			return rs.getInt(1);
		}
		return 0;
	}
	public int getCountCategory(int id) throws Exception{
		String sql = "SELECT COUNT(*) from news WHERE categoryId = ?";
		ResultSet rs = JDBCHelper.executeQuery(sql, id);
		if(rs.next()) {
			return rs.getInt(1);
		}
		return 0;
	}
	public List<Object[]> getTableByUser(int id) throws Exception{
		String sql = "SELECT * \r\n"
				+ "from  news join  categories on news.categoryId = categories.id\r\n"
				+ "join users on news.author = users.id WHERE author = ?;";
		String[] cols = {"title","name","postedDate","fullname","id","viewCount","content","image","author","categoryId","home"};
						// 0        1        2           3        4        5         6         7       8          9         10       
		return getListOfArray(sql, cols, id);
	}
}
