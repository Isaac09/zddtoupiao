package cn.com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCUtil {
	 private static final String Driver="com.mysql.jdbc.Driver";
	 private static final String url="jdbc:mysql://localhost:3306/zddtoupiao?useUnicode=true&characterEncoding=utf8";
	 private static final String user="root";
	 private static final String pwd="root";

	 public static Connection getConnection(){
		 Connection conn=null;
		 try {
		 	Class.forName(Driver);
		 	conn=DriverManager.getConnection(url, user, pwd);

		 } catch (ClassNotFoundException e) {
		 	e.printStackTrace();
		 }catch(SQLException e){
		 	e.printStackTrace();
		 }
		return conn;

}


public static void close(Connection conn,Statement stmt,PreparedStatement psmt,ResultSet rs){
try{
if(rs!=null){
	rs.close();
}
if(psmt!=null){
	psmt.close();
}
if(stmt!=null){
	stmt.close();
}
if(conn!=null){
	conn.close();
}
}catch(SQLException e){
	e.printStackTrace();
}
}

}
