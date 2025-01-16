package model.DAO;

import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import controller.Utils.JDBCHelper;
import model.Entity.Users;
import model.Interface.BaseDAO;



public class UsersDAO implements BaseDAO<Users, Integer> {

	@Override
    public void add(Users entity) throws Exception {
        String sql = "INSERT INTO users (username, password, fullname, birthDay, gender, phone, email, role) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        int generatedId = JDBCHelper.executeInsertAndGetGeneratedKey(sql, entity.getUsername(), entity.getPassword(), entity.getFullname(), entity.getBirthday(), entity.isGender(), entity.getPhone(), entity.getEmail(), entity.isRole());
        entity.setId(generatedId);
    }

    @Override
    public void update(Users entity) throws Exception {
        String sql = "UPDATE users SET username = ?, password = ?, fullname = ?, birthDay = ?, gender = ?, phone = ?, email = ?, role = ? WHERE id = ?";
        JDBCHelper.executeUpdate(sql, entity.getUsername(), entity.getPassword(), entity.getFullname(), entity.getBirthday(), entity.isGender(), entity.getPhone(), entity.getEmail(), entity.isRole(), entity.getId());
    }

    @Override
    public void delete(Integer id) throws Exception {
        String sql = "DELETE FROM users WHERE id = ?";
        JDBCHelper.executeUpdate(sql, id);
    }

    @Override
    public Users getById(Integer id) throws Exception {
        String sql = "SELECT * FROM users WHERE id = ?";
        List<Users> list = getAllBySQL(sql, id);
        return list.isEmpty() ? null : list.get(0);
    }

    @Override
    public List<Users> getAll() throws Exception {
        String sql = "SELECT * FROM users";
        return getAllBySQL(sql);
    }

    @Override
    public List<Users> getAllBySQL(String sql, Object... args) throws Exception {
        List<Users> list = new ArrayList<>();
        try (ResultSet rs = JDBCHelper.executeQuery(sql, args)) {
            while (rs.next()) {
                Users entity = new Users();
                entity.setId(rs.getInt("id"));
                entity.setUsername(rs.getString("username"));
                entity.setPassword(rs.getString("password"));
                entity.setFullname(rs.getString("fullname"));
                Timestamp timestamp = rs.getTimestamp("birthday");
                entity.setBirthday(timestamp.toLocalDateTime());
                entity.setGender(rs.getBoolean("gender"));
                entity.setPhone(rs.getInt("phone"));
                entity.setEmail(rs.getString("email"));
                entity.setRole(rs.getBoolean("role"));
                list.add(entity);
            }
        }
        return list;
    }
    public Users getUserAndPassword(String username, String password)throws Exception{
    	String sql = "SELECT * from users WHERE username  = ? AND password =?";
    	List<Users> list  = getAllBySQL(sql, username, password);
    	return list.isEmpty()? null: list.get(0);
    }
    public boolean isLogin(String username,String password,String errorUser,String errorPass ) {
    	try {
    		if(username.trim().isEmpty()) {
    			errorUser = "Không để trống username";
        		return false;
        	}
    		if(username.trim().isEmpty()) {
    			errorPass = "Không để trống Password";
    			return false;
    		}
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return true;
    }

}

