package doctor;

public class Doctor {
	
	int Dnumber;
	String subject;
	String Dname;
	int Monam;
	int Monopm; 
	int Tueam;
	int Tuepm; 
	int Wedam; 
	int Wedpm;
	int Thram; 
	int Thrpm; 
	int Friam; 
	int Fripm;
	
	public Doctor(int Dnumber, String subject, String Dname, int Monam, int Monpm, int Tueam, int Tuepm, int Wedam, int Wedpm, int Thram, int Thrpm, int Friam, int Fripm){
		this.Dnumber = Dnumber;
		this.subject = subject;
		this.Dname = Dname;
		this.Monam = Monam;
		this.Monopm = Monpm;
		this.Tueam = Tueam;
		this.Tuepm = Tuepm;
		this.Wedam = Wedam;
		this.Wedpm = Wedpm;
		this.Thram = Thram;
		this.Thrpm = Thrpm;
		this.Friam = Friam;
		this.Fripm = Fripm;
		
	}

	public int getDnumber() {
		return Dnumber;
	}

	public void setDnumber(int dnumber) {
		Dnumber = dnumber;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getDname() {
		return Dname;
	}

	public void setDname(String dname) {
		Dname = dname;
	}

	public int getMonam() {
		return Monam;
	}

	public void setMonam(int monam) {
		Monam = monam;
	}

	public int getMonopm() {
		return Monopm;
	}

	public void setMonopm(int monopm) {
		Monopm = monopm;
	}

	public int getTueam() {
		return Tueam;
	}

	public void setTueam(int tueam) {
		Tueam = tueam;
	}

	public int getTuepm() {
		return Tuepm;
	}

	public void setTuepm(int tuepm) {
		Tuepm = tuepm;
	}

	public int getWedam() {
		return Wedam;
	}

	public void setWedam(int wedam) {
		Wedam = wedam;
	}

	public int getWedpm() {
		return Wedpm;
	}

	public void setWedpm(int wedpm) {
		Wedpm = wedpm;
	}

	public int getThram() {
		return Thram;
	}

	public void setThram(int thram) {
		Thram = thram;
	}

	public int getThrpm() {
		return Thrpm;
	}

	public void setThrpm(int thrpm) {
		Thrpm = thrpm;
	}

	public int getFriam() {
		return Friam;
	}

	public void setFriam(int friam) {
		Friam = friam;
	}

	public int getFripm() {
		return Fripm;
	}

	public void setFripm(int fripm) {
		Fripm = fripm;
	}
	
}
