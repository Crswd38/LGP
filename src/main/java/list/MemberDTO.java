package list;

public class MemberDTO {
	private String idx;
	private String id;
	private String name;
	private String pw;
	private String profile;
	
	public MemberDTO() {
		super();
	}

	public MemberDTO(String idx, String id, String name, String pw, String profile) {
		super();
		this.idx = idx;
		this.id = id;
		this.name = name;
		this.pw = pw;
		this.profile = profile;
	}

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}
	
}
