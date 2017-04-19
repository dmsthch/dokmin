package dokmin.library.dto;

public class Member {
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_birth;
	private String member_phone;
	private String member_addr;
	private String member_level;
	private int member_limit;
	private int member_overdueno;
	private int member_rentalno;


	
	public int getMember_limit() {
		return member_limit;
	}
	public void setMember_limit(int member_limit) {
		this.member_limit = member_limit;
	}
	public int getMember_overdueno() {
		return member_overdueno;
	}
	public void setMember_overdueno(int member_overdueno) {
		this.member_overdueno = member_overdueno;
	}
	public int getMember_rentalno() {
		return member_rentalno;
	}
	public void setMember_rentalno(int member_rentalno) {
		this.member_rentalno = member_rentalno;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_addr() {
		return member_addr;
	}
	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}
	public String getMember_level() {
		return member_level;
	}
	public void setMember_level(String member_level) {
		this.member_level = member_level;
	}
}
