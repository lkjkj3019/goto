package com.Hotel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Hotel.dto.BookingDTO;
import com.Hotel.dto.HotelDTO;
import com.Hotel.dto.MemberDTO;
import com.Hotel.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private HttpSession session;

	private ModelAndView mav;

	// 회원로그인 페이지
	@RequestMapping(value = "/MemberLoginForm")
	public String MemberLoginForm() {
		System.out.println("회원로그인 폼!!");
		return "member/MemberLoginForm";
	}

	// 회원로그인부분
	@RequestMapping(value = "/MemberLogin")
	public ModelAndView MemberLogin(MemberDTO memberDTO) {
		System.out.println("/MemberLogin");
		System.out.println("회원로그인 넘어가는..");
		mav = memberService.MemberLogin(memberDTO);
		System.out.println(memberDTO);
		return mav;

	}

	// 로그아웃
	@RequestMapping(value = "/Logout")
	public String Logout() {
		session.invalidate();
		return "index";
	}

	// (고객페이지) 내가 예약한 목록
	@RequestMapping(value = "c_myBookingList")
	public ModelAndView c_myBookingList(@RequestParam(value = "page", defaultValue = "1") int page) {
		System.out.println("c_myBookingList");
		mav = memberService.c_myBookingList(page);
		return mav;
	}

	// (고객페이지) 예약 삭제
	@RequestMapping(value = "deleteBooking")
	public @ResponseBody String deleteBooking(String bcode) {
		System.out.println("deleteBooking");
		String result = memberService.deleteBooking(bcode);
		return result;
	}

	// (관리자페이지) 회원 리스트
	@RequestMapping(value = "a_memberList")
	public ModelAndView a_memberList() {
		System.out.println("a_memberList");
		mav = memberService.a_memberList();
		return mav;
	}

	// 회원 삭제
	@RequestMapping(value = "a_memberDelete")
	public @ResponseBody String a_memberDelete(MemberDTO memberDTO) {
		System.err.println("a_memberDelete");
		String result = memberService.a_memberDelete(memberDTO);
		return result;
	}

	//예약확인 폼
	@RequestMapping(value="/bookingCheckForm")
	public ModelAndView bookingCheckForm(BookingDTO bookingDTO) {
		// bookingCheckForm

		mav = memberService.bookingCheckForm(bookingDTO);

		return mav;
	}

	//예약확인
	@RequestMapping(value="/bookingCheck")
	public ModelAndView bookingCheck(BookingDTO bookingDTO) {
		// bookingCheck

		mav = memberService.bookingCheck(bookingDTO);

		return mav;
	}

	// 회원가입을 누르면 일반 회원가입 업체 회원가입이 뜨는것
	@RequestMapping(value = "/joinSelect")
	public String joinSelect() {
		return "member/joinSelect";
	}

	// 일반 회원가입을 누르면 회원가입 창으로 넘어가는것
	@RequestMapping(value = "/joinMemberForm")
	public String joinMemberForm() {
		return "member/joinMember";
	}

	//아이디 중복 확인 하는것
	@RequestMapping(value = "/idCheck")
	public @ResponseBody String idCheck(String inputMid) {
		String checkResult = memberService.idCheck(inputMid);
		return checkResult;
	}

	//회원가입을 다 작성하고 회원가입을 누르면 memberDTO에 저장된다.
	@RequestMapping(value ="/joinMember")
	public ModelAndView joinMember(MemberDTO memberDTO, RedirectAttributes ra) {
		System.out.println("/joinMember");
		System.out.println(memberDTO);
		mav = memberService.joinMember(memberDTO,ra);
		return mav;
	}

	//마이페이지
	@RequestMapping(value = "/c_mypage")
	public ModelAndView mypage() {
		System.out.println("/c_mypage");
		System.out.println("MemberDTO 가져오는 중");
		mav = memberService.selectMembers();
		return mav;
	}

	//회원수정
	@RequestMapping(value="/memberModify")
	public @ResponseBody String modify(MemberDTO memberDTO) {
		System.out.println("/memberModify");
		System.out.println("회원 정보 수정하는 중");
		String result = memberService.updateMembers(memberDTO);
		return result;
	}
	//회원탈퇴
	@RequestMapping(value="/memberDelete")
	public @ResponseBody String delMembers(MemberDTO memberDTO) {
		System.out.println("/memberDelete");
		System.out.println("회원 탈퇴 하는 중");
		String result = memberService.delMembers(memberDTO);
		System.err.println(result);
		session.invalidate();
		return result;
	}


	//찜목록 페이지 이동
	@RequestMapping(value = "/c_heartList")
	public String c_heartList() {
		return "member/c_heartList";
	}


	//찜목록 출력+찜목록 페이징
	@RequestMapping (value = "/heartList")
	public ModelAndView heartList(HotelDTO hotelDTO, @RequestParam(value = "page",defaultValue = "1") int page) {
		System.out.println("/heartList");
		System.out.println(hotelDTO);
		mav = memberService.heartList(hotelDTO,page);
		return mav;
	}


	//찜삭제
	@RequestMapping (value = "/heartDelete")
	public @ResponseBody String heartDelete (String htcode) {
		System.out.println("/heartDelete");

		String result = memberService.heartDelete(htcode);
		return result;
	}

	// 아이디 찾기로 이동
	@RequestMapping(value="/findLoginForm")
	public String findLoginForm() {
		System.out.println("/findLoginForm");

		return "member/findLogin";
	}

	// 아이디 찾기
	@RequestMapping(value="/findLogin")
	public @ResponseBody String findLogin(String findname, String findnumber) {
		System.out.println("/findLogin : " + findname + "/" + findnumber);

		String result = memberService.findLogin(findname, findnumber);

		return result;
	}

	// 비밀번호 찾기로 이동
	@RequestMapping(value="/findPasswordForm")
	public String findPasswordForm() {
		System.out.println("/findPasswordForm");

		return "member/findPassword";
	}

	// 비밀번호 찾기
	@RequestMapping(value="/findPassword")
	public @ResponseBody String findPassword(MemberDTO memberDTO) {
		System.out.println("/findLogin : " + memberDTO.getMemail());

		String result = memberService.findPassword(memberDTO);

		return result;
	}

	// 로그인 api버튼을 눌렀을때 가입된 회원이 있는지 확인
	@RequestMapping(value = "/checkKakaoJoin")
	public @ResponseBody String checkKakaoJoin(String userId) {
		System.out.println("checkKakaoJoin");
		String result = memberService.checkKakaoJoin(userId);
		return result;
	}
	
	// 로그인 api로 가입하기 위해 Form으로 이동
	@RequestMapping(value = "/joinKakaoForm")
	public ModelAndView joinKakaoForm(MemberDTO memberDTO) {
		System.out.println("joinKakaoForm");
		mav = memberService.joinKakaoForm(memberDTO);
		return mav;
	}
	
	// joinKakaoForm에서 회원가입
	@ResponseBody
	@RequestMapping(value = "/kakaoJoin")
	public void kakaoJoin(MemberDTO memberDTO) {
		System.out.println("kakaoJoin");
		String result = memberService.kakaoJoin(memberDTO);
	}
}
