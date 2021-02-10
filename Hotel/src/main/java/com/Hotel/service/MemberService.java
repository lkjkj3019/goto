package com.Hotel.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Hotel.dto.BookingDTO;
import com.Hotel.dto.CityDTO;
import com.Hotel.dto.H_InfoDTO;
import com.Hotel.dto.HotelDTO;
import com.Hotel.dto.MemberDTO;
import com.Hotel.dto.PageDTO;
import com.Hotel.dto.RoomDTO;
import com.Hotel.mapper.BookingMapper;
import com.Hotel.mapper.CityMapper;
import com.Hotel.mapper.CompanyMapper;
import com.Hotel.mapper.H_InfoMapper;
import com.Hotel.mapper.HotelMapper;
import com.Hotel.mapper.MemberMapper;
import com.Hotel.mapper.RoomMapper;

@Service
public class MemberService {

	@Autowired
	private MemberMapper memberMapper;

	@Autowired
	private CompanyMapper companyMapper;

	@Autowired
	private CityMapper cityMapper;

	@Autowired
	private HotelMapper hotelMapper;

	@Autowired
	private H_InfoMapper h_infoMapper;

	@Autowired
	private RoomMapper roomMapper;

	@Autowired
	private BookingMapper bookingMapper;

	@Autowired
	private HttpSession session;

	private ModelAndView mav;

	// 회원로그인부분
	public ModelAndView MemberLogin(MemberDTO memberDTO) {
		mav = new ModelAndView();

		// 회원로그인 session값 MLoginId
		String MLoginId = memberMapper.MemberLogin(memberDTO);
		System.out.println("MLoginId:::" + MLoginId);
		session.setAttribute("MLoginId", MLoginId);

		// 회원아이디 값이 null이 아니면 메인으로
		String result;
		if (MLoginId != null) {
			mav.setViewName("index");
			result = "OK";
		} else {
			mav.setViewName("member/MemberLoginForm");
			result = "NO";
		}
		mav.addObject("loginResult", result);
		return mav;
	}

	// 나의 예약 리스트
	public ModelAndView c_myBookingList(int page) {
		mav = new ModelAndView();
		String loginId = (String) session.getAttribute("MLoginId");

		// 페이징 처리
		PageDTO pageDTO = new PageDTO();
		int pageLimit = 5;
		int pageNumLimit = 3;
		int startRow = (page - 1) * pageLimit + 1;
		int endRow = page * pageLimit;
		pageDTO.setStartrow(startRow);
		pageDTO.setEndrow(endRow);
		int bookingListCnt = memberMapper.bookingListCnt(loginId);
		int maxPage = (int) (Math.ceil((double) bookingListCnt / pageLimit));
		int startPage = (int) ((Math.ceil((double) page / pageNumLimit)) - 1) * pageNumLimit + 1;
		int endPage = startPage + pageNumLimit - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		pageDTO.setPage(page);
		pageDTO.setStartpage(startPage);
		pageDTO.setEndpage(endPage);
		pageDTO.setMaxpage(maxPage);

		Map<String, Object> pageAndId = new HashMap<String, Object>();
		pageAndId.put("pageDTO", pageDTO);
		pageAndId.put("loginId", loginId);

		// 예약 리스트 select
		List<Map<String, Object>> bookingList = memberMapper.c_myBookingList(pageAndId);
		System.out.println(bookingList);

		// 리뷰 리스트 select
		ArrayList<String> bcodeList = memberMapper.getReviewList(loginId);

		mav.addObject("bcodeList", bcodeList);
		mav.addObject("pageDTO", pageDTO);
		mav.addObject("bookingList", bookingList);
		mav.setViewName("member/c_myBookingList");
		return mav;
	}

	// 예약 삭제
	public String deleteBooking(String bcode) {
		// 예약 삭제
		int deleteResult = memberMapper.deleteBooking(bcode);
		String result = "NO";
		if (deleteResult > 0) {
			result = "OK";
		}
		return result;
	}

