package com.Hotel.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import com.Hotel.dto.HotelDTO;
import com.Hotel.dto.RoomDTO;

public interface RoomMapper {

	// 방 등록
	public int RoomWrite(RoomDTO roomDTO);
	
	// 방 리스트 select
	public ArrayList<RoomDTO> RoomList(String ALoginId);

	// 방 삭제
	@Delete("DELETE FROM ROOM WHERE ROCODE=#{rocode}")
	public int RoomListDel(String rocode);
	
	// 방 정보 select
	@Select("SELECT * FROM ROOM WHERE ROCODE=#{rocode}")
	public RoomDTO RoomDetail(String rocode);

	// 호텔 이름 select
	public HotelDTO getHotelName(String rocode);
	
	// 방 수정
	int RoomModify(RoomDTO roomDTO);

	// MAX ro코드 select
	public String getrocode();

	// 모든 호텔 이름 select
	public ArrayList<HotelDTO> getAllHotelName(String loginId);

	// 룸 사진 이름 select
	public String getRoomname(String rocode);

}
