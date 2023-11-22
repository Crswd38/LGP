package list;

import util.JDBConnect;

public class MemberDAO extends JDBConnect{
	
	public MemberDAO() {
		super();
	}
	
	public String signIn(String id, String pw) {
		String sql="select * from member where id=? and pw=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			rs = psmt.executeQuery();
			if(rs.next()) {
				return id;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public MemberDTO getMemberDTO(String id) {
		MemberDTO dto = new MemberDTO();
		String sql="select * from member where id=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setIdx(rs.getString(1));
				dto.setId(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setPw(rs.getString(4));
				dto.setProfile(rs.getString(5));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public void signUp(String id, String name, String pw, String profile) {
		if(profile == null) {
			String sql="insert into member(id, name, pw) values(?, ?, ?)";
			try {
				psmt=conn.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setString(2, name);
				psmt.setString(3, pw);
				psmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else {
			String sql="insert into member(id, name, pw, profile) values(?, ?, ?, ?)";
			try {
				psmt=conn.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setString(2, name);
				psmt.setString(3, pw);
				psmt.setString(4, profile);
				psmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}