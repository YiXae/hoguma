package com.fnf.DTO;

public class MapDTO {
	private String bproduct;
	private String bwriter;
	private String bmainproduct;
	private int btotalproduct;
	private String bpplace;
	private String bitem;
	
	public MapDTO() {
		super();
	}

	public MapDTO(String bproduct, String bwriter, String bmainproduct, int btotalproduct, String bpplace,
			String bitem) {
		super();
		this.bproduct = bproduct;
		this.bwriter = bwriter;
		this.bmainproduct = bmainproduct;
		this.btotalproduct = btotalproduct;
		this.bpplace = bpplace;
		this.bitem = bitem;
	}

	public String getBproduct() {
		return bproduct;
	}

	public void setBproduct(String bproduct) {
		this.bproduct = bproduct;
	}

	public String getBwriter() {
		return bwriter;
	}

	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}

	public String getBmainproduct() {
		return bmainproduct;
	}

	public void setBmainproduct(String bmainproduct) {
		this.bmainproduct = bmainproduct;
	}

	public int getBtotalproduct() {
		return btotalproduct;
	}

	public void setBtotalproduct(int btotalproduct) {
		this.btotalproduct = btotalproduct;
	}

	public String getBpplace() {
		return bpplace;
	}

	public void setBpplace(String bpplace) {
		this.bpplace = bpplace;
	}

	public String getBitem() {
		return bitem;
	}

	public void setBitem(String bitem) {
		this.bitem = bitem;
	}

	@Override
	public String toString() {
		return "MapDTO [bproduct=" + bproduct + ", bwriter=" + bwriter + ", bmainproduct=" + bmainproduct
				+ ", btotalproduct=" + btotalproduct + ", bpplace=" + bpplace + ", bitem=" + bitem + "]";
	}
	

	
}
