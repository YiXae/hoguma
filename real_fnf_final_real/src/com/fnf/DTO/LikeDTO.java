package com.fnf.DTO;

public class LikeDTO {

	private int likeno;
    private int bno;
    private int mno;
    private int like_check;

    public LikeDTO() {
		super();
	}

	public LikeDTO(int likeno, int bno, int mno, int like_check) {
		super();
		this.likeno = likeno;
		this.bno = bno;
		this.mno = mno;
		this.like_check = like_check;
	}

	public int getLikeno() {
		return likeno;
	}

	public void setLikeno(int likeno) {
		this.likeno = likeno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getLike_check() {
		return like_check;
	}

	public void setLike_check(int like_check) {
		this.like_check = like_check;
	}

	@Override
	public String toString() {
		return "LikeDTO [likeno=" + likeno + ", bno=" + bno + ", mno=" + mno + ", like_check=" + like_check + "]";
	}
}