	// 관리자 회원 리스트
	public ModelAndView a_memberList() {
		mav = new ModelAndView();
		// 회원리스트
		ArrayList<MemberDTO> memberList = memberMapper.a_memberList();
		String ALoginId = (String) session.getAttribute("ALoginId");
		String loginPw = companyMapper.getloginPw(ALoginId);

		mav.addObject("loginPw", loginPw);
		mav.addObject("memberList", memberList);
		mav.setViewName("member/a_memberList");
		return mav;
	}

	// 관리자 회원 삭제
	@Transactional(rollbackFor = { Exception.class }) // delete중 하나라도 오류가 날 시 rollback
	public String a_memberDelete(MemberDTO memberDTO) {
		// member에 연결된 테이블에서 정보 삭제
		memberMapper.a_delHistory(memberDTO); // member가 review에 좋아요를 누른 내역 삭제
		ArrayList<String> vcodeList = memberMapper.getvcode(memberDTO); // member가 작성한 모든 review의 vcode를 가져오기
		for (String i : vcodeList) {
			memberMapper.a_delHistoryVcode(i); // member가 작성한 review에 달려있는 좋아요 내역을 모두 삭제
		}
		memberMapper.a_delReview(memberDTO); // member가 작성한 review 삭제
		memberMapper.a_delBooking(memberDTO); // member가 예약한 내역 삭제
		memberMapper.a_delHeart(memberDTO); // member의 찜 목록 삭제
		memberMapper.a_delHelp(memberDTO); // member가 남긴 1대1문의 목록 삭제

		int deleteResult = memberMapper.a_memberDelete(memberDTO); // member 삭제
		String result = "NO";
		if (deleteResult > 0) {
			result = "OK";
		}
		return result;
	}

	// 에약 확인 폼
	public ModelAndView bookingCheckForm(BookingDTO bookingDTO) {
		mav = new ModelAndView();

		// 고객 정보 select
		String loginid = (String) session.getAttribute("MLoginId");
		System.out.println("loginid : " + loginid);
		MemberDTO memberDTO = memberMapper.bookingCheck(loginid);
		System.out.println(memberDTO.getMid());

		// 방 정보 select
		String rocode = bookingDTO.getB_rocode();
		System.out.println("rocode : " + rocode);
		RoomDTO roomDTO = roomMapper.RoomDetail(rocode);
		System.out.println(roomDTO.getRocode());

		// 호텔 정보 select
		String hocode = roomDTO.getRo_hocode();
		System.out.println("hocode : " + hocode);
		HotelDTO hotelDTO = hotelMapper.gethotel(hocode);
		H_InfoDTO h_infoDTO = h_infoMapper.bookingCheck(hocode);
		System.out.println(h_infoDTO.getIncin());

		// 도시 정보 select
		String ctcode = hotelDTO.getHo_ctcode();
		System.out.println("ctcode : " + ctcode);
		CityDTO cityDTO = cityMapper.bookingCheck(ctcode);
		System.out.println(cityDTO.getCtname());

		// 방 코드 만들기
		String getBocode = bookingMapper.getbocode();
		String bocode;
		if (getBocode == null)
			getBocode = "BO000";
		int bocodeNum = Integer.parseInt(getBocode.substring(2, 5)) + 1; // bocode + 1
		if (bocodeNum < 10) {
			bocode = "BO" + "00" + bocodeNum;
		} else if (bocodeNum < 100) {
			bocode = "BO" + "0" + bocodeNum;
		} else {
			bocode = "BO" + bocodeNum;
		}
		System.out.println(bocode);
		bookingDTO.setBcode(bocode);

		mav.addObject("hoCheck", hotelDTO);
		mav.addObject("boCheck", bookingDTO);
		mav.addObject("mCheck", memberDTO);
		mav.addObject("ctCheck", cityDTO);
		mav.addObject("inCheck", h_infoDTO);
		mav.addObject("roCheck", roomDTO);
		mav.setViewName("member/bookingCheck");

		return mav;
	}

