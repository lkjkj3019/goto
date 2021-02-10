package com.Hotel.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class HotelDTO {

	private String ho_ctcode;
	private String hocode;
	private String honame;
	private MultipartFile hophoto;
	private String hoaddr;
	private float hoscore;
	private String hopublicize;
	private String hofileName;
	private String ho_cid;
	private String hopost;   //우편번호
	private String hoaddress;   //주소
	private String hoexaddr;  //참고항목
	private String hodetail; //상세주소
	private int hohit;
	private int hototalhit;
	
	public String getHo_ctcode() {
		return ho_ctcode;
	}
	public void setHo_ctcode(String ho_ctcode) {
		this.ho_ctcode = ho_ctcode;
	}
	public String getHocode() {
		return hocode;
	}
	public void setHocode(String hocode) {
		this.hocode = hocode;
	}
	public String getHoname() {
		return honame;
	}
	public void setHoname(String honame) {
		this.honame = honame;
	}
	public MultipartFile getHophoto() {
		return hophoto;
	}
	public void setHophoto(MultipartFile hophoto) {
		this.hophoto = hophoto;
	}
	public String getHoaddr() {
		return hoaddr;
	}
	public void setHoaddr(String hoaddr) {
		this.hoaddr = hoaddr;
	}
	public float getHoscore() {
		return hoscore;
	}
	public void setHoscore(float hoscore) {
		this.hoscore = hoscore;
	}
	public String getHopublicize() {
		return hopublicize;
	}
	public void setHopublicize(String hopublicize) {
		this.hopublicize = hopublicize;
	}
	public String getHofileName() {
		return hofileName;
	}
	public void setHofileName(String hofileName) {
		this.hofileName = hofileName;
	}
	public String getHo_cid() {
		return ho_cid;
	}
	public void setHo_cid(String ho_cid) {
		this.ho_cid = ho_cid;
	}
	public String getHopost() {
		return hopost;
	}
	public void setHopost(String hopost) {
		this.hopost = hopost;
	}
	public String getHoaddress() {
		return hoaddress;
	}
	public void setHoaddress(String hoaddress) {
		this.hoaddress = hoaddress;
	}
	public String getHoexaddr() {
		return hoexaddr;
	}
	public void setHoexaddr(String hoexaddr) {
		this.hoexaddr = hoexaddr;
	}
	public String getHodetail() {
		return hodetail;
	}
	public void setHodetail(String hodetail) {
		this.hodetail = hodetail;
	}
	public int getHohit() {
		return hohit;
	}
	public void setHohit(int hohit) {
		this.hohit = hohit;
	}
	public int getHototalhit() {
		return hototalhit;
	}
	public void setHototalhit(int hototalhit) {
		this.hototalhit = hototalhit;
	}
	@Override
	public String toString() {
		return "HotelDTO [ho_ctcode=" + ho_ctcode + ", hocode=" + hocode + ", honame=" + honame + ", hophoto=" + hophoto
				+ ", hoaddr=" + hoaddr + ", hoscore=" + hoscore + ", hopublicize=" + hopublicize + ", hofileName="
				+ hofileName + ", ho_cid=" + ho_cid + ", hopost=" + hopost + ", hoaddress=" + hoaddress + ", hoexaddr="
				+ hoexaddr + ", hodetail=" + hodetail + ", hohit=" + hohit + ", hototalhit=" + hototalhit + "]";
	}


}
