package com.Hotel.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Hotel.dto.CityDTO;
import com.Hotel.dto.CompanyDTO;
import com.Hotel.dto.HelpDTO;
import com.Hotel.dto.HotelDTO;
import com.Hotel.dto.LandmarkDTO;
import com.Hotel.dto.RestaurantDTO;
import com.Hotel.mapper.CityMapper;
import com.Hotel.mapper.CompanyMapper;
import com.Hotel.mapper.HotelMapper;
import com.Hotel.mapper.LandmarkMapper;
import com.Hotel.mapper.RestaurantMapper;

@Service
public class CompanyService {

	@Autowired
	private CompanyMapper companyMapper;

	@Autowired
	private RestaurantMapper restaurantMapper;

	@Autowired
	private LandmarkMapper landmarkMapper;

	@Autowired
	private HotelMapper hotelMapper;

	@Autowired
	private CityMapper cityMapper;

	@Autowired
	private HttpSession session;

	private ModelAndView mav;

	// 관리자로그인부분 세션값 ALoginId
	public ModelAndView AdminLogin(CompanyDTO companyDTO) {
		mav = new ModelAndView();

		// 관리자가 업체 승인
		CompanyDTO cmidCmcheck = companyMapper.AdminLogin(companyDTO);
		String ALoginId = "";
		int cmcheck = 0;
		if (cmidCmcheck != null) {
			ALoginId = cmidCmcheck.getCmid();
			System.out.println("ALoginId:::" + ALoginId);
			cmcheck = cmidCmcheck.getCmcheck();
		}

		String result;
		if (ALoginId != "") {
			if (cmcheck == 0) {// 승인안됨
				mav.setViewName("company/a_LoginForm");
				result = "WAIT";
			} else if (cmcheck == 2) {
				mav.setViewName("company/a_LoginForm");
				result = "DECLINE";
			} else {// 승인됨
				session.setAttribute("ALoginId", ALoginId);
				mav.setViewName("company/companyMain");
				result = "OK";
			}
		} else {// (ALoginId)아이디랑 비번이 맞지 않으면 로그인폼으로 이동
			mav.setViewName("company/a_LoginForm");
			result = "NO";
		}
		mav.addObject("loginResult", result);
		return mav;
	}

	// 업체정보 상세보기
	public ModelAndView cpInfoView() {
		mav = new ModelAndView();

		String loginId = (String) session.getAttribute("ALoginId");
		System.out.println("loginId:::" + loginId);

		// 로그인아이디(ALoginId)로 업체정보 불러오기
		CompanyDTO companyDTO = companyMapper.cpInfoView(loginId);
		mav.addObject("companyDTO", companyDTO);
		mav.setViewName("company/a_InfoView");
		return mav;
	}

	// 업체정보수정 폼
	public ModelAndView CompanyModify() {
		mav = new ModelAndView();
		String loginId = (String) session.getAttribute("ALoginId");

		// 로그인아이디(ALoginId)로 업체정보 불러오기
		CompanyDTO companyDTO = companyMapper.cpInfoView(loginId);
		mav.addObject("companyDTO", companyDTO);
		mav.setViewName("company/a_ModifyForm");

		return mav;
	}

	// 업체정보수정 부분
	public ModelAndView CompanyModifyProcess(CompanyDTO companyDTO) {
		mav = new ModelAndView();

		// 업체정보 수정
		int UpdateResult = companyMapper.CompanyModifyProcess(companyDTO);
		System.out.println("cmcode ::" + companyDTO.getCmcode());
		System.out.println("UpdateResult::" + UpdateResult);

		mav.setViewName("redirect:/cpInfoView");

		return mav;
	}

	// 업체 승인
	public ModelAndView a_approveJoin() {
		mav = new ModelAndView();

		// 업체리스트 select
		ArrayList<CompanyDTO> companyList = companyMapper.a_approveJoin();
		System.out.println(companyList);
		mav.addObject("companyList", companyList);
		mav.setViewName("admin/a_approveJoin");

		return mav;
	}

	// 업체 승인거절
	public String comDecline(String cmcode) {

		// 회원가입 승인 거절
		int updateResult = companyMapper.comDecline(cmcode);
		String result = "NO";

		if (updateResult > 0) {
			result = "OK";
		}

		return result;
	}

