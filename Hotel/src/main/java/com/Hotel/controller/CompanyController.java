package com.Hotel.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Hotel.dto.CityDTO;
import com.Hotel.dto.CompanyDTO;
import com.Hotel.dto.LandmarkDTO;
import com.Hotel.dto.RestaurantDTO;
import com.Hotel.service.CompanyService;

@Controller
public class CompanyController {
	@Autowired
	private CompanyService companyService;

	@Autowired
	private HttpSession session;

	private ModelAndView mav;

	// 관리자로그인 페이지
	@RequestMapping(value = "/AdminLoginForm")
	public String AdminLoginForm() {
		System.out.println("관리자로그인 폼!!");
		return "company/a_LoginForm";
	}

	// 관리자로그인 부분
	@RequestMapping(value = "/AdminLogin")
	public ModelAndView AdminLogin(CompanyDTO companyDTO) {
		System.out.println("/AdminLogin");
		System.out.println("관리자로그인 넘어가는..");
		mav = companyService.AdminLogin(companyDTO);
		return mav;
	}

	// 업체정보상세보기
	@RequestMapping(value = "/cpInfoView")
	public ModelAndView cpInfoView() {
		System.out.println("/cpInfoView");
		System.out.println("업체정보수정 view부분");
		mav = companyService.cpInfoView();
		return mav;
	}

	// 업체정보수정 폼
	@RequestMapping(value = "/CompanyModify")
	public ModelAndView CompanyModify() {
		System.out.println("/CompanyModify");
		System.out.println("업체정보수정폼");
		mav = companyService.CompanyModify();
		return mav;
	}

	// 업체정보수정!!부분
	@RequestMapping(value = "/CompanyModifyProcess")
	public ModelAndView CompanyModifyProcess(CompanyDTO companyDTO) {
		System.out.println("/CompanyModifyProcess");
		System.out.println("업체정보수정부분");
		mav = companyService.CompanyModifyProcess(companyDTO);
		System.out.println(companyDTO);
		return mav;
	}

	// 업체 회원가입 승인 페이지 (관리자)
	@RequestMapping(value = "a_approveJoin")
	public ModelAndView a_approveJoin() {
		System.out.println("a_approveJoin");
		mav = companyService.a_approveJoin();
		return mav;
	}

	// 회원가입 거절
	@RequestMapping(value = "comDecline")
	public @ResponseBody String comDecline(String cmcode) {
		System.out.println("comDecline");
		String result = companyService.comDecline(cmcode);
		return result;
	}

	// 회원가입 승인
	@RequestMapping(value = "comApprove")
	public @ResponseBody String comApprove(String cmcode) {
		System.out.println("comApprove");
		String result = companyService.comApprove(cmcode);
		return result;
	}

	// 관리자 레스토랑 리스트
	@RequestMapping(value = "/adminRestaurantList")
	public ModelAndView adminRestaurantList() {
		// adminRestaurantList

		mav = companyService.adminRestaurantList();

		return mav;
	}

	// 관리자 레스토랑 수정
	@RequestMapping(value = "/restaurantModify")
	public ModelAndView restaurantModify(RestaurantDTO restaurantDTO) throws IllegalStateException, IOException {
		// restaurantModify

		System.out.println("/restaurantModify");
		System.out.println(restaurantDTO.getRecode());
		mav = companyService.restaurantModify(restaurantDTO);

		return mav;
	}

	// 관리자 레스토랑 삭제
	@RequestMapping(value = "/restaurantDelete")
	public ModelAndView restaurantDelete(String recode) {
		// restaurantDelete

		System.out.println("/restaurantDelete");

		mav = companyService.restaurantDelete(recode);

		return mav;
	}

	// 관리자 레스토랑 수정 폼
	@RequestMapping(value = "/restaurantModifyForm")
	public ModelAndView restaurantModifyForm(String recode) {
		// restaurantModifyForm

		System.out.println("/restaurantModifyForm");
		System.out.println(recode);

		mav = companyService.restaurantModifyForm(recode);

		return mav;
	}

	// 관리자 랜드마크 리스트
	@RequestMapping(value = "/adminLandmarkList")
	public ModelAndView adminLandmarkList() {
		System.out.println("/adminLandmarkList");

		mav = companyService.adminLandmarkList();

		return mav;
	}

