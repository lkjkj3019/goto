package com.Hotel.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class LandmarkDTO {

	private String la_ctcode;
	private String lacode;
	private String laname;
	private String laaddr;
	private MultipartFile laphoto;
	private String laintro;
	private String lafilename;
	private String laaddr_address;
	private String laaddr_detailAddress;
	private String laaddr_extraAddress;
	private String laaddr_postcode;
	public String getLa_ctcode() {
		return la_ctcode;
	}
	public void setLa_ctcode(String la_ctcode) {
		this.la_ctcode = la_ctcode;
	}
	public String getLacode() {
		return lacode;
	}
	public void setLacode(String lacode) {
		this.lacode = lacode;
	}
	public String getLaname() {
		return laname;
	}
	public void setLaname(String laname) {
		this.laname = laname;
	}
	public String getLaaddr() {
		return laaddr;
	}
	public void setLaaddr(String laaddr) {
		this.laaddr = laaddr;
	}
	public MultipartFile getLaphoto() {
		return laphoto;
	}
	public void setLaphoto(MultipartFile laphoto) {
		this.laphoto = laphoto;
	}
	public String getLaintro() {
		return laintro;
	}
	public void setLaintro(String laintro) {
		this.laintro = laintro;
	}
	public String getLafilename() {
		return lafilename;
	}
	public void setLafilename(String lafilename) {
		this.lafilename = lafilename;
	}
	public String getLaaddr_address() {
		return laaddr_address;
	}
	public void setLaaddr_address(String laaddr_address) {
		this.laaddr_address = laaddr_address;
	}
	public String getLaaddr_detailAddress() {
		return laaddr_detailAddress;
	}
	public void setLaaddr_detailAddress(String laaddr_detailAddress) {
		this.laaddr_detailAddress = laaddr_detailAddress;
	}
	public String getLaaddr_extraAddress() {
		return laaddr_extraAddress;
	}
	public void setLaaddr_extraAddress(String laaddr_extraAddress) {
		this.laaddr_extraAddress = laaddr_extraAddress;
	}
	public String getLaaddr_postcode() {
		return laaddr_postcode;
	}
	public void setLaaddr_postcode(String laaddr_postcode) {
		this.laaddr_postcode = laaddr_postcode;
	}
	@Override
	public String toString() {
		return "LandmarkDTO [la_ctcode=" + la_ctcode + ", lacode=" + lacode + ", laname=" + laname + ", laaddr="
				+ laaddr + ", laphoto=" + laphoto + ", laintro=" + laintro + ", lafilename=" + lafilename
				+ ", laaddr_address=" + laaddr_address + ", laaddr_detailAddress=" + laaddr_detailAddress
				+ ", laaddr_extraAddress=" + laaddr_extraAddress + ", laaddr_postcode=" + laaddr_postcode + "]";
	}
	
	
	
}