	// 업체 승인수락
	public String comApprove(String cmcode) {

		// 회원가입 승인 허락
		int updateResult = companyMapper.comApprove(cmcode);
		String result = "NO";

		if (updateResult > 0) {
			result = "OK";
		}

		return result;
	}

	// 관리자 레스토랑 리스트
	public ModelAndView adminRestaurantList() {
		mav = new ModelAndView();

		// 레스토랑 리스트
		ArrayList<RestaurantDTO> restaurantList = restaurantMapper.adminRestaurantList();
		mav.addObject("restaurantList", restaurantList);
		mav.setViewName("admin/adminRestaurantList");

		return mav;
	}

	// 관리자 레스토랑 수정
	public ModelAndView restaurantModify(RestaurantDTO restaurantDTO) throws IllegalStateException, IOException {
		mav = new ModelAndView();

		// 레스토랑 사진
		MultipartFile rephoto = null;
		String rephotoName = null;
		String savePath = "C:\\Users\\1\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\Hotel\\src\\main\\webapp\\resources\\img\\restaurantFile\\";
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());

		// 레스토랑 사진이 있을때 실행
		if (restaurantDTO.getRephoto() != null) {
			rephoto = restaurantDTO.getRephoto();
			rephotoName = uuid.toString() + "_" + rephoto.getOriginalFilename();
			System.out.println("rephotoName : " + rephotoName);

			// 레스토랑 사진이 비어있지 않을때
			if (!rephoto.isEmpty()) {
				rephoto.transferTo(new File(savePath + rephotoName));
			}
		} else {
			// 레스토랑 사진이 없을때
			rephotoName = restaurantMapper.getRephotoname(restaurantDTO.getRecode());
		}

		restaurantDTO.setRefilename(rephotoName);

		// 레스토랑 수정
		int insertResult = restaurantMapper.restaurantModify(restaurantDTO);

