package cn.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import cn.com.model.Info;
import cn.com.util.JDBCUtil;

public class InfoDao {
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;
	Statement stmt;

	public List<Info> infolist(int start,int num, String keyword) {
		// TODO Auto-generated method stub
		List<Info> infolist = new ArrayList<Info>();
		String sql = "select * from info  order by info_id desc  limit "+start+","+num;
		if(!"".equals(keyword)&&keyword!=null){
		sql = "select * from info where info_title like '%"+keyword+"%'  order by info_id desc  limit "+start+","+num;
		}
	
		conn = JDBCUtil.getConnection();
		try{
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()){
				Info info = new Info();
				info.setInfo_id(rs.getInt("info_id"));
				info.setInfo_title(rs.getString("info_title"));
				info.setInfo_content(rs.getString("info_content"));
				info.setInfo_status(rs.getInt("info_status"));
				info.setInfo_type(rs.getInt("info_type"));
				info.setInfo_danshuang(rs.getInt("info_danshuang"));
				info.setInfo_date(rs.getTimestamp("info_date"));
				info.setInfo_num(rs.getInt("info_num"));
				info.setInfo_pnum(rs.getInt("info_pnum"));
				infolist.add(info);
			}
		}
			catch(SQLException e){
				e.printStackTrace();
			}
			finally{
				JDBCUtil.close(conn, stmt, psmt, rs);
			}
		
