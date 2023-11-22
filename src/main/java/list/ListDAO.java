package list;

import java.sql.ResultSet;

import util.JDBConnect;

public class ListDAO  extends JDBConnect{
	public ListDAO() {
		super();
	}
	
	public ListDTO getListDTO(String name) {
		ListDTO dto = new ListDTO();
		String sql="select * from list where g_name=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setIdx(rs.getString(1));
				dto.setG_name(rs.getString(2));
				dto.setExplanation(rs.getString(3));
				dto.setVisit(rs.getString(4));
				dto.setMadedate(rs.getDate(5));
				dto.setUrl(rs.getString(6));
				dto.setImage(rs.getString(7));
				dto.setId(rs.getString(8));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public void addGame(ListDTO dto) {
		if(dto.getImage() == null) {
			String query = "insert into list(g_name, explanation, madeDate, url, id) values(?, ?, current_timestamp, ?, ?)";
			try {
				psmt = conn.prepareStatement(query);
				psmt.setString(1, dto.getG_name());
				psmt.setString(2, dto.getExplanation());
				psmt.setString(3, dto.getUrl());
				psmt.setString(4, dto.getId());
				psmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			String query = "insert into list(g_name, explanation, madeDate, url, image, id) values(?, ?, current_timestamp, ?, ?, ?)";
			try {
				psmt = conn.prepareStatement(query);
				psmt.setString(1, dto.getG_name());
				psmt.setString(2, dto.getExplanation());
				psmt.setString(3, dto.getUrl());
				psmt.setString(4, dto.getImage());
				psmt.setString(5, dto.getId());
				psmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public ResultSet getList() {
		String query = "SELECT * FROM list order by idx desc";
		try {
			psmt = conn.prepareStatement(query);
			rs = psmt.executeQuery();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
}

