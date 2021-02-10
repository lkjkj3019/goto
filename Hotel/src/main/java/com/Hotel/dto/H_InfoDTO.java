package com.Hotel.dto;

import lombok.Data;

@Data
public class H_InfoDTO {

	private String in_hocode;
	private String incode;
	private String inwifi;
	private String inbreak;
	private String inparking;
	private String incin_early;
	private String incout_late;
	private String incin;
	private String incout;
	private String indetail;
	public String getIn_hocode() {
		return in_hocode;
	}
	public void setIn_hocode(String in_hocode) {
		this.in_hocode = in_hocode;
	}
	public String getIncode() {
		return incode;
	}
	public void setIncode(String incode) {
		this.incode = incode;
	}
	public String getInwifi() {
		return inwifi;
	}
	public void setInwifi(String inwifi) {
		this.inwifi = inwifi;
	}
	public String getInbreak() {
		return inbreak;
	}
	public void setInbreak(String inbreak) {
		this.inbreak = inbreak;
	}
	public String getInparking() {
		return inparking;
	}
	public void setInparking(String inparking) {
		this.inparking = inparking;
	}
	public String getIncin_early() {
		return incin_early;
	}
	public void setIncin_early(String incin_early) {
		this.incin_early = incin_early;
	}
	public String getIncout_late() {
		return incout_late;
	}
	public void setIncout_late(String incout_late) {
		this.incout_late = incout_late;
	}
	public String getIncin() {
		return incin;
	}
	public void setIncin(String incin) {
		this.incin = incin;
	}
	public String getIncout() {
		return incout;
	}
	public void setIncout(String incout) {
		this.incout = incout;
	}
	public String getIndetail() {
		return indetail;
	}
	public void setIndetail(String indetail) {
		this.indetail = indetail;
	}
	@Override
	public String toString() {
		return "H_InfoDTO [in_hocode=" + in_hocode + ", incode=" + incode + ", inwifi=" + inwifi + ", inbreak="
				+ inbreak + ", inparking=" + inparking + ", incin_early=" + incin_early + ", incout_late=" + incout_late
				+ ", incin=" + incin + ", incout=" + incout + ", indetail=" + indetail + "]";
	}


}
