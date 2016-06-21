package cn.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import cn.com.util.JDBCUtil;
import cn.com.model.User;

public class UserDao {
	Connection conn;
	PreparedStatement psmt;
	Statement stmt;
	ResultSet rs;

	public User login(String username, String password) {
		// TODO Auto-generated method stub

		User user = null;
		String sql = "select * from user where user_name='" + username
				+ "' and user_password='" + password + "' and user_status='0'";
		conn = JDBCUtil.getConnection();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setUser_type(rs.getInt("user_type"));
				user.setUser_id(rs.getInt("user_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, psmt, rs);
		}
		return user;
	}

	public int checkname(String username) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "select user_name from user where user_name='" + username
				+ "' ";
		conn = JDBCUtil.getConnection();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if (rs.next()) {
				i = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, psmt, rs);
		}
		return i;
	}

	public int register(String username, String password) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "insert into user(user_name,user_password) values('"
				+ username + "','" + password + "')";
		conn = JDBCUtil.getConnection();
		try {
			psmt = conn.prepareStatement(sql);
			i = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, psmt, rs);
		}
		return i;
	}

	public int userlistmaxnum() {
		int i = 0;
		String sql = "select * from user";
		conn = JDBCUtil.getConnection();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, psmt, rs);
		}
		return i;
	}

	public List<User> userlist(int start, int num) {
		// TODO Auto-generated method stub
		User user;
		List<User> userlist = new ArrayList<User>();
		String sql = "select * from user user_id limit " + start + "," + num;
		conn = JDBCUtil.getConnection();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				user = new User();
				user.setUser_id(rs.getInt("user_id"));
				user.setUser_name(rs.getString("user_name"));
				user.setUser_password(rs.getString("user_password"));
				user.setUser_status(rs.getInt("user_status"));
				user.setUser_type(rs.getInt("user_type"));
				userlist.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, psmt, rs);
		}
		return userlist;
	}

	public User editsearchbyid(int userid) {
		User user = new User();
		String sql = "select * from user where user_id='" + userid + "'";
		conn = JDBCUtil.getConnection();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if (rs.next()) {
				user.setUser_id(rs.getInt("user_id"));
				user.setUser_name(rs.getString("user_name"));
				user.setUser_password(rs.getString("user_password"));
				user.setUser_status(rs.getInt("user_status"));
				user.setUser_type(rs.getInt("user_type"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, psmt, rs);
		}
		return user;
	}

	public boolean saveedituser(int userid, String password) {
		int i = 0;
		String sql = "update user set user_password='" + password
				+ "' where user_id='" + userid + "'";
		conn = JDBCUtil.getConnection();
		try {
			psmt = conn.prepareStatement(sql);
			i = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, psmt, rs);
		}
		return i > 0;
	}

	public boolean deluser(int userid, int userstatus) {
		int i = 0;
		String sql = null;
		if (userstatus == 0) {
			sql = "update user set user_status='1' where user_id='" + userid
					+ "'";
		}
		if (userstatus == 1) {
			sql = "update user set user_status='0' where user_id='" + userid
					+ "'";
		}
		conn = JDBCUtil.getConnection();
		try {
			psmt = conn.prepareStatement(sql);
			i = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, psmt, rs);
		}
		return i > 0;
	}

	public List<User> search(String searchval, String mark,int start,int num) {
		String sql = null;
		List<User> userlist = new ArrayList<User>();
		if ("id".equals(mark)) {
			sql = "select * from user where user_id='" + searchval + "'";
		}
		if ("name".equals(mark)) {
			sql = "select * from user where user_name like '%" + searchval
					+ "%' and user_id limit "+start+","+num;
		}
		conn = JDBCUtil.getConnection();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setUser_id(rs.getInt("user_id"));
				user.setUser_name(rs.getString("user_name"));
				user.setUser_password(rs.getString("user_password"));
				user.setUser_status(rs.getInt("user_status"));
				user.setUser_type(rs.getInt("user_type"));
				userlist.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, psmt, rs);
		}
		return userlist;
	}

	public int searchmaxnum(String searchval) {

		int i = 0;

		String sql = "select * from user where user_name like '%" + searchval
				+ "%'";

		conn = JDBCUtil.getConnection();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, psmt, rs);
		}
		return i;
	}

}