	// 예약 등록
	public ModelAndView bookingCheck(BookingDTO bookingDTO) {
		mav = new ModelAndView();

		// 예약 등록
		int checkResult = bookingMapper.bookingCheck(bookingDTO);

		if (checkResult > 0) {
			String result = "OK";
			mav.addObject("bookingesult", result);
		}

		mav.setViewName("index");

		return mav;
	}

	// 아이디 중복 확인
	public String idCheck(String inputMid) {

		// 아이디 중복 확인
		String idCheck = memberMapper.idCheck(inputMid);

		String checkResult = null;
		if (idCheck == null) {
			checkResult = "OK";
		} else {
			checkResult = "NO";
		}

		return checkResult;
	}

	// 고객 회원가입
	public ModelAndView joinMember(MemberDTO memberDTO, RedirectAttributes ra) {
		System.out.println("service::joinMember");
		mav = new ModelAndView();

		// 전체 이메일
		memberDTO.setMemail(memberDTO.getMemailid() + "@" + memberDTO.getMemaildomain());

		// M코드 만들기
		String getMcode = memberMapper.getMcode();
		String mcode;
		if (getMcode == null)
			getMcode = "ME000";
		int mcodeNum = Integer.parseInt(getMcode.substring(2, 5)) + 1;
		if (mcodeNum < 10) {
			mcode = "ME" + "00" + mcodeNum;
		} else if (mcodeNum < 100) {
			mcode = "ME" + "0" + mcodeNum;
		} else {
			mcode = "ME" + mcodeNum;
		}

		System.out.println("code");

		memberDTO.setMcode(mcode);

		// memberDTO.setMcode();
		// 회원가입 되고 홈으로(메인으로 넘어가는 것)
		int insertResult = memberMapper.joinMember(memberDTO);
		if (insertResult > 0) {
			String msg = memberDTO.getMid() + " 님 가입되었습니다.";
			mav.addObject("msg", msg);
		}

		System.out.println("insertResult::" + insertResult);

		mav.setViewName("member/MemberLoginForm");
		return mav;
	}

//	회원정보 가져오기
	public ModelAndView selectMembers() {
		mav = new ModelAndView();
		String loginId = (String) session.getAttribute("MLoginId");

		// 회원 정보 select
		MemberDTO memberDTO = memberMapper.selectMembers(loginId);
		mav.setViewName("help/c_mypage");
		mav.addObject("memberDTO", memberDTO);
		return mav;
	}

//	회원정보 수정
	public String updateMembers(MemberDTO memberdto) {
		mav = new ModelAndView();
		String loginId = (String) session.getAttribute("MLoginId");

		Map<String, Object> memberMap = new HashMap<String, Object>();
		memberMap.put("memberdto", memberdto);
		memberMap.put("loginId", loginId);
		// 회원 수정
		int result = memberMapper.updateMembers(memberMap);
		String modifyResult = "NO";
		if (result > 0) {
			modifyResult = "OK";
		}
		return modifyResult;
	}

//	회원 탈퇴
	@Transactional(rollbackFor = Exception.class)
	public String delMembers(MemberDTO memberDTO) {
		// 좋아요 history 삭제
		memberMapper.a_delHistory(memberDTO);

		// 리뷰 삭제
		ArrayList<String> vcodeList = memberMapper.getvcode(memberDTO);
		for (String i : vcodeList) {
			memberMapper.a_delHistoryVcode(i);
		}
		memberMapper.a_delReview(memberDTO);

		// 예약 삭제
		memberMapper.a_delBooking(memberDTO);

		// 찜 삭제
		memberMapper.a_delHeart(memberDTO);

		// 회원 삭제
		int result = memberMapper.c_memberDelete(memberDTO);
		String sesultSet;
		if (result > 0) {
			sesultSet = "OK";
		} else {
			sesultSet = "NO";
		}
		return sesultSet;
	}

