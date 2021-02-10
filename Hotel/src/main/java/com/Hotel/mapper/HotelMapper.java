package com.Hotel.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;

import com.Hotel.dto.CityDTO;
import com.Hotel.dto.H_InfoDTO;
import com.Hotel.dto.HeartDTO;
import com.Hotel.dto.HotelDTO;
import com.Hotel.dto.RoomDTO;

public interface HotelMapper {

	// hotelList의 개수 selete
	int getHotelListCnt(Map<String, Object> map);

	// 메인페이지 검색, 호텔리스트 side바 검색, 메인 메뉴 호텔버튼을 눌렀을때 hotelList.jsp로 넘어가기 위한 정보
	List<Map<String, Object>> c_HotelList(Map map);

	// 호텔 정보 select
	H_InfoDTO getHotelInfo(String hocode);

	// 방 리스트 select
	ArrayList<RoomDTO> c_RoomList(String hocode);

	// 호텔 정보 select
	HotelDTO gethotel(String hocode);

	// 호텔 점수 update
	int updateScore(String hocode);

	// 호텔 점수 select
	float getHoscroe(String hocode);

	// 관리자 호텔 리스트 select
	ArrayList<HotelDTO> a_hotelList(String loginId);

	// 로그인된 아이디의 비밀번호 select
	String getPw(String loginId);

	// 방 삭제
	void deleteRoom(String hocode);

	// 호텔 삭제
	int deleteHotel(String hocode);

	// 찜 리스트 select
	ArrayList<HeartDTO> getHeartList(String loginId);

	// MAX ht 코드 select
	String getHtcode();

	// 찜 등록
	int insertHeart(HeartDTO heartDTO);

	// 찜 삭제
	int deleteHeart(HeartDTO heartDTO);
	
	// 호텔 검색
	List<Map<String, Object>> searchHotel(Map<String, Object> map);

	// 호텔 개수 select
	int getHotelCount(String search);

	// 호텔 정보 select
	public int hotelInfoForm(Map<String, Object> map);

	// MAX ho코드 select
	public String hoMaxNum();

	// MAX in코드 select
	public String inMaxNum();

	// 호텔 정보 수정
	public int updateIndetail(H_InfoDTO h_infoDTO);

	// 도시 지역 select
	public ArrayList<String> getCtborough(CityDTO cityDTO);

	// 호텔 조회수 0으로 만들기
	int updateHitZero();

	// 호텔 조회수 1 올리기
	int updateHit(String hocode);

	// 호텔 조회수 select
	ArrayList<HotelDTO> gethitList(String loginId);

	// 호텔 사진 이름 select
	String getHotelFilename(String hocode);

	// 방 사진 이름 select
	String[] getRoomFilename(String hocode);

	// history 삭제
	@Delete("DELETE FROM HISTORY WHERE HI_VCODE IN (SELECT VCODE FROM REVIEW, HOTEL WHERE HOCODE = V_HOCODE AND HOCODE = #{hocode})")
	void deleteHistory(String hocode);

	// 리뷰 삭제
	@Delete("DELETE FROM REVIEW WHERE V_HOCODE=#{hocode}")
	void deleteReview(String hocode);

	// 찜 삭제
	@Delete("DELETE FROM HEART WHERE HT_HOCODE=#{hocode}")
	void deleteHeartHotel(String hocode);
	
	// 호텔정보 삭제
	@Delete("DELETE FROM H_INFO WHERE IN_HOCODE=#{hocode}")
	void deleteH_Info(String hocode);

	// 예약 삭제
	@Delete("DELETE FROM BOOKING WHERE B_HOCODE=#{hocode}")
	void deleteBooking(String hocode);



}
