package com.fnf.DTO;

public class ProductDTO {
	private int year;
	private String name;
	private int seoul, busan, daegu, incheon, gwangju, daejeon, 
		ulsal, sejong, gyeonggi, gangwon, chungcheongbuk, chungcheongnam,
		jeollabuk, jeollanam, gyeongsangbuk, gyeongsangnam, jeju;
	
	private ProductDTO() {
	}
	
	public ProductDTO(int year, String name, int seoul, int busan, int daegu, int incheon, int gwangju, int daejeon,
			int ulsal, int sejong, int gyeonggi, int gangwon, int chungcheongbuk, int chungcheongnam, int jeollabuk,
			int jeollanam, int gyeongsangbuk, int gyeongsangnam, int jeju) {
		super();
		this.year = year;
		this.name = name;
		this.seoul = seoul;
		this.busan = busan;
		this.daegu = daegu;
		this.incheon = incheon;
		this.gwangju = gwangju;
		this.daejeon = daejeon;
		this.ulsal = ulsal;
		this.sejong = sejong;
		this.gyeonggi = gyeonggi;
		this.gangwon = gangwon;
		this.chungcheongbuk = chungcheongbuk;
		this.chungcheongnam = chungcheongnam;
		this.jeollabuk = jeollabuk;
		this.jeollanam = jeollanam;
		this.gyeongsangbuk = gyeongsangbuk;
		this.gyeongsangnam = gyeongsangnam;
		this.jeju = jeju;
	}

	public int getYear() {
		return year;
	}
	public String getName() {
		return name;
	}
	public int getSeoul() {
		return seoul;
	}
	public int getBusan() {
		return busan;
	}
	public int getDaegu() {
		return daegu;
	}
	public int getIncheon() {
		return incheon;
	}
	public int getGwangju() {
		return gwangju;
	}
	public int getDaejeon() {
		return daejeon;
	}
	public int getUlsal() {
		return ulsal;
	}
	public int getSejong() {
		return sejong;
	}
	public int getGyeonggi() {
		return gyeonggi;
	}
	public int getGangwon() {
		return gangwon;
	}
	public int getChungcheongbuk() {
		return chungcheongbuk;
	}
	public int getChungcheongnam() {
		return chungcheongnam;
	}
	public int getJeollabuk() {
		return jeollabuk;
	}
	public int getJeollanam() {
		return jeollanam;
	}
	public int getGyeongsangbuk() {
		return gyeongsangbuk;
	}
	public int getGyeongsangnam() {
		return gyeongsangnam;
	}
	public int getJeju() {
		return jeju;
	}
	@Override
	public String toString() {
		return "ProductDTO [year=" + year + ", name=" + name + ", seoul=" + seoul + ", busan=" + busan + ", daegu="
				+ daegu + ", incheon=" + incheon + ", gwangju=" + gwangju + ", daejeon=" + daejeon + ", ulsal=" + ulsal
				+ ", sejong=" + sejong + ", gyeonggi=" + gyeonggi + ", gangwon=" + gangwon + ", chungcheongbuk="
				+ chungcheongbuk + ", chungcheongnam=" + chungcheongnam + ", jeollabuk=" + jeollabuk + ", jeollanam="
				+ jeollanam + ", gyeongsangbuk=" + gyeongsangbuk + ", gyeongsangnam=" + gyeongsangnam + ", jeju=" + jeju
				+ "]";
	}
	
}
