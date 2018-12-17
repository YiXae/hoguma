package com.fnf.DTO;

import java.sql.Date;

public class MemberDTO {	

	private int mno;
	private String mid; 
	private String mnick; 
	private String mpw; 
	private String mname; 
	private String mbirth; 
	private String mgender; 
	private String mphone;
	private String mzipcode;
	private String maddr;
	private String maddrdetail; 
	private Date mregdate;
	private String myakyn;
	private String mpraviteyn;
	private String mlocyn;
	private String mmailingyn;
	private String mdelmemyn;
	private String mlongtermyn;
	private Date mpwupdate;
	private String mphoto;
	private String midopen;
	private String mphoneopen;
	private String mjob;
	private String mintro;
	private int mfilesize;
		
	public MemberDTO() {
		super();
	}

	public MemberDTO(int mno, String mid, String mnick, String mpw, String mname, String mbirth, String mgender,
			String mphone, String mzipcode, String maddr, String maddrdetail, Date mregdate, String myakyn,
			String mpraviteyn, String mlocyn, String mmailingyn, String mdelmemyn, String mlongtermyn, Date mpwupdate,
			String mphoto, String midopen, String mphoneopen, String mjob, String mintro, int mfilesize) {
		super();
		this.mno = mno;
		this.mid = mid;
		this.mnick = mnick;
		this.mpw = mpw;
		this.mname = mname;
		this.mbirth = mbirth;
		this.mgender = mgender;
		this.mphone = mphone;
		this.mzipcode = mzipcode;
		this.maddr = maddr;
		this.maddrdetail = maddrdetail;
		this.mregdate = mregdate;
		this.myakyn = myakyn;
		this.mpraviteyn = mpraviteyn;
		this.mlocyn = mlocyn;
		this.mmailingyn = mmailingyn;
		this.mdelmemyn = mdelmemyn;
		this.mlongtermyn = mlongtermyn;
		this.mpwupdate = mpwupdate;
		this.mphoto = mphoto;
		this.midopen = midopen;
		this.mphoneopen = mphoneopen;
		this.mjob = mjob;
		this.mintro = mintro;
		this.mfilesize = mfilesize;
	}

	public MemberDTO(String mid, String mnick, String mpw, String mname, String mbirth, String mgender, String mphone,
			String mzipcode, String maddr, String maddrdetail, String myakyn, String mpraviteyn,
			String mlocyn, String mmailingyn) {
		super();
		this.mid = mid;
		this.mnick = mnick;
		this.mpw = mpw;
		this.mname = mname;
		this.mbirth = mbirth;
		this.mgender = mgender;
		this.mphone = mphone;
		this.mzipcode = mzipcode;
		this.maddr = maddr;
		this.maddrdetail = maddrdetail;		
		this.myakyn = myakyn;
		this.mpraviteyn = mpraviteyn;
		this.mlocyn = mlocyn;
		this.mmailingyn = mmailingyn;
	}

	public MemberDTO(String mid, String mnick, String mpw, String mphone, String mzipcode, String maddr,
			String maddrdetail) {
		super();
		this.mid = mid;
		this.mnick = mnick;
		this.mpw = mpw;		
		this.mphone = mphone;
		this.mzipcode = mzipcode;
		this.maddr = maddr;
		this.maddrdetail = maddrdetail;
	}

	public MemberDTO(String mnick, String mphoto, String midopen, String mphoneopen, String mjob, String mintro, int mfilesize) {
		super();
		this.mnick = mnick;
		this.mphoto = mphoto;
		this.midopen = midopen;
		this.mphoneopen = mphoneopen;
		this.mjob = mjob;
		this.mintro = mintro;
		this.mfilesize = mfilesize;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMnick() {
		return mnick;
	}

	public void setMnick(String mnick) {
		this.mnick = mnick;
	}

	public String getMpw() {
		return mpw;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMbirth() {
		return mbirth;
	}

	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}

	public String getMgender() {
		return mgender;
	}

	public void setMgender(String mgender) {
		this.mgender = mgender;
	}

	public String getMphone() {
		return mphone;
	}

	public void setMphone(String mphone) {
		this.mphone = mphone;
	}

	public String getMzipcode() {
		return mzipcode;
	}

	public void setMzipcode(String mzipcode) {
		this.mzipcode = mzipcode;
	}

	public String getMaddr() {
		return maddr;
	}

	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}

	public String getMaddrdetail() {
		return maddrdetail;
	}

	public void setMaddrdetail(String maddrdetail) {
		this.maddrdetail = maddrdetail;
	}

	public Date getMregdate() {
		return mregdate;
	}

	public void setMregdate(Date mregdate) {
		this.mregdate = mregdate;
	}

	public String getMyakyn() {
		return myakyn;
	}

	public void setMyakyn(String myakyn) {
		this.myakyn = myakyn;
	}

	public String getMpraviteyn() {
		return mpraviteyn;
	}

	public void setMpraviteyn(String mpraviteyn) {
		this.mpraviteyn = mpraviteyn;
	}

	public String getMlocyn() {
		return mlocyn;
	}

	public void setMlocyn(String mlocyn) {
		this.mlocyn = mlocyn;
	}

	public String getMmailingyn() {
		return mmailingyn;
	}

	public void setMmailingyn(String mmailingyn) {
		this.mmailingyn = mmailingyn;
	}

	public String getMdelmemyn() {
		return mdelmemyn;
	}

	public void setMdelmemyn(String mdelmemyn) {
		this.mdelmemyn = mdelmemyn;
	}

	public String getMlongtermyn() {
		return mlongtermyn;
	}

	public void setMlongtermyn(String mlongtermyn) {
		this.mlongtermyn = mlongtermyn;
	}

	public Date getMpwupdate() {
		return mpwupdate;
	}

	public void setMpwupdate(Date mpwupdate) {
		this.mpwupdate = mpwupdate;
	}

	public String getMphoto() {
		return mphoto;
	}

	public void setMphoto(String mphoto) {
		this.mphoto = mphoto;
	}

	public String getMidopen() {
		return midopen;
	}

	public void setMidopen(String midopen) {
		this.midopen = midopen;
	}

	public String getMphoneopen() {
		return mphoneopen;
	}

	public void setMphoneopen(String mphoneopen) {
		this.mphoneopen = mphoneopen;
	}

	public String getMjob() {
		return mjob;
	}

	public void setMjob(String mjob) {
		this.mjob = mjob;
	}

	public String getMintro() {
		return mintro;
	}

	public void setMintro(String mintro) {
		this.mintro = mintro;
	}
	
	public int getMfilesize() {
		return mfilesize;
	}

	public void setMfilesize(int mfilesize) {
		this.mfilesize = mfilesize;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [mno=" + mno + ", mid=" + mid + ", mnick=" + mnick + ", mpw=" + mpw + ", mname=" + mname
				+ ", mbirth=" + mbirth + ", mgender=" + mgender + ", mphone=" + mphone + ", mzipcode=" + mzipcode
				+ ", maddr=" + maddr + ", maddrdetail=" + maddrdetail + ", mregdate=" + mregdate + ", myakyn=" + myakyn
				+ ", mpraviteyn=" + mpraviteyn + ", mlocyn=" + mlocyn + ", mmailingyn=" + mmailingyn + ", mdelmemyn="
				+ mdelmemyn + ", mlongtermyn=" + mlongtermyn + ", mpwupdate=" + mpwupdate + ", mphoto=" + mphoto
				+ ", midopen=" + midopen + ", mphoneopen=" + mphoneopen + ", mjob=" + mjob + ", mintro=" + mintro
				+ ", mfilesize=" + mfilesize + "]";
	}
}