package com.fnf.DTO;

public class YearTempCropDTO {
	private int year, temp, crop;
	
	public YearTempCropDTO() {}
	public YearTempCropDTO(int year, int temp, int crop) {
		this.year = year;
		this.temp = temp;
		this.crop = crop;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getTemp() {
		return temp;
	}

	public void setTemp(int temp) {
		this.temp = temp;
	}

	public int getCrop() {
		return crop;
	}

	public void setCrop(int crop) {
		this.crop = crop;
	}

	@Override
	public String toString() {
		return "YearTempCropDTO [year=" + year + ", temp=" + temp + ", crop=" + crop + "]";
	}
	
}
