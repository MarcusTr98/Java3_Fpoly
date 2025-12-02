package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import entity.UserEntity;
import utils.JdbcHelper;

public class UserDAO {

	public UserEntity checkLogin(String userName, String passWord) {
		String sql = "SELECT * FROM Users WHERE username = ? AND password = ?";

		// JdbcHelper.openConnection() phải trả về Connection
		try (Connection conn = JdbcHelper.openConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

			stmt.setString(1, userName);
			stmt.setString(2, passWord);

			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					return new UserEntity(rs.getString("username"), rs.getString("password"), rs.getString("fullname"),
							rs.getBoolean("role"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
