package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private PreparedStatement pstmt2;
	private ResultSet rs2;
	
	public UserDAO(){
		try {
			String dbURL="jdbc:mysql://localhost:3306/medical?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
			String dbID = "root";
			String dbPW = "-";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPW);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPW) {
		String SQL = "SELECT userPW FROM USER WHERE userID=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPW)) {
					return 1; 
				} else
					return 0; 
			}
			return -1; 
		}catch(Exception e) {
			e.printStackTrace();

		}
		return -2; 
	}
	
	public String userName(String userID) {
		String SQL = "SELECT userName FROM USER WHERE userID=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1);
					
			}
			
		}catch(Exception e) {
			e.printStackTrace();

		}
		return ""; 
	}
	
	public int join(User user) {
	      System.out.println(user + "<< user 값");
	      String SQL="INSERT INTO USER VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	      try {
	         pstmt=conn.prepareStatement(SQL);
	         pstmt.setString(1,user.getUserID());
	         pstmt.setString(2,user.getUserPW());
	         pstmt.setString(3,user.getUserName());
	         pstmt.setString(4,user.getUserNum());
	         pstmt.setString(5,user.getSex());
	         pstmt.setString(6,user.getAge());
	         pstmt.setString(7,user.getAddress());
	         pstmt.setString(8,user.getUserEmail());
	         
	         System.out.print(user);
	         return pstmt.executeUpdate();

	      } catch(Exception e) {
	         e.printStackTrace();
	      }
	      
	      return -1;//데이터베이스 오류
	   }
	
	
	
	
	
	
	
	
	
}
