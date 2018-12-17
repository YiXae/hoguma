package com.fnf.DTO;

public class ProductDTO {
	private int year;
	private String name;
	private int seoul, busan, daegu, incheon, gwangju, daejeon, 
		ulsan, sejong, gyeonggi, gangwon, chungcheongbuk, chungcheongnam,
		jeollabuk, jeollanam, gyeongsangbuk, gyeongsangnam, jeju;
	
	private ProductDTO() {
	}
	
	public ProductDTO(int year, String name, int seoul, int busan, int daegu, int incheon, int gwangju, int daejeon,
			int ulsan, int sejong, int gyeonggi, int gangwon, int chungcheongbuk, int chungcheongnam, int jeollabuk,
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
		this.ulsan = ulsan;
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

	public int getulsan() {
		return ulsan;
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

	public void setYear(int year) {
		this.year = year;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setSeoul(int seoul) {
		this.seoul = seoul;
	}

	public void setBusan(int busan) {
		this.busan = busan;
	}

	public void setDaegu(int daegu) {
		this.daegu = daegu;
	}

	public void setIncheon(int incheon) {
		this.incheon = incheon;
	}

	public void setGwangju(int gwangju) {
		this.gwangju = gwangju;
	}

	public void setDaejeon(int daejeon) {
		this.daejeon = daejeon;
	}

	public void setulsan(int ulsan) {
		this.ulsan = ulsan;
	}

	public void setSejong(int sejong) {
		this.sejong = sejong;
	}

	public void setGyeonggi(int gyeonggi) {
		this.gyeonggi = gyeonggi;
	}

	public void setGangwon(int gangwon) {
		this.gangwon = gangwon;
	}

	public void setChungcheongbuk(int chungcheongbuk) {
		this.chungcheongbuk = chungcheongbuk;
	}

	public void setChungcheongnam(int chungcheongnam) {
		this.chungcheongnam = chungcheongnam;
	}

	public void setJeollabuk(int jeollabuk) {
		this.jeollabuk = jeollabuk;
	}

	public void setJeollanam(int jeollanam) {
		this.jeollanam = jeollanam;
	}

	public void setGyeongsangbuk(int gyeongsangbuk) {
		this.gyeongsangbuk = gyeongsangbuk;
	}

	public void setGyeongsangnam(int gyeongsangnam) {
		this.gyeongsangnam = gyeongsangnam;
	}

	public void setJeju(int jeju) {
		this.jeju = jeju;
	}

	@Override
	public String toString() {
		return "ProductDTO [year=" + year + ", name=" + name + ", seoul=" + seoul + ", busan=" + busan + ", daegu="
				+ daegu + ", incheon=" + incheon + ", gwangju=" + gwangju + ", daejeon=" + daejeon + ", ulsan=" + ulsan
				+ ", sejong=" + sejong + ", gyeonggi=" + gyeonggi + ", gangwon=" + gangwon + ", chungcheongbuk="
				+ chungcheongbuk + ", chungcheongnam=" + chungcheongnam + ", jeollabuk=" + jeollabuk + ", jeollanam="
				+ jeollanam + ", gyeongsangbuk=" + gyeongsangbuk + ", gyeongsangnam=" + gyeongsangnam + ", jeju=" + jeju
				+ "]";
	}
	
}
