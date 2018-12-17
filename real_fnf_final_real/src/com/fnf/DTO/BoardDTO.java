package com.fnf.DTO;

import java.util.Date;

public class BoardDTO {
	
	private int bno;
	private String btitle;
	private String bopen;
	private String bitem;
	private String bitema;
	private String bkind;
	private String bmainproduct;
	private String bproduct;
	private String btotalproduct;
	private String bpbirth;
	private int bprice;
	private String bsplace;
	private String bcontent;
	private String bwriter;
	private String bpplace;
	private Date bregdate;
	private int bviewcnt;
	private int breplycnt;
	private int bgoodcnt;
	private String bfilename;
	private int bfilesize;
	private String mphoto;
	
	public BoardDTO() {
		super();
	}
	
	public BoardDTO(int bno, String btitle, String bopen, String bitem, String bitema, String bkind, String bmainproduct,
			String bproduct, String btotalproduct, String bpbirth, int bprice, String bsplace, String bcontent,
			String bwriter, String bpplace, Date bregdate, int bviewcnt, int breplycnt, int bgoodcnt, String bfilename,
			int bfilesize, String mphoto) {
		super();
		this.bno = bno;
		this.btitle = btitle;
		this.bopen = bopen;
		this.bitem = bitem;
		this.bitema = bitema;
		this.bkind = bkind;
		this.bmainproduct = bmainproduct;
		this.bproduct = bproduct;
		this.btotalproduct = btotalproduct;
		this.bpbirth = bpbirth;
		this.bprice = bprice;
		this.bsplace = bsplace;
		this.bcontent = bcontent;
		this.bwriter = bwriter;
		this.bpplace = bpplace;
		this.bregdate = bregdate;
		this.bviewcnt = bviewcnt;
		this.breplycnt = breplycnt;
		this.bgoodcnt = bgoodcnt;
		this.bfilename = bfilename;
		this.bfilesize = bfilesize;
		this.mphoto = mphoto;
	}

	public BoardDTO(String btitle, String bopen, String bitem, String bitema, String bkind, String bmainproduct, String bproduct,
			String btotalproduct, String bpbirth, int bprice, String bsplace, String bcontent, String bwriter,
			String bpplace, String bfilename, int bfilesize) {
		super();
		this.btitle = btitle;
		this.bopen = bopen;
		this.bitem = bitem;
		this.bitema = bitema;
		this.bkind = bkind;
		this.bmainproduct = bmainproduct;
		this.bproduct = bproduct;
		this.btotalproduct = btotalproduct;
		this.bpbirth = bpbirth;
		this.bprice = bprice;
		this.bsplace = bsplace;
		this.bcontent = bcontent;
		this.bwriter = bwriter;
		this.bpplace = bpplace;
		this.bfilename = bfilename;
		this.bfilesize = bfilesize;
	}

	public BoardDTO(int bno, String btitle, String bopen, String bitem, String bitema, String bkind, String bmainproduct,
			String bproduct, String btotalproduct, String bpbirth, int bprice, String bsplace, String bcontent,
			String bwriter, String bpplace, String bfilename, int bfilesize) {
		super();
		this.bno = bno;
		this.btitle = btitle;
		this.bopen = bopen;
		this.bitem = bitem;
		this.bitema = bitema;
		this.bkind = bkind;
		this.bmainproduct = bmainproduct;
		this.bproduct = bproduct;
		this.btotalproduct = btotalproduct;
		this.bpbirth = bpbirth;
		this.bprice = bprice;
		this.bsplace = bsplace;
		this.bcontent = bcontent;
		this.bwriter = bwriter;
		this.bpplace = bpplace;
		this.bfilename = bfilename;
		this.bfilesize = bfilesize;
	}

