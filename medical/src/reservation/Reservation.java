package reservation;

public class Reservation {
	public int id;
	public String UserId;
	public String Subject;
	public String Dname;
	public String Hname;
	public int whatdate;
	public int time;
	public int condition;
	public int yy;
	public int mm;
	public int dd;
	
	public Reservation(int id, String UserId, int whatdate, int time, int condition, String Dname, String Hname, String Subject, int yy, int mm, int dd) {
		this.id = id;
		this.UserId = UserId;
		this.whatdate = whatdate;
		this.time = time;
		this.condition = condition;
		this.Dname= Dname;
		this.Hname = Hname;
		this.Subject = Subject;
		this.yy = yy;
		this.mm = mm;
		this.dd = dd;
		
	}

	public int getYy() {
		return yy;
	}

	public void setYy(int yy) {
		this.yy = yy;
	}

	public int getMm() {
		return mm;
	}

	public void setMm(int mm) {
		this.mm = mm;
	}

	public int getDd() {
		return dd;
	}

	public void setDd(int dd) {
		this.dd = dd;
	}

	public String getSubject() {
		return Subject;
	}

	public void setSubject(String subject) {
		Subject = subject;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserId() {
		return UserId;
	}

	public void setUserId(String userId) {
		UserId = userId;
	}

	public String getDname() {
		return Dname;
	}

	public void setDname(String dname) {
		Dname = dname;
	}

	public String getHname() {
		return Hname;
	}

	public void setHname(String hname) {
		Hname = hname;
	}

	public int getWhatdate() {
		return whatdate;
	}

	public void setWhatdate(int whatdate) {
		this.whatdate = whatdate;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	public int getCondition() {
		return condition;
	}

	public void setCondition(int condition) {
		this.condition = condition;
	}

	
}
