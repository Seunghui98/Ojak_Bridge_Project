package hospital;

import java.sql.*;
import java.util.ArrayList;

public class HospitalDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private PreparedStatement pstmt1;
	private ResultSet rs2;
	
	public HospitalDAO() {
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
	
	
	public String[] SearchHospital(String hospitalName) {
		System.out.println(hospitalName);
		String SQL ="SELECT Address, Latitude, Longitude, Telephone FROM hospital WHERE Hname =?";
		String[] hospital = new String[] {"0","0","0","0"};
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, hospitalName);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				hospital[0] = rs.getString(1);
				hospital[1] = rs.getString(2);
				hospital[2] = rs.getString(3);
				hospital[3] = rs.getString(4);
				
						
			}
			return hospital;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return new String[]{"0"};
	}
	
	

}
