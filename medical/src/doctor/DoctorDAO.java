package doctor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DoctorDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	private PreparedStatement pstmt2;
	private ResultSet rs2;
	
	private PreparedStatement pstmt0;
	private ResultSet rs0;
	
	private PreparedStatement pstmt1;
	private ResultSet rs1;
	
	public DoctorDAO() {
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
		String SQL = "SELECT password FROM doctor WHERE Dnumber=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(userID));
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
	
	public int[] CountSubject(String hospitalName) {
		String SQL1 ="SELECT Hnumber FROM hospital WHERE Hname = ?";
		int num[] = new int[] {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
		int i = 0;
		try {
			pstmt0 = conn.prepareStatement(SQL1);
			pstmt0.setString(1, hospitalName);
			rs0 = pstmt0.executeQuery();
			
			if(rs0.next()) {
				String SQL2 = "SELECT COUNT(*) FROM doctor GROUP BY(Subject)";
				System.out.println("병원 코드는 " + rs0.getInt(1));
				pstmt1 = conn.prepareStatement(SQL2);
				rs1 = pstmt1.executeQuery();
				
				while(rs1.next()) {
					num[i] = rs1.getInt(1);
					i++;
					rs1.next();
				} 
				
				return num;
			}
		} catch(Exception e){
			e.printStackTrace();
			
		}
		return new int[]{0, 0};
	}
	
   public int[] PossibleDay(String Dname, int whatdate) {
	   String SQL1 ="SELECT Monam, Monpm, Tueam, Tuepm, Wedam, Wedpm, Thram, Thrpm, Friam, Fripm FROM doctor WHERE Dname =?";
	   int[] possible = new int[] {2,2};
	   try {
			pstmt = conn.prepareStatement(SQL1);
			pstmt.setString(1, Dname);
			rs = pstmt.executeQuery();
			
				if(rs.next()) {
					
					switch(whatdate) {
					   case 2:
						   possible[0]=rs.getInt(1);
						   possible[1]=rs.getInt(2);
						   break;
					   case 3:
						   possible[0]=rs.getInt(3);
						   possible[1]=rs.getInt(4);
						   break;
					   case 4:
						   possible[0]=rs.getInt(5);
						   possible[1]=rs.getInt(6);
						   break;
					   case 5:
						   possible[0]=rs.getInt(7);
						   possible[1]=rs.getInt(8);
						   break;
					   case 6:
						   possible[0]=rs.getInt(9);
						   possible[1]=rs.getInt(10);
						   break;
					   
					   
						   
					   
					   }
				
				} 
						
			return possible;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return new int[]{2,2};
		
	   
   }
   
   public int ToDnumber(String Dname) {
	   String SQL1 ="SELECT Dnumber FROM doctor WHERE Dname =?";
	   
	   try {
			pstmt = conn.prepareStatement(SQL1);
			pstmt.setString(1, Dname);
			rs = pstmt.executeQuery();
			
				if(rs.next()) {
					
					return rs.getInt(1);
					   
						   
					   
					   }
				
				
						
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return 0;
		
	   
   }
	
	
	
	public String[] SearchSubject(String hospitalName) {
		
		String SQL1 ="SELECT Hnumber FROM hospital WHERE Hname =?";
		String[] Subject = new String[] {"0", "0", "0", "0","0", "0","0","0","0","0","0","0","0","0","0","0","0","0","0"
				,"0","0","0","0","0","0","0","0","0","0","0","0"};
		
		int i = 0;
		try {
			pstmt = conn.prepareStatement(SQL1);
			pstmt.setString(1, hospitalName);
			rs = pstmt.executeQuery();
			
			
			
				if(rs.next()) {
				System.out.println(rs.getInt(1));
				String SQL2 = "SELECT DISTINCT Subject FROM doctor WHERE Hnumber="+rs.getInt(1);
				pstmt2 = conn.prepareStatement(SQL2);
				rs2 = pstmt2.executeQuery();
				while(rs2.next()) {
					Subject[i] = rs2.getString("Subject");
					System.out.println(Subject[i]);
					i++;
				} 
						
			}
			return Subject;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return new String[]{"0"};
	}
	
	public ArrayList<Doctor> SubjectDoctor(String Subject, int num) {
		
		String SQL1 ="SELECT Dnumber, Dname, Monam, Monpm, Tueam, Tuepm, Wedam, Wedpm, Thram, Thrpm, Friam, Fripm FROM doctor WHERE subject =?";
		ArrayList<Doctor> doctorlist = new ArrayList<Doctor>(num);
		
		
		int i = 0;
		try {
			pstmt = conn.prepareStatement(SQL1);
			pstmt.setString(1, Subject);
			rs = pstmt.executeQuery();
			
			
			
				while(rs.next()) {
				System.out.println(rs.getInt(1));
					Doctor doc = new Doctor(rs.getInt(1), Subject, rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), rs.getInt(7),
							rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getInt(11), rs.getInt(12));
					
					doctorlist.add(doc);
					System.out.println(doc.getDname());
				} 
						
			
			return doctorlist;
		} catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("어디가 잘못이");
		return doctorlist;
	}
	
	
}
