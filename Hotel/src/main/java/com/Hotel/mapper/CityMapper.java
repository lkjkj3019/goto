package com.Hotel.mapper;

import com.Hotel.dto.CityDTO;

public interface CityMapper {

	// 예약 확인
	public CityDTO bookingCheck(String ctcode);
 
	// ct코드 select
	String getCtcode(CityDTO cityDTO);
}
