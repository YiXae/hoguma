package com.fnf.DTO;

public class CriteriaDTO {
	
	private int page; //페이지 번호(하단의 번호들 클릭)
	private int perPageNum; //한페이지에 보여줄 게시글 수
	private String keyword;
	private String flag;
	private String bitem;
	private String code;
	private String bopen;
	private String bkind;
	private String bregdate;
	private String mnick;
	private String bwriter;
	
	public CriteriaDTO() {
		this.page=1;
		this.perPageNum=20;
	}

	public CriteriaDTO(int page, int perPageNum, String keyword, String flag, String bitem, String code, String bopen, String bkind, String bregdate, String bwriter, String mnick) {
		super();
		this.page = page;
		this.perPageNum = perPageNum;
		this.keyword = keyword;
		this.flag = flag;
		this.bitem = bitem;
		this.code = code;
		this.bopen = bopen;
		this.bkind = bkind;
		this.bregdate = bregdate;
		this.bwriter = bwriter;
		this.mnick = mnick;
		
	}

	public CriteriaDTO(int page, int perPageNum, String keyword) {
		super();
		this.page = page;
		this.perPageNum = perPageNum;
		this.keyword = keyword;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page <=0) {
			this.page =1;
			return;
		}
		this.page = page;
	}

	//method for MyBatis SQL Mapper: 조회 시작 row 취득하는 메서드
	public int getPageStart() {
		return (((this.page - 1) * perPageNum) +1 );
	}
	
	//method for MyBatis SQL Mapper: 조회 마지막 row취득하는 메서드
	public int getPerPageNum() {
		return this.page * perPageNum;
		//2페이지 x 10 =20 번 게시글까지 출력
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	public String getBitem() {
		return bitem;
	}

	public void setBitem(String bitem) {
		this.bitem = bitem;
	}

	public String getBopen() {
		return bopen;
	}

	public void setBopen(String bopen) {
		this.bopen = bopen;
	}
	
	public String getBkind() {
		return bkind;
	}

	public void setBkind(String bkind) {
		this.bkind = bkind;
	}

	public String getBregdate() {
		return bregdate;
	}

	public void setBregdate(String bregdate) {
		this.bregdate = bregdate;
	}

	public String getMnick() {
		return mnick;
	}

	public void setMnick(String mnick) {
		this.mnick = mnick;
	}

	public String getBwriter() {
		return bwriter;
	}

	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}

	@Override
	public String toString() {
		return "CriteriaDTO [page=" + page + ", perPageNum=" + perPageNum + ", keyword=" + keyword + ", flag=" + flag
				+ ", bitem=" + bitem + ", code=" + code + ", bopen=" + bopen + ", bkind=" + bkind + ", bregdate="
				+ bregdate + ", mnick=" + mnick + ", bwriter=" + bwriter + "]";
	}	
}