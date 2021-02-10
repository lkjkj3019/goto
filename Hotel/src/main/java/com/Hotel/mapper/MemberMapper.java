package com.Hotel.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.Hotel.dto.MemberDTO;
import com.Hotel.dto.PageDTO;
import com.Hotel.dto.ReviewDTO;

public interface MemberMapper {

	// 회원 로그인
	public String MemberLogin(MemberDTO memberDTO);

	// 예약 개수 select
	int bookingListCnt(String loginId);

	// 나의 예약 리스트 select
	List<Map<String, Object>> c_myBookingList(Map<String, Object> pageAndId);

	// 예약 삭제
	int deleteBooking(String bcode);

	// 관리자 회원 리스트
	ArrayList<MemberDTO> a_memberList();

	// 관리자 회원 삭제
	int a_memberDelete(MemberDTO memberDTO);

	// 리뷰 history 삭제
	void a_delHistory(MemberDTO memberDTO);

	// 로그인 된 아이디로 작성한 리뷰 select
	ArrayList<String> getvcode(MemberDTO memberDTO);

	// 리뷰 삭제
	void a_delReview(MemberDTO memberDTO);

	// 리뷰에 연관된 history 삭제
	void a_delHistoryVcode(String vcode);

	// 예약 삭제
	void a_delBooking(MemberDTO memberDTO);

	// 찜 삭제
	void a_delHeart(MemberDTO memberDTO);

	// 1대1문의 삭제
	void a_delHelp(MemberDTO memberDTO);

	// 회원 정보 select
	public MemberDTO bookingCheck(String mcode);

	// 회원가입
	public int joinMember(MemberDTO memberDTO);

	// 아이디 중복 확인
	public String idCheck(String mid);

	// MAX M코드 select
	public String getMcode();

	//	회원정보 가져오기
	MemberDTO selectMembers(String loginId);

	//	회원정보 수정
	int updateMembers(Map<String, Object> memberMap);

	// 회원 삭제
	int c_memberDelete(MemberDTO memberDTO);

	// 찜목록 출력
	public List<Map<String, Object>> heartList(Map<String, Object> map);

	// 찜삭제
	public int heartDelete(String htcode);

	// 찜목록 페이징
	public int getHeartListCnt(String htid);

	// 아이디 찾기
	public String findLogin(MemberDTO memberDTO);

	// 비밀번호 찾기
	public String findPassword(MemberDTO memberDTO);

	// 나의 리뷰 리스트 select
	public ArrayList<String> getReviewList(String loginId);

	// 로그인 api 가입확인
	public String checkKakaoJoin(String userId);

	// kakao 회원가입
	public int kakaoJoin(MemberDTO memberDTO);

	// 비밀번호 select
	public String getMpassword(String userId);
}
