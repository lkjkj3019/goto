package com.Hotel.dto;

import lombok.Data;

@Data
public class CityDTO {

	private String ctcode;
	private String ctname;
	private String ctdivide;
	private String ctborough;
	public String getCtcode() {
		return ctcode;
	}
	public void setCtcode(String ctcode) {
		this.ctcode = ctcode;
	}
	public String getCtname() {
		return ctname;
	}
	public void setCtname(String ctname) {
		this.ctname = ctname;
	}
	public String getCtdivide() {
		return ctdivide;
	}
	public void setCtdivide(String ctdivide) {
		this.ctdivide = ctdivide;
	}
	@Override
	public String toString() {
		return "CityDTO [ctcode=" + ctcode + ", ctname=" + ctname + ", ctdivide=" + ctdivide + "]";
	}
	
	
}
