package list;

import java.sql.Date;

public class ListDTO {
	private String idx;
	private String g_name;
	private String explanation;
	private String visit;
	private Date madeDate;
	private String url;
	private String image;
	private String id;
	
	public ListDTO() {
		super();
	}

	public ListDTO(String idx, String g_name, String explanation, String visit, Date madeDate, String url, String image,
			String id) {
		super();
		this.idx = idx;
		this.g_name = g_name;
		this.explanation = explanation;
		this.visit = visit;
		this.madeDate = madeDate;
		this.url = url;
		this.image = image;
		this.id = id;
	}

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
	}

	public String getExplanation() {
		return explanation;
	}

	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}

	public String getVisit() {
		return visit;
	}

	public void setVisit(String visit) {
		this.visit = visit;
	}

	public Date getMadedate() {
		return madeDate;
	}

	public void setMadedate(Date madeDate) {
		this.madeDate = madeDate;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
}
