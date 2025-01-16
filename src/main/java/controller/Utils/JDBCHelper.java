package controller.Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCHelper {
	// information
	private static final String url = "jdbc:sqlserver://localhost:1433;databaseName=ABCNews;encrypt=false;trustServerCertificate=True";
	private static final String username = "sa";
	private static final String pass = "123";

	static {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (Exception e) {
			throw new RuntimeException("Lỗi tải driver", e);
		}
	}

	// method open connection
	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(url, username, pass);
	}

	// method close resources
	public static void closeResources(Connection conn, PreparedStatement stmt, ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static ResultSet executeQuery(String sql, Object... entity) throws SQLException {
		Connection conn = getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		setParameters(stmt, entity);
		return stmt.executeQuery(); // close rs after using
	}

	public static int executeUpdate(String sql, Object... entity) throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = getConnection();
			stmt = conn.prepareStatement(sql);
			setParameters(stmt, entity);
			return stmt.executeUpdate();
		} finally {
			closeResources(conn, stmt, null);
		}
	}

	public static void setParameters(PreparedStatement stmt, Object... entity) throws SQLException {
		for (int i = 0; i < entity.length; i++) {
			stmt.setObject(i + 1, entity[i]);
		}
	}

	public static int executeInsertAndGetGeneratedKey(String sql, Object... args) throws SQLException {
		try (Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
			setParameters(pstmt, args);
			pstmt.executeUpdate();
			try (ResultSet rs = pstmt.getGeneratedKeys()) {
				if (rs.next()) {
					return rs.getInt(1); // Return the generated key
				}
			}
		}
		return -1; // Return -1 if no key was generated
	}

}
