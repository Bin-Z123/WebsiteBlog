package model.DAO;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import controller.Utils.JDBCHelper;
import model.Entity.Categories;
import model.Interface.BaseDAO;

public class CategoriesDAO implements BaseDAO<Categories,Integer> {
	@Override
    public void add(Categories entity) throws Exception {
        String sql = "INSERT INTO categories (name) VALUES (?)";
        int generatedId = JDBCHelper.executeInsertAndGetGeneratedKey(sql, entity.getName());
        entity.setId(generatedId);
    }

    @Override
    public void update(Categories entity) throws Exception {
        String sql = "UPDATE categories SET name = ? WHERE id = ?";
        JDBCHelper.executeUpdate(sql, entity.getName(), entity.getId());
    }

    @Override
    public void delete(Integer id) throws Exception {
        String sql = "DELETE FROM categories WHERE id = ?";
        JDBCHelper.executeUpdate(sql, id);
    }

    @Override
    public Categories getById(Integer id) throws Exception {
        String sql = "SELECT * FROM categories WHERE id = ?";
        List<Categories> list = getAllBySQL(sql, id);
        return list.isEmpty() ? null : list.get(0);
    }

    @Override
    public List<Categories> getAll() throws Exception {
        String sql = "SELECT * FROM categories";
        return getAllBySQL(sql);
    }

    @Override
    public List<Categories> getAllBySQL(String sql, Object... args) throws Exception {
        List<Categories> list = new ArrayList<>();
        try (ResultSet rs = JDBCHelper.executeQuery(sql, args)) {
            while (rs.next()) {
                Categories entity = new Categories();
                entity.setId(rs.getInt("id"));
                entity.setName(rs.getString("name"));
                list.add(entity);
            }
        }
        return list;
    }
}
