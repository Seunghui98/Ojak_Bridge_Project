package reservation;

import java.sql.*;
import java.util.*;

public class ReservationDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	
	private PreparedStatement pstmt2;
	private PreparedStatement pstmt3;
	private PreparedStatement pstmt4;
	private PreparedStatement pstmt5;
	private PreparedStatement pstmt6;
	private PreparedStatement pstmt7;
	private ResultSet rs;
	private ResultSet rs2;
	private ResultSet rs3;
	private ResultSet rs4;
	
	public ReservationDAO() {
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
	
	 public int input_Reservation(String userId, String Dnumber, String whatdate, String time, String yy, String mm, String dd) {
		   
		   try {
				
				String Query2 = "INSERT INTO reservation VALUES(NULL, ?, ?, ?, ?, ?, ?, ?, ?)";
				pstmt2 = conn.prepareStatement(Query2);
				pstmt2.setString(1,userId);
				pstmt2.setInt(2,Integer.parseInt(Dnumber));
				pstmt2.setInt(3,Integer.parseInt(whatdate));
				pstmt2.setInt(4,Integer.parseInt(time));
				pstmt2.setInt(5,1);
				pstmt2.setInt(6,Integer.parseInt(yy));
				pstmt2.setInt(7,Integer.parseInt(mm));
				pstmt2.setInt(8,Integer.parseInt(dd));
				
				pstmt2.executeUpdate();
				return 0;
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			
			return -1;
		   
	   }
	 
	 public int update_reser(int reser_id) {
		   
		   try {
				
				String Query1 = "UPDATE reservation SET condition = ? WHERE id = ?";
				pstmt7 = conn.prepareStatement(Query1);
				pstmt7.setInt(1, 0);
				pstmt7.setInt(2, reser_id);
				
				pstmt7.executeUpdate(Query1);
				return 0;
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			
			return -1;
		   
	   }
	
	 public boolean PossibleTime(int Dnumber, int time, String yy, String mm, String dd) {
		   String SQL1 ="SELECT * FROM reservation WHERE Dnumber =? AND time = ? AND yy = ? AND mm = ? AND dd = ?";
		   
		   try {
				pstmt = conn.prepareStatement(SQL1);
				pstmt.setInt(1, Dnumber);
				pstmt.setInt(2, time);
				pstmt.setInt(3, Integer.parseInt(yy));
				pstmt.setInt(4, Integer.parseInt(mm));
				pstmt.setInt(5, Integer.parseInt(dd));
				rs = pstmt.executeQuery();
				
					if(rs.next()) {
						
						return false;
							   
						   
						   
					
					} 
							
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			return true;
			
		   
	   }
	 
	 public ArrayList<Reservation> ReservationList(String userID) {
		   String SQL1 ="SELECT * FROM reservation WHERE userID = ?";
		   ArrayList<Reservation> reservationList = new ArrayList<Reservation>();
		   try {
				pstmt3 = conn.prepareStatement(SQL1);
				pstmt3.setString(1, userID);
				rs = pstmt3.executeQuery();
			    
					while(rs.next()) {
						String SQL2 ="SELECT Subject, Dname, Hnumber FROM doctor WHERE Dnumber = ?";
						pstmt4 = conn.prepareStatement(SQL2);
						pstmt4.setInt(1, rs.getInt("Dnumber"));
						rs2 = pstmt4.executeQuery();
						System.out.println("오류 1: " + rs.getInt("Dnumber"));
						
						if(rs2.next()) {
							String SQL3 ="SELECT Hname FROM hospital WHERE Hnumber = ?";
							pstmt5 = conn.prepareStatement(SQL3);
							pstmt5.setInt(1, rs2.getInt("Hnumber"));
							System.out.println("오류 2: " + rs2.getInt("Hnumber"));
							rs3 = pstmt5.executeQuery();
							if(rs3.next()) {
								
								Reservation reser = new Reservation(rs.getInt("id"), userID, rs.getInt("whatdate"), rs.getInt("time"), rs.getInt("condition"), rs2.getString(2), rs3.getString(1), rs2.getString(1), rs.getInt("yy"), rs.getInt("mm"), rs.getInt("dd"));
								reservationList.add(reser);
								System.out.println("오류 3: " + rs.getInt("yy"));
							 
							}
						}
						
						
						
							   
						   
						   
					
					} 
					return reservationList;
							
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			return reservationList;
			
		   
	   }

	 public ArrayList<Reservation> ReservationList2(String DnumberID) {
		   String SQL1 ="SELECT * FROM reservation WHERE Dnumber = ?";
		   ArrayList<Reservation> reservationList = new ArrayList<Reservation>();
		   try {
				pstmt3 = conn.prepareStatement(SQL1);
				pstmt3.setInt(1, Integer.parseInt(DnumberID));
				rs = pstmt3.executeQuery();
			    
					while(rs.next()) {
						System.out.println("제발 " + rs.getString("UserId"));
						String SQL2 ="SELECT Subject, Dname, Hnumber FROM doctor WHERE Dnumber = ?";
						pstmt4 = conn.prepareStatement(SQL2);
						pstmt4.setInt(1, rs.getInt("Dnumber"));
						rs2 = pstmt4.executeQuery();
						System.out.println("오류 1: " + rs.getInt("Dnumber"));
						
						if(rs2.next()) {
							String SQL3 ="SELECT Hname FROM hospital WHERE Hnumber = ?";
							pstmt5 = conn.prepareStatement(SQL3);
							pstmt5.setInt(1, rs2.getInt("Hnumber"));
							System.out.println("오류 2: " + rs2.getInt("Hnumber"));
							rs3 = pstmt5.executeQuery();
							if(rs3.next()) {
								String SQL4 ="SELECT userName FROM user WHERE userID = ?";
								System.out.println("범인은 " + rs3.getString("Hname"));
								pstmt6 = conn.prepareStatement(SQL4);
								pstmt6.setString(1, rs.getString("UserId"));
								System.out.println("최종 보스 : " + rs.getString("UserId"));
								rs4 = pstmt6.executeQuery();
								
								if(rs4.next()) {
								System.out.println("예약된 손님은 : " + rs4.getString(1));
								Reservation reser = new Reservation(rs.getInt("id"), rs4.getString(1), rs.getInt("whatdate"), rs.getInt("time"), rs.getInt("condition"), rs2.getString(2), rs3.getString(1), rs2.getString(1), rs.getInt("yy"), rs.getInt("mm"), rs.getInt("dd"));
								reservationList.add(reser);
								System.out.println("오류 3: " + rs.getInt("yy"));
								
								}
							}
						}
						
						
						
							   
						   
						   
					
					} 
					return reservationList;
							
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			return reservationList;
			
		   
	   }
	 
	 
	 public int Cancel(String reservationID) {
		 String SQL1 ="DELETE FROM reservation WHERE id = " + Integer.parseInt(reservationID);
		 try {
			 pstmt6 = conn.prepareStatement(SQL1);
			 
			 pstmt6.executeUpdate(SQL1);
			 return 1;
			 
		 } catch(Exception e) {
			 e.printStackTrace();
		 }
		 return 0;
	 }
	
	
	
}
