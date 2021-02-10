package com.Hotel.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;

import com.Hotel.dto.BookingDTO;

public interface BookingMapper {
	// 예약 삭제
	@Delete("DELETE FROM BOOKING WHERE B_ROCODE=#{b_rocode}")
	public int BookingDel(String b_rocode);

	// 예약 확인
	public int bookingCheck(BookingDTO bookingDTO);

	// MAX bo코드 select
	public String getbocode();
}