	// 관리자 랜드마크 수정 폼
	@RequestMapping(value = "/landmarkModifyForm")
	public ModelAndView landmarkModifyForm(String lacode) {
		// landmarkModifyForm

		System.out.println("/landmarkModifyForm");

		mav = companyService.landmarkModifyForm(lacode);

		return mav;
	}

	// 관리자 랜드마크 삭제
	@RequestMapping(value = "/landmarkDelete")
	public ModelAndView landmarkDelete(String lacode) {
		// landmarkDelete

		System.out.println("/landmarkDelete");

		mav = companyService.landmarkDelete(lacode);

		return mav;
	}

	// 관리자 랜드마크 수정
	@RequestMapping(value = "/landmarkModify")
	public ModelAndView landmarkModify(LandmarkDTO landmarkDTO)
			throws IllegalStateException, IOException {
		// landmarkModify

		System.out.println("/landmarkModify");

		mav = companyService.landmarkModify(landmarkDTO);

		return mav;
	}

	// 관리자 랜드마크 등록
	@RequestMapping(value = "/landmarkInsert")
	public ModelAndView landmarkInsert(LandmarkDTO landmarkDTO, CityDTO cityDTO)
			throws IllegalStateException, IOException {
		// landmarkInsert

		System.out.println("/landmarkInsert");

		mav = companyService.landmarkInsert(landmarkDTO, cityDTO);

		return mav;
	}

	// 관리자 랜드마크 등록 폼
	@RequestMapping(value = "/LandmarkInsertForm")
	public ModelAndView LandmarkInsertForm() {
		// landmarkInsertForm

		System.out.println("/LandmarkInsertForm");

		mav = companyService.landmarkInsertForm();

		return mav;
	}

	// 관리자 랜드마크 이름 중복확인
	@RequestMapping(value = "/lanameCheck")
	public @ResponseBody String lanameCheck(String inputLaname) {
		// lanameCheck

		System.out.println("/lanameCheck");

		String check = companyService.lanameCheck(inputLaname);

		return check;
	}

	// 관리자 메인페이지
	@RequestMapping(value = "/companyMain")
	public String companyMain() {
		return "company/companyMain";
	}

	// 관리자 1대1문의 리스트
	@RequestMapping(value = "/a_questionList")
	public ModelAndView a_questionList() {
		System.out.println("/a_questionList");
		mav = companyService.a_questionList();
		return mav;
	}

	// 관리자 맛집 등록으로 넘어가는거
	@RequestMapping(value = "/restaurantForm")
	public String restaurantForm() {
		return "company/restaurantForm";
	}

	// 관리자 맛집 등록하는거
	@RequestMapping(value = "/JoinRestaurant")
	public ModelAndView JoinRestaurant(RestaurantDTO restaurantDTO, CityDTO cityDTO)
			throws IllegalStateException, IOException {
		System.out.println("/JoinRestaurant");
		System.out.println(restaurantDTO);
		mav = companyService.JoinRestaurant(restaurantDTO, cityDTO);
		return mav;
	}

	// 업체회원가입 페이지 이동
	@RequestMapping(value = "/c_joinCompany")
	public String c_joinCompany() {
		return "company/c_joinCompany";
	}

	// 회원가입시 아이디 중복확인
	@RequestMapping(value = "/cmidCheck")
	public @ResponseBody String cmidCheck(String cmid) {
		System.out.println("/cmidCheck");
		String cmidCheck = companyService.cmidCheck(cmid);
		return cmidCheck;
	}

	// 회원가입
	@RequestMapping(value = "/companyJoin")
	public ModelAndView companyJoin(CompanyDTO comdto, RedirectAttributes ra) {
		System.out.println("/companyJoin");
		System.out.println(comdto);

		mav = companyService.companyJoin(comdto, ra);
		return mav;
	}

	// 관리자 업체리스트
	@RequestMapping(value = "/a_companyList")
	public ModelAndView companyList() {
		System.out.println("/companyList");
		mav = companyService.companyList();
		return mav;
	}

	// 관리자 업체 삭제
	@RequestMapping(value = "companyDelete")
	public ModelAndView companyDelete(String cmid, String cmcode) {
		System.out.println("/companyDelete::" + cmid);

		mav = companyService.companyDelete(cmid, cmcode);
		return mav;
	}

	// 관리자 업체 매출 현황
	@RequestMapping(value = "companySales")
	public ModelAndView companySales(@RequestParam(value = "year", defaultValue = "0") int year) {
		System.out.println("companySales");
		mav = companyService.companySales(year);
		return mav;
	}

}