	// 찜목록 출력+찜목록 페이징
	public ModelAndView heartList(HotelDTO hotelDTO, int page) {
		mav = new ModelAndView();
		String htid = (String) session.getAttribute("MLoginId");

		// 1페 보여지는 찜수, 페이지번호수
		int pageLimit = 3;
		int pageNumLimit = 2;

		// 1페이지에 보여지는 첫페, 끝페
		int startRow = (page - 1) * pageLimit + 1;
		int endRow = page * pageLimit;

		// 찜목록 첫찜, 막찜
		PageDTO pagedto = new PageDTO();
		pagedto.setStartrow(startRow);
		pagedto.setEndrow(endRow);

		int heartListCnt = memberMapper.getHeartListCnt(htid);

		// 최대 page수
		int maxPage = (int) (Math.ceil((double) heartListCnt / pageLimit));

		// 첫페, 끝페
		int startPage = ((int) (Math.ceil((double) page / pageNumLimit)) - 1) * pageNumLimit + 1;
		int endPage = startPage + pageNumLimit - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}
		pagedto.setPage(page);
		pagedto.setStartpage(startPage);
		pagedto.setEndpage(endPage);
		pagedto.setMaxpage(maxPage);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("htid", htid);
		map.put("hotelDTO", hotelDTO);
		map.put("pagedto", pagedto);
		List<Map<String, Object>> heartList = memberMapper.heartList(map);
		System.out.println("heartList:::" + heartList);

		mav.addObject("pagedto", pagedto);
		mav.addObject("heartList", heartList);
		mav.setViewName("member/c_heartList");
		return mav;
	}

	// 찜삭제
	public String heartDelete(String htcode) {
		mav = new ModelAndView();

		// 찜 삭제
		int heartDelete = memberMapper.heartDelete(htcode);
		System.out.println(heartDelete);

		String result = "NO";
		if (heartDelete > 0) {
			result = "OK";
		}
		return result;
	}

	// 로그인 찾기
	public @ResponseBody String findLogin(String findname, String findnumber) {

		MemberDTO memberDTO = new MemberDTO();

		memberDTO.setMname(findname);
		memberDTO.setMphone(findnumber);

		// 아이디 찾기
		String result = memberMapper.findLogin(memberDTO);
		String findresult = null;

		// 로그인 아이디 확인 후 출력 리설트
		if (result == null) {
			findresult = "ID not Found";
		} else {
			findresult = "Find ID : " + result;
		}

		return findresult;
	}

	// 비밀번호 찾기
	public String findPassword(MemberDTO memberDTO) {

		// 비밀번호 찾기
		String result = memberMapper.findPassword(memberDTO);
		String findresult = null;

		// 비밀번호 확인 후 출력 리설트
		if (result == null) {
			findresult = "PASSWORD not Found";
		} else {
			findresult = "Find PASSWORD : " + result;
		}

		return findresult;
	}

	// 로그인 api 가입확인
	public String checkKakaoJoin(String userId) {

		// 카카오 아이디가 존재하는지 확인
		String mid = memberMapper.checkKakaoJoin(userId);
		String result = "NO";
		if (mid != null) {
			result = memberMapper.getMpassword(userId);
		}
		return result;
	}

	// 로그인 api로 가입하기 위해 Form으로 이동
	public ModelAndView joinKakaoForm(MemberDTO memberDTO) {
		mav = new ModelAndView();
		mav.addObject("memberDTO", memberDTO);
		mav.setViewName("member/joinKakaoForm");
		return mav;
	}

	// joinKakaoForm에서 회원가입
	public String kakaoJoin(MemberDTO memberDTO) {
		// Mcode 생성
		String getMcode = memberMapper.getMcode();
		String mcode;
		if (getMcode == null)
			getMcode = "ME000";
		int mcodeNum = Integer.parseInt(getMcode.substring(2, 5)) + 1;
		if (mcodeNum < 10) {
			mcode = "ME" + "00" + mcodeNum;
		} else if (mcodeNum < 100) {
			mcode = "ME" + "0" + mcodeNum;
		} else {
			mcode = "ME" + mcodeNum;
		}

		memberDTO.setMcode(mcode);
		// 회원 insert
		int insertResult = memberMapper.kakaoJoin(memberDTO);

		String result = "NO";
		if (insertResult > 0) {
			session.setAttribute("MLoginId", memberDTO.getMid());
			result = "OK";
		}
		return result;
	}

}