	public BoardDTO(String btitle, String bopen, String bitem, String bitema, String bkind, String bmainproduct, String bproduct,
			String btotalproduct, String bpbirth, String bsplace, String bcontent, String bwriter, String bpplace,
			String bfilename, int bfilesize) {
		super();
		this.btitle = btitle;
		this.bopen = bopen;
		this.bitem = bitem;
		this.bitema = bitema;
		this.bkind = bkind;
		this.bmainproduct = bmainproduct;
		this.bproduct = bproduct;
		this.btotalproduct = btotalproduct;
		this.bpbirth = bpbirth;
		this.bsplace = bsplace;
		this.bcontent = bcontent;
		this.bwriter = bwriter;
		this.bpplace = bpplace;
		this.bfilename = bfilename;
		this.bfilesize = bfilesize;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBopen() {
		return bopen;
	}

	public void setBopen(String bopen) {
		this.bopen = bopen;
	}

	public String getBitem() {
		return bitem;
	}

	public void setBitem(String bitem) {
		this.bitem = bitem;
	}

	public String getBitema() {
		return bitema;
	}

	public void setBitema(String bitema) {
		this.bitema = bitema;
	}
		
	public String getBkind() {
		return bkind;
	}

	public void setBkind(String bkind) {
		this.bkind = bkind;
	}

	public String getBmainproduct() {
		return bmainproduct;
	}

	public void setBmainproduct(String bmainproduct) {
		this.bmainproduct = bmainproduct;
	}

	public String getBproduct() {
		return bproduct;
	}

	public void setBproduct(String bproduct) {
		this.bproduct = bproduct;
	}

	public String getBtotalproduct() {
		return btotalproduct;
	}

	public void setBtotalproduct(String btotalproduct) {
		this.btotalproduct = btotalproduct;
	}

	public String getBpbirth() {
		return bpbirth;
	}

	public void setBpbirth(String bpbirth) {
		this.bpbirth = bpbirth;
	}

	public int getBprice() {
		return bprice;
	}

	public void setBprice(int bprice) {
		this.bprice = bprice;
	}

	public String getBsplace() {
		return bsplace;
	}

	public void setBsplace(String bsplace) {
		this.bsplace = bsplace;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public String getBwriter() {
		return bwriter;
	}

	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}

	public Date getBregdate() {
		return bregdate;
	}

	public void setBregdate(Date bregdate) {
		this.bregdate = bregdate;
	}

	public int getBviewcnt() {
		return bviewcnt;
	}

	public void setBviewcnt(int bviewcnt) {
		this.bviewcnt = bviewcnt;
	}

	public int getBreplycnt() {
		return breplycnt;
	}

	public void setBreplycnt(int breplycnt) {
		this.breplycnt = breplycnt;
	}

	public int getBgoodcnt() {
		return bgoodcnt;
	}

	public void setBgoodcnt(int bgoodcnt) {
		this.bgoodcnt = bgoodcnt;
	}

	public String getBfilename() {
		return bfilename;
	}

	public void setBfilename(String bfilename) {
		this.bfilename = bfilename;
	}

	public int getBfilesize() {
		return bfilesize;
	}

	public void setBfilesize(int bfilesize) {
		this.bfilesize = bfilesize;
	}

	public String getBpplace() {
		return bpplace;
	}

	public void setBpplace(String bpplace) {
		this.bpplace = bpplace;
	}

	public String getMphoto() {
		return mphoto;
	}

	public void setMphoto(String mphoto) {
		this.mphoto = mphoto;
	}

	@Override
	public String toString() {
		return "BoardDTO [bno=" + bno + ", btitle=" + btitle + ", bopen=" + bopen + ", bitem=" + bitem + ", bitema="
				+ bitema + ", bkind=" + bkind + ", bmainproduct=" + bmainproduct + ", bproduct=" + bproduct
				+ ", btotalproduct=" + btotalproduct + ", bpbirth=" + bpbirth + ", bprice=" + bprice + ", bsplace="
				+ bsplace + ", bcontent=" + bcontent + ", bwriter=" + bwriter + ", bpplace=" + bpplace + ", bregdate="
				+ bregdate + ", bviewcnt=" + bviewcnt + ", breplycnt=" + breplycnt + ", bgoodcnt=" + bgoodcnt
				+ ", bfilename=" + bfilename + ", bfilesize=" + bfilesize + ", mphoto=" + mphoto + "]";
	}
}
