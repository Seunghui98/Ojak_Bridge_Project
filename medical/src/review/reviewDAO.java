package review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class reviewDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private PreparedStatement pstmt1;
	private ResultSet rs2;
	
	public reviewDAO() {
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
	

	 public int input_review(String userId, int Dnumber, int rate, String content, int reser_id) {
		   
		   try {
				
				String Query1 = "INSERT INTO review VALUES(NULL, ?, ?, ?, ?, ?)";
				pstmt = conn.prepareStatement(Query1);
				pstmt.setInt(1,Dnumber);
				pstmt.setString(2,userId);
				pstmt.setInt(3,rate);
				pstmt.setString(4, content);
				pstmt.setInt(5, reser_id);
				
				pstmt.executeUpdate();
				return 0;
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			
			return -1;
		   
	   }
	 
	 
	 public String[] select_review(String reser_id) {
		 String SQL ="SELECT * FROM review WHERE reser_id =?";
			String[] review = new String[] {"0","0","0"};
			try {
				pstmt1 = conn.prepareStatement(SQL);
				pstmt1.setInt(1, Integer.parseInt(reser_id));
				rs2 = pstmt1.executeQuery();
				
				if(rs2.next()) {
					review[0] = Integer.toString(rs2.getInt("id"));
					review[1] = Integer.toString(rs2.getInt("rate"));
					review[2] = rs2.getString("content");
							
					
							return review;
				}
				
				
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			return new String[]{"0"};
	 }
	 
	
	
	
}
