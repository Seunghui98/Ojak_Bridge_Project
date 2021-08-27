package commm;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class commDAO {
private Connection conn;
	
	private ResultSet rs;

	public commDAO() {
		try {
			String dbURL="jdbc:mysql://localhost:3306/medical?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
			String dbID = "root";
			String dbPW = "-";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPW);
			
			System.out.println(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// 접속
	
	public int getSeq() {
		int result=1;
		String SQL="SELECT comNum FROM COM";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) +1;
			}
			
		}
		catch(Exception e) {
			throw new RuntimeException(e.getMessage());
		}
		
		return result;
		
		
	}
	public int getNext() {
		String SQL="SELECT comNum FROM COM ORDER BY comNum DESC";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) +1;
			}
			return 1;//첫번째 게시물인 경우
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;// 데베 오류
	}
	/*public Com getCom() {
		String SQL="SELECT * FROM COM WHERE comNum = ?";
	
	try {
		PreparedStatement pstmt=conn.prepareStatement(SQL);
		pstmt.setInt(1, comNum);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			Com com=new Com();
			com.setComNum(rs.getInt(1));
			com.setUserID(rs.getString(2));
			com.setComContent(rs.getString(3));
			com.setComAvailable(rs.getInt(4));
			
			
			return com;
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	return null;
}*/
	public int getCom() {
		String SQL="SELECT comNum FROM COM ORDER BY comNum DESC";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) +1;
			}
			return 1;//첫번째 게시물인 경우
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;// 데베 오류
	}
	public int writeCom(String userID,String comContent) {
		String SQL="INSERT INTO COM VALUES(?,?,?,?)";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, getCom());
			pstmt.setString(2, userID);
			pstmt.setString(3, comContent);
			pstmt.setInt(4, 1);
		
			
			
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;// 데베 오류
	}
	public boolean nextPage(int compageNumber) {//페이지 처리
		String SQL="SELECT * FROM COM WHERE comNum < ? AND comAvailable = 1 ORDER BY comNum DESC LIMIT 10";
		
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (compageNumber - 1) *10);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public ArrayList<comm> getList(int compageNumber){
		String SQL="SELECT * FROM COM WHERE comAvailable = 1";
		ArrayList<comm> list=new ArrayList<comm>();
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (compageNumber - 1) *10);

			rs=pstmt.executeQuery();
			while(rs.next()) {
				comm com=new comm();
				com.setComNum(rs.getInt(1));
				com.setUserID(rs.getString(2));
				com.setComContent(rs.getString(3));
				com.setComAvailable(rs.getInt(4));
				list.add(com);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public comm getCom(int comNum) {
		String SQL="SELECT * FROM COM WHERE comNum = ?";
	
	try {
		PreparedStatement pstmt=conn.prepareStatement(SQL);
		pstmt.setInt(1, comNum);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			comm com=new comm();
			com.setComNum(rs.getInt(1));
			com.setUserID(rs.getString(2));
			com.setComContent(rs.getString(3));
			com.setComAvailable(rs.getInt(4));
			
			
			return com;
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	return null;
}
}
