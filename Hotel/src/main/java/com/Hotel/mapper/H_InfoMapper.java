package com.Hotel.mapper;

import com.Hotel.dto.H_InfoDTO;

public interface H_InfoMapper {

	// 호텔 정보 select
	public H_InfoDTO bookingCheck(String hocode);
	
}