		return infolist;
	}

	public int infolistmaxnum(String keyword) {
		// TODO Auto-generated method stub
		int i = 0;
		String sql = "select * from info";
		if(!"".equals(keyword)&&keyword!=null){
			sql="select * from info  where info_title like '%"+keyword+"%'";
		}
		conn = JDBCUtil.getConnection();
		try{
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()){
				i++;
			}
		}
			catch(SQLException e){
				e.printStackTrace();
			}
			finally{
				JDBCUtil.close(conn, stmt, psmt, rs);
			}
		
		return i;
	}

	public List<Info> clicktitlesearch(int infoid,int infopnum) {
		// TODO Auto-generated method stub
		int i = 0;
		List<Info> infolist = new ArrayList<Info>();
		String sql ="select * from xuanxiang where xuanxiang_info_id='"+infoid+"'";
		conn = JDBCUtil.getConnection();
		
			
		try{
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()){
				Info info = new Info();
				info.setXuanxiang_content(rs.getString("xuanxiang_content"));
				info.setXuanxiang_num(rs.getInt("xuanxiang_num"));
				info.setXuanxiang_maxnum(infopnum);
				infolist.add(info);
			}
		}
			catch(SQLException e){
				e.printStackTrace();
			}
			finally{
				JDBCUtil.close(conn, stmt, psmt, rs);
			}
			
		
		return infolist;
	}

	public List<Info> clickjoinsearch(int infoid) {
		List<Info> infolist = new ArrayList<Info>();
		String sql ="select * from info a,xuanxiang b where b.xuanxiang_info_id='"+infoid+"' and a.info_id='"+infoid+"'";
		conn = JDBCUtil.getConnection();
		try{
			psmt = conn.prepareStatement(sql);		
			rs = psmt.executeQuery();
			while(rs.next()){
				Info info = new Info();
				info.setInfo_id(rs.getInt("info_id"));
				info.setInfo_title(rs.getString("info_title"));
				info.setXuanxiang_content(rs.getString("xuanxiang_content"));
				info.setInfo_danshuang(rs.getInt("info_danshuang"));
				info.setXuanxiang_num(rs.getInt("xuanxiang_num"));
				infolist.add(info);
			}
		}
			catch(SQLException e){
				e.printStackTrace();
			}
			finally{
				JDBCUtil.close(conn, stmt, psmt, rs);
			}
			
		
		return infolist;
	}

	public int join(int infoid,String options,int i) {
		int j = 0;
		String sql ="update xuanxiang set xuanxiang_num=xuanxiang_num+1 where xuanxiang_info_id='"+infoid+"' and xuanxiang_iid='"+options+"'";
		String sql2 ="update info set info_pnum=info_pnum+1 where info_id='"+infoid+"'";
		String sql3 ="update xuanxiang set xuanxiang_pnum=xuanxiang_pnum+1 where xuanxiang_info_id='"+infoid+"' and xuanxiang_iid='"+options+"'";
		conn = JDBCUtil.getConnection();
		try{
			if(i==0){
			psmt = conn.prepareStatement(sql2);
			psmt.executeUpdate();
			}
			if(i==-1){
				psmt = conn.prepareStatement(sql3);
				psmt.executeUpdate();
			}if(i>=0){
			psmt = conn.prepareStatement(sql);	
			j = psmt.executeUpdate();
			}
			
		}
			catch(SQLException e){
				e.printStackTrace();
			}
			finally{
				JDBCUtil.close(conn, stmt, psmt, rs);
			}
			
		
		return j;
	}

	public int addinfo(String infotitle, int danshuang, int infonum) {
		int infoid=0;
		int i = 0;
		String sql ="insert into info(info_title,info_danshuang,info_num) values('"+infotitle+"','"+danshuang+"','"+infonum+"')";
		conn = JDBCUtil.getConnection();
		try{
			psmt = conn.prepareStatement(sql);	
			
			i = psmt.executeUpdate();
			if(i>0){
				sql = "select info_id from info where info_id=last_insert_id()";
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
                if(rs.next()){
                	infoid=rs.getInt("info_id");
                }
			}
		}
			catch(SQLException e){
				e.printStackTrace();
			}
			finally{
				JDBCUtil.close(conn, stmt, psmt, rs);
			}
		return infoid;
	}

	public boolean addxuanxiang(String xx_content,int i,int infoid) {
		String sql ="insert into xuanxiang(xuanxiang_content,xuanxiang_iid,xuanxiang_info_id) values('"+xx_content+"','"+i+"','"+infoid+"')";
		conn = JDBCUtil.getConnection();
		try{
			psmt = conn.prepareStatement(sql);	
			
			i = psmt.executeUpdate();
			
		}
			catch(SQLException e){
				e.printStackTrace();
			}
			finally{
				JDBCUtil.close(conn, stmt, psmt, rs);
			}
		return i>0;
	}

	public boolean saveweihuinfo(int infoid, String danshuang,String infotitle,int length,String clear) {
		int i = 0;
		String sql ="update info set info_danshuang='"+danshuang+"',info_title='"+infotitle+"',info_num='"+length+"' where info_id='"+infoid+"' ";
		
		conn = JDBCUtil.getConnection();
		try{
			psmt = conn.prepareStatement(sql);	
			i = psmt.executeUpdate();
		}
			catch(SQLException e){
				e.printStackTrace();
			}
			finally{
				JDBCUtil.close(conn, stmt, psmt, rs);
			}
		return i>0;
	}

	public boolean saveweihuxx(int i, String xx_content, int infoid) {
		int j = 0;
		String sql ="update xuanxiang set xuanxiang_content='"+xx_content+"' where xuanxiang_info_id='"+infoid+"' and xuanxiang_iid='"+i+"'";
		String sql2 ="insert into xuanxiang(xuanxiang_info_id,xuanxiang_content,xuanxiang_iid) values('"+infoid+"','"+xx_content+"','"+i+"')";
		conn = JDBCUtil.getConnection();
		try{
			psmt = conn.prepareStatement(sql);	
			
			j = psmt.executeUpdate();
			if(j==0){
				psmt = conn.prepareStatement(sql2);	
				j = psmt.executeUpdate();
			}
			
		}
			catch(SQLException e){
				e.printStackTrace();
			}
			finally{
				JDBCUtil.close(conn, stmt, psmt, rs);
			}
			
		
		return j>0;
	}

	public List<Info> infolistsearch(int start, int num, String keyword) {
		// TODO Auto-generated method stub
		List<Info> infolist = new ArrayList<Info>();
		String sql = "select * from info where info_title like '%"+keyword+"%' limit "+start+","+num;
		conn = JDBCUtil.getConnection();
		try{
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()){
				Info info = new Info();
				info.setInfo_id(rs.getInt("info_id"));
				info.setInfo_title(rs.getString("info_title"));
				info.setInfo_content(rs.getString("info_content"));
				info.setInfo_status(rs.getInt("info_status"));
				info.setInfo_type(rs.getInt("info_type"));
				info.setInfo_danshuang(rs.getInt("info_danshuang"));
				info.setInfo_date(rs.getTimestamp("info_date"));
				info.setInfo_num(rs.getInt("info_num"));
				info.setInfo_pnum(rs.getInt("info_pnum"));
				infolist.add(info);
			}
		}
			catch(SQLException e){
				e.printStackTrace();
			}
			finally{
				JDBCUtil.close(conn, stmt, psmt, rs);
			}
		
		return infolist;
	}

	public Info clicktitlesearchtitle(int infoid) {
		// TODO Auto-generated method stub
		Info info = new Info();
		String sql = "select * from info where info_id='"+infoid+"'";
		conn = JDBCUtil.getConnection();
		try{
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()){
				
				info.setInfo_id(rs.getInt("info_id"));
				info.setInfo_title(rs.getString("info_title"));
				info.setInfo_content(rs.getString("info_content"));
				info.setInfo_status(rs.getInt("info_status"));
				info.setInfo_type(rs.getInt("info_type"));
				info.setInfo_danshuang(rs.getInt("info_danshuang"));
				info.setInfo_date(rs.getTimestamp("info_date"));
				info.setInfo_num(rs.getInt("info_num"));
				info.setInfo_pnum(rs.getInt("info_pnum"));
			}
		}
			catch(SQLException e){
				e.printStackTrace();
			}
			finally{
				JDBCUtil.close(conn, stmt, psmt, rs);
			}
		
		return info;
	}

	public boolean xuanxiangclear(int infoid) {
		int i = 0;
		String sql ="update xuanxiang set xuanxiang_num='0',xuanxiang_pnum='0' where xuanxiang_info_id='"+infoid+"'";
		conn = JDBCUtil.getConnection();
		try{
			psmt = conn.prepareStatement(sql);	
			i = psmt.executeUpdate();
		}
			catch(SQLException e){
				e.printStackTrace();
			}
			finally{
				JDBCUtil.close(conn, stmt, psmt, rs);
			}
			
		
		return i>0;
	}

	public int delxx(String markid, int infoid) {
		int i = 0;
		String sqls= "select xuanxiang_pnum from xuanxiang where xuanxiang_info_id='"+infoid+"' and xuanxiang_iid='"+markid+"'";
		String sql ="delete from xuanxiang where xuanxiang_info_id='"+infoid+"' and xuanxiang_iid='"+markid+"'";
		conn = JDBCUtil.getConnection();
		try{
			psmt = conn.prepareStatement(sqls);	
			rs=psmt.executeQuery();
			if(rs.next())
			i=rs.getInt("xuanxiang_pnum");
		}
			catch(SQLException e){
				e.printStackTrace();
			}
		try{
			psmt = conn.prepareStatement(sql);	
			psmt.executeUpdate();
		}
			catch(SQLException e){
				e.printStackTrace();
			}
			finally{
				JDBCUtil.close(conn, stmt, psmt, rs);
			}
			
		
		return i;
	}

	public boolean jianpnum(int infoid, int pnum) {
		int i = 0;
		String sql ="update info set info_pnum=info_pnum-"+pnum+",info_num=info_num-1 where info_id='"+infoid+"'";
		conn = JDBCUtil.getConnection();
		try{
			psmt = conn.prepareStatement(sql);	
			i= psmt.executeUpdate();
		}
			catch(SQLException e){
				e.printStackTrace();
			}
			finally{
				JDBCUtil.close(conn, stmt, psmt, rs);
			}
			
		
		return i>0;
	}

	public boolean changemark(int i,int infoid) {
		int f = 0;
		String sql ="update xuanxiang set xuanxiang_iid=xuanxiang_iid-1 where xuanxiang_info_id='"+infoid+"' and xuanxiang_iid='"+i+"'";
		conn = JDBCUtil.getConnection();
		try{
			psmt = conn.prepareStatement(sql);	
			f= psmt.executeUpdate();
		}
			catch(SQLException e){
				e.printStackTrace();
			}
			finally{
				JDBCUtil.close(conn, stmt, psmt, rs);
			}
		return f>0;
	}

	public boolean saveweihuiclear(int infoid) {
		int i = 0;
		
		String sql ="update info set info_pnum='0' where info_id='"+infoid+"'";
	
		conn = JDBCUtil.getConnection();
		try{
			psmt = conn.prepareStatement(sql);	
			i = psmt.executeUpdate();
		}
			catch(SQLException e){
				e.printStackTrace();
			}
			finally{
				JDBCUtil.close(conn, stmt, psmt, rs);
			}
		return i>0;
	}

	public boolean addkongzhi(int infoid, int userid) {

		int i = 0;
		
		String sql ="insert into kongzhi(kongzhi_info_id,kongzhi_user_id) values('"+infoid+"','"+userid+"')";
		conn = JDBCUtil.getConnection();
		try{
			psmt = conn.prepareStatement(sql);	
			i = psmt.executeUpdate();
		}
			catch(SQLException e){
				e.printStackTrace();
			}
			finally{
				JDBCUtil.close(conn, stmt, psmt, rs);
			}
		return i>0;
	
	}

	public String searchkongzhi(int userid,int infoid) {
		String infoid_s = "";
		String sql ="select * from kongzhi where kongzhi_user_id='"+userid+"' and kongzhi_info_id='"+infoid+"'";
	
		conn = JDBCUtil.getConnection();
		try{
			psmt = conn.prepareStatement(sql);	
			rs= psmt.executeQuery();
			if(rs.next()){
				infoid_s=rs.getString("kongzhi_info_id");
			}
		}
			catch(SQLException e){
				e.printStackTrace();
			}
			finally{
				JDBCUtil.close(conn, stmt, psmt, rs);
			}
		return infoid_s;
	
	}

	public void kongzhiclear(int infoid) {
		String sql ="delete from kongzhi where kongzhi_info_id='"+infoid+"'";
		conn = JDBCUtil.getConnection();
		try{
			psmt = conn.prepareStatement(sql);	
			 psmt.executeUpdate();
		}
			catch(SQLException e){
				e.printStackTrace();
			}
			finally{
				JDBCUtil.close(conn, stmt, psmt, rs);
			}
			

	}

	public boolean delall(int infoid) {
		int i = 0;
		String sql1 ="delete from info where info_id='"+infoid+"'";
		String sql2 ="delete from xuanxiang where xuanxiang_info_id='"+infoid+"'";
		String sql3 ="delete from kongzhi where kongzhi_info_id='"+infoid+"'";
		conn = JDBCUtil.getConnection();
		try{
			 psmt = conn.prepareStatement(sql1);	
			 i=i+psmt.executeUpdate();
			 psmt = conn.prepareStatement(sql2);	
			 i=i+psmt.executeUpdate();
			 psmt = conn.prepareStatement(sql3);	
			 i=i+psmt.executeUpdate();
		}
			catch(SQLException e){
				e.printStackTrace();
			}
			finally{
				JDBCUtil.close(conn, stmt, psmt, rs);
			}
			
return i>0;
	}
}
