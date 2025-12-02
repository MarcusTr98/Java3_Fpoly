package dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entity.MembersEntity;
import utils.JdbcHelper;

public class MemberDAO {

	public void insert(MembersEntity member) {
		String sql = "INSERT INTO Members (fullname, email, age, gender) VALUES (?,?,?,?)";
		JdbcHelper.executeUpdate(sql, member.getFullName(), member.getEmail(), member.getAge(), member.isGender());
	}

	public List<MembersEntity> findAll() {
		List<MembersEntity> list = new ArrayList<>();
		String sql = "SELECT * FROM Members";
		try (ResultSet rs = JdbcHelper.executeQuery(sql)) {
			while (rs.next()) {
				MembersEntity mb = new MembersEntity(rs.getInt("id"), rs.getString("fullname"), rs.getString("email"),
						rs.getInt("age"), rs.getBoolean("gender"));

				list.add(mb);
			}
		} catch (Exception e) {
			System.out.println("Có lỗi Find All: " + e);
		}
		return list;
	}
}
