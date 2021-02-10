package com.Hotel.dto;

import lombok.Data;

@Data
public class PageDTO {

	private int page;
	private int maxpage;
	private int startpage;
	private int endpage;
	private int startrow;
	private int endrow;
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getMaxpage() {
		return maxpage;
	}
	public void setMaxpage(int maxpage) {
		this.maxpage = maxpage;
	}
	public int getStartpage() {
		return startpage;
	}
	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}
	public int getEndpage() {
		return endpage;
	}
	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}
	public int getStartrow() {
		return startrow;
	}
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	public int getEndrow() {
		return endrow;
	}
	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}
	@Override
	public String toString() {
		return "PageDTO [page=" + page + ", maxpage=" + maxpage + ", startpage=" + startpage + ", endpage=" + endpage
				+ ", startrow=" + startrow + ", endrow=" + endrow + "]";
	}
	
	
}
