package com.fnf.DTO;

public class YearTempCropDTO {
	private Integer year;
	private Double temp;
	private Integer crop;
	
	public YearTempCropDTO() {}
	

	public YearTempCropDTO(Integer year, Double temp, Integer crop) {
		super();
		this.year = year;
		this.temp = temp;
		this.crop = crop;
	}


	public Integer getYear() {
		return year;
	}


	public Double getTemp() {
		return temp;
	}


	public Integer getCrop() {
		return crop;
	}


	public void setYear(Integer year) {
		this.year = year;
	}


	public void setTemp(Double temp) {
		this.temp = temp;
	}


	public void setCrop(Integer crop) {
		this.crop = crop;
	}


	@Override
	public String toString() {
		return "YearTempCropDTO [year=" + year + ", temp=" + temp + ", crop=" + crop + "]";
	}
	
}
