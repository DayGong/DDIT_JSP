package kr.or.ddit.vo;

import java.util.Arrays;

// 자바빈(규약을 준수한) 클래스 (프로퍼티 + 기본생성자 + getter/setter)
public class MemberVO {
	private String id;
	private String passwd;
	private String name;
	// phone1 + phone2 + phone3
	private String phone;
	private String gender;
	private String[] hobby;
	private String city;
	private String food;
	
	// 기본 생성자
	public MemberVO() {}

	// getter/setter메소드
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String[] getHobby() {
		return hobby;
	}

	public void setHobby(String[] hobby) {
		this.hobby = hobby;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getFood() {
		return food;
	}

	public void setFood(String food) {
		this.food = food;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", passwd=" + passwd + ", name=" + name + ", phone=" + phone + ", gender="
				+ gender + ", hobby=" + Arrays.toString(hobby) + ", city=" + city + ", food=" + food + "]";
	}
	
}
