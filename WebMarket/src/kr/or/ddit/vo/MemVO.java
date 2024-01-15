package kr.or.ddit.vo;

//자바빈 클래스(프로퍼티, 기본생성자, getter/setter메소드)
public class MemVO {
	//프로퍼티
	private String username;
	private String passwored;
	private String enabled;
	//기본생성자
	public MemVO() {}
	//getter/setter메소드
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPasswored() {
		return passwored;
	}
	public void setPasswored(String passwored) {
		this.passwored = passwored;
	}
	public String getEnabled() {
		return enabled;
	}
	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	@Override
	public String toString() {
		return "MemVO [username=" + username + ", passwored=" + passwored + ", enabled=" + enabled + "]";
	}
	
}
