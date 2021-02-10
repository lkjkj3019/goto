package com.Hotel.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class RoomDTO {

	private String ro_hocode;
	private String rocode;
	private String roname;
	private MultipartFile rophoto;
	private String rodetail;
	private int rominper;
	private int romaxper;
	private int roprice;
	private int ronum;
	private String rofilename;
	
	public String getRo_hocode() {
		return ro_hocode;
	}
	public void setRo_hocode(String ro_hocode) {
		this.ro_hocode = ro_hocode;
	}
	public String getRocode() {
		return rocode;
	}
	public void setRocode(String rocode) {
		this.rocode = rocode;
	}
	public String getRoname() {
		return roname;
	}
	public void setRoname(String roname) {
		this.roname = roname;
	}
	public MultipartFile getRophoto() {
		return rophoto;
	}
	public void setRophoto(MultipartFile rophoto) {
		this.rophoto = rophoto;
	}
	public String getRodetail() {
		return rodetail;
	}
	public void setRodetail(String rodetail) {
		this.rodetail = rodetail;
	}
	public int getRominper() {
		return rominper;
	}
	public void setRominper(int rominper) {
		this.rominper = rominper;
	}
	public int getRomaxper() {
		return romaxper;
	}
	public void setRomaxper(int romaxper) {
		this.romaxper = romaxper;
	}
	public int getRoprice() {
		return roprice;
	}
	public void setRoprice(int roprice) {
		this.roprice = roprice;
	}
	public int getRonum() {
		return ronum;
	}
	public void setRonum(int ronum) {
		this.ronum = ronum;
	}
	public String getRofilename() {
		return rofilename;
	}
	public void setRofilename(String rofilename) {
		this.rofilename = rofilename;
	}
	@Override
	public String toString() {
		return "RoomDTO [ro_hocode=" + ro_hocode + ", rocode=" + rocode + ", roname=" + roname + ", rophoto=" + rophoto
				+ ", rodetail=" + rodetail + ", rominper=" + rominper + ", romaxper=" + romaxper + ", roprice="
				+ roprice + ", ronum=" + ronum + ", rofilename=" + rofilename + "]";
	}
	
	
}