		mav.setViewName("redirect:/adminRestaurantList");
		return mav;
	}

	// 관리자 레스토랑 삭제
	public ModelAndView restaurantDelete(String recode) {
		mav = new ModelAndView();

		// 레스토랑 사진 삭제
		String deleteProfile = restaurantMapper.getRephotoname(recode);
		String savePath = "C:\\Users\\1\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\Hotel\\src\\main\\webapp\\resources\\img\\restaurantFile\\";
		File file = new File(savePath + deleteProfile);
		file.delete();

		// 레스토랑 삭제
		int deleteResult = restaurantMapper.restaurantDelete(recode);
		System.out.println("deleteResult:" + deleteResult);
		mav.setViewName("redirect:/adminRestaurantList");
		return mav;
	}

	// 관리자 레스토랑 수정 폼
	public ModelAndView restaurantModifyForm(String recode) {
		mav = new ModelAndView();

		// 레스토랑 정보 select
		RestaurantDTO restaurantDTO = restaurantMapper.restaurantModifyForm(recode);
		System.out.println(restaurantDTO);
		mav.addObject("rList", restaurantDTO);
		mav.setViewName("admin/restaurantModify");

		return mav;
	}

	// 관리자 랜드마크 리스트
	public ModelAndView adminLandmarkList() {
		mav = new ModelAndView();

		// 랜드마크 리스트 select
		ArrayList<LandmarkDTO> landmarkList = landmarkMapper.adminLandmarkList();

		mav.addObject("landmarkList", landmarkList);
		mav.setViewName("admin/adminLandmarkList");

		return mav;
	}

	// 관리자 랜드마크 수정 폼
	public ModelAndView landmarkModifyForm(String lacode) {
		mav = new ModelAndView();

		// 랜드마크 정보 select
		LandmarkDTO landmarkDTO = landmarkMapper.landmarkModifyForm(lacode);

		mav.addObject("lList", landmarkDTO);
		mav.setViewName("admin/landmarkModify");

		return mav;
	}

	// 관리자 랜드마크 삭제
	public ModelAndView landmarkDelete(String lacode) {
		mav = new ModelAndView();

		// 랜드마크 사진 삭제
		String deleteProfile = landmarkMapper.getLaphotoname(lacode);
		String savePath = "C:\\Users\\1\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\Hotel\\src\\main\\webapp\\resources\\img\\landmarkFile\\";
		File file = new File(savePath + deleteProfile);
		file.delete();

		// 랜드마크 삭제
		int deleteResult = landmarkMapper.landmarkDelete(lacode);

		System.out.println("deleteResult:" + deleteResult);
		mav.setViewName("redirect:/adminLandmarkList");

		return mav;
	}

	// 관리자 랜드마크 수정
	public ModelAndView landmarkModify(LandmarkDTO landmarkDTO) throws IllegalStateException, IOException {
		mav = new ModelAndView();

		// 랜드마크 사진 수정
		MultipartFile laphoto = null;
		String laphotoName = null;
		String savePath = "C:\\Users\\1\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\Hotel\\src\\main\\webapp\\resources\\img\\landmarkFile\\";
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());

		// 랜드마크 사진이 있을때 실행
		if (landmarkDTO.getLaphoto() != null) {
			laphoto = landmarkDTO.getLaphoto();
			laphotoName = uuid.toString() + "_" + laphoto.getOriginalFilename();
			System.out.println("laphotoName : " + laphotoName);

			// 사진이 비어있지 않을때
			if (!laphoto.isEmpty()) {
				laphoto.transferTo(new File(savePath + laphotoName));
			}
		} else {
			// 사진이 없을때
			laphotoName = landmarkMapper.getLaphotoname(landmarkDTO.getLacode());
		}
		landmarkDTO.setLafilename(laphotoName);

		// 랜드마크 수정
		int insertResult = landmarkMapper.landmarkModify(landmarkDTO);

		mav.setViewName("redirect:/adminLandmarkList");
		return mav;
	}

	// 관리자 랜드마크 등록
	public ModelAndView landmarkInsert(LandmarkDTO landmarkDTO, CityDTO cityDTO)
			throws IllegalStateException, IOException {
		mav = new ModelAndView();

		// 랜드마크 전체주소
		String addr1 = landmarkDTO.getLaaddr_address();
		String addr2 = landmarkDTO.getLaaddr_detailAddress();
		String addr3 = landmarkDTO.getLaaddr_postcode();
		String addr4 = landmarkDTO.getLaaddr_extraAddress();
		String laaddr = addr4 + addr1 + addr2 + addr3;

		landmarkDTO.setLaaddr(laaddr);
		System.out.println("laaddr : " + laaddr);

		// 랜드마크 시티코드 불러오기
		String ctcode = cityMapper.getCtcode(cityDTO);
		landmarkDTO.setLa_ctcode(ctcode);

		// 랜드마크 사진 등록
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());

		MultipartFile laphoto = landmarkDTO.getLaphoto();
		String savePath = "C:\\Users\\1\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\Hotel\\src\\main\\webapp\\resources\\img\\landmarkFile\\";
		String laphotoName = uuid.toString() + "_" + laphoto.getOriginalFilename();
		System.out.println("laphotoName : " + laphotoName);
		landmarkDTO.setLafilename(laphotoName);

		// 랜드마크 사진 비어있지 않을때
		if (!laphoto.isEmpty()) {
			laphoto.transferTo(new File(savePath + laphotoName));
		}

		// 랜드마크 등록
		int insertResult = landmarkMapper.landmarkInsert(landmarkDTO);

		mav.setViewName("redirect:/adminLandmarkList");
		return mav;
	}

	// 관리자 랜드마크 등록 폼
	public ModelAndView landmarkInsertForm() {
		mav = new ModelAndView();

		// 랜드마크 코드
		String getLacode = landmarkMapper.getlacode();
		String lacode;
		if (getLacode == null)
			getLacode = "LA000";
		int lacodeNum = Integer.parseInt(getLacode.substring(2, 5)) + 1; // bocode + 1
		if (lacodeNum < 10) {
			lacode = "LA" + "00" + lacodeNum;
		} else if (lacodeNum < 100) {
			lacode = "LA" + "0" + lacodeNum;
		} else {
			lacode = "LA" + lacodeNum;
		}
		System.out.println(lacode);

		mav.addObject("lacode", lacode);
		mav.setViewName("admin/landmarkInsert");

		return mav;
	}

	// 관리자 랜드마크 이름 중복확인
	public String lanameCheck(String inputLaname) {

		String check = null;
		String searchResult = landmarkMapper.lanameCheck(inputLaname);
		System.out.println("searchResult : " + searchResult);

		if (searchResult != null) {
			check = "NO";
		} else {
			check = "OK";
		}

		return check;
	}

	// 관리자 1대1문의 리스트
	public ModelAndView a_questionList() {
		mav = new ModelAndView();

		// 1대1문의 리스트 select
		ArrayList<HelpDTO> questionList = companyMapper.a_questionList();

		mav.addObject("questionList", questionList);
		mav.setViewName("company/questionList");

		return mav;
	}

	// 관리자 맛집 등록
	public ModelAndView JoinRestaurant(RestaurantDTO restaurantDTO, CityDTO cityDTO)
			throws IllegalStateException, IOException {
		mav = new ModelAndView();

		UUID uuid = UUID.randomUUID();

		// 레스토랑 코드
		String getRecode = companyMapper.getRecode();
		String recode;
		if (getRecode == null)
			getRecode = "RE000";
		int recodeNum = Integer.parseInt(getRecode.substring(2, 5)) + 1;
		if (recodeNum < 10) {
			recode = "RE" + "00" + recodeNum;
		} else if (recodeNum < 100) {
			recode = "RE" + "0" + recodeNum;
		} else {
			recode = "RE" + recodeNum;
		}

		// 레스토랑 전체 주소
		restaurantDTO.setReaddr("(" + restaurantDTO.getReaddr_postcode() + ")" + restaurantDTO.getReaddr_address()
				+ restaurantDTO.getReaddr_extraAddress() + restaurantDTO.getReaddr_detailAddress());

		// city코드
		String ctcode = cityMapper.getCtcode(cityDTO);
		restaurantDTO.setRe_ctcode(ctcode);

		// 레스토랑 사진등록
		MultipartFile rephoto = restaurantDTO.getRephoto();
		String refileName = uuid.toString() + "_" + rephoto.getOriginalFilename();
		System.out.println("refileName::" + refileName);

		String savePath = "C:\\Users\\1\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\Hotel\\src\\main\\webapp\\resources\\img\\restaurantFile\\";

		// 레스토랑 사진이 비어있지 않을때
		if (!rephoto.isEmpty()) {
			rephoto.transferTo(new File(savePath + refileName));
		}
		restaurantDTO.setRecode(recode);
		restaurantDTO.setRefilename(refileName);

		// 레스토랑 등록
		int insertResult = companyMapper.JoinRestaurant(restaurantDTO);

		mav.setViewName("redirect:/adminRestaurantList");
		return mav;
	}

	// 회원가입시 아이디 중복확인
	public String cmidCheck(String cmid) {
		String cmidCheck = companyMapper.cmidCheck(cmid);

		String checkResult = null;
		if (cmidCheck == null) {
			checkResult = "OK";
		} else {
			checkResult = "NO";
		}
		return checkResult;
	}

	// 회원가입
	public ModelAndView companyJoin(CompanyDTO comdto, RedirectAttributes ra) {
		mav = new ModelAndView();
		System.out.println("service :: companyJoin");

		// 이메일 전체주소
		comdto.setCmemail(comdto.getCmmailid() + "@" + comdto.getCmdomain());

		// 업체 전체주소
		comdto.setCmaddress(
				"(" + comdto.getCmpost() + ")" + comdto.getCmaddr() + comdto.getCmexaddr() + comdto.getCmdetail());

		String cmcode;// 업체 코드
		String maxNum = companyMapper.getMaxNum();// 최대 코드수

		int cmNum = Integer.parseInt(maxNum.substring(2, 5)) + 1;// cmNum에 뒤숫자 3자리를 가져와 +1를 한다

		if (cmNum < 10) {// 뒤숫자에 앞에 문자를 붙어주자
			cmcode = "CM" + "00" + cmNum;
		} else if (cmNum < 100) {
			cmcode = "CM" + "0" + cmNum;
		} else {
			cmcode = "CM" + cmNum;
		}
		comdto.setCmcode(cmcode);

		int companyJoin = companyMapper.companyJoin(comdto);
		if (companyJoin > 0) {
			String msg = comdto.getCmid() + " 님 가입되었습니다.";
			mav.addObject("msg", msg);
		}

		System.out.println("companyJoin :: " + companyJoin);

		mav.setViewName("company/a_LoginForm");
		return mav;
	}

	// 업체리스트
	public ModelAndView companyList() {
		mav = new ModelAndView();

		// 업체 리스트 select
		ArrayList<CompanyDTO> companyList = companyMapper.companyList();
		System.out.println(companyList);
		String ALoginId = (String) session.getAttribute("ALoginId");

		// 업체 비밀번호
		String loginPw = companyMapper.getloginPw(ALoginId);

		mav.addObject("loginPw", loginPw);
		mav.addObject("companyList", companyList);
		mav.setViewName("admin/a_companyList");
		return mav;
	}

	// 업체삭제
	@Transactional(rollbackFor = { Exception.class })
	public ModelAndView companyDelete(String cmid, String cmcode) {
		mav = new ModelAndView();

		// history 삭제
		companyMapper.deleteHistory(cmid);
		// 리뷰 삭제
		companyMapper.deleteReview(cmid);
		// 찜 삭제
		companyMapper.deleteHeartHotel(cmid);
		// 호텔정보 삭제
		companyMapper.deleteH_Info(cmid);
		// 예약 삭제
		companyMapper.deleteBooking(cmid);

		// 룸 사진 삭제
		String[] deleteProfile = companyMapper.getRoomFilename(cmid);
		String savePath = "C:\\Users\\1\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\Hotel\\src\\main\\webapp\\resources\\img\\roomFile\\";
		for (int i = 0; i < deleteProfile.length; i++) {
			System.out.println(deleteProfile[i]);
			File file = new File(savePath + deleteProfile[i]);
			file.delete();
		}

		// 호텔 사진 삭제
		String[] deleteHotelProfile = companyMapper.getHotelFilename(cmid);
		String hotelSavePath = "C:\\Users\\1\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\Hotel\\src\\main\\webapp\\resources\\img\\hotelFile\\";
		for (int i = 0; i < deleteHotelProfile.length; i++) {
			File hotelFile = new File(hotelSavePath + deleteHotelProfile[i]);
			hotelFile.delete();
		}

		// 룸, 호텔 삭제
		companyMapper.deleteRoom(cmid);
		companyMapper.deleteHotel(cmid);

		// 업체 삭제
		int companyDelete = companyMapper.companyDelete(cmid);
		System.out.println("companyDelete::" + companyDelete);

		if (cmcode == null)
			mav.setViewName("redirect:/a_companyList");
		else {
			session.invalidate();
			mav.setViewName("redirect:/");
		}
		return mav;
	}

	// 업체 매출 현황
	public ModelAndView companySales(int year) {
		mav = new ModelAndView();

		// 이번년도 월별 매출 select
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");// 날짜 포맷 만들기
		String loginId = (String) session.getAttribute("ALoginId");
		Calendar firstDate = Calendar.getInstance();// 이번년도 첫 날짜
		firstDate.set(firstDate.get(Calendar.YEAR), Calendar.JANUARY, 1);// (현재년도, 1월, 1일)
		Calendar lastDate = Calendar.getInstance();// 이번년도 마지막 날짜
		lastDate.set(lastDate.get(Calendar.YEAR), Calendar.DECEMBER, 31);// (현재년도, 12월, 31일)

		// 넘어오는 년도가 0이 아닐때
		if (year != 0) {
			// 넘어오는 년도로 set
			firstDate.set(Calendar.YEAR, year);
			lastDate.set(Calendar.YEAR, year);
			mav.setViewName("company/a_companySalesYear");
		} else {
			// 현재년도로 set
			mav.setViewName("company/a_companySales");
		}

		// 만든 날짜 포맷에 넣기
		String firstDateFormat = format.format(firstDate.getTime());
		String lastDateFormat = format.format(lastDate.getTime());

		// 업체 매출 리스트 select
		List<Map<String, Object>> salesList = companyMapper.salesList(firstDateFormat, lastDateFormat, loginId);
		System.out.println(salesList);

		// hotel 조회수 select
		ArrayList<HotelDTO> hotelHitList = hotelMapper.gethitList(loginId);
		System.out.println(hotelHitList);

		// 호텔에 booking 내역이 있는 year select
		ArrayList<Integer> yearList = companyMapper.yearList(loginId);
		System.out.println(yearList);

		mav.addObject("salesList", salesList);
		mav.addObject("hotelHitList", hotelHitList);
		mav.addObject("yearList", yearList);

		return mav;
	}

}
