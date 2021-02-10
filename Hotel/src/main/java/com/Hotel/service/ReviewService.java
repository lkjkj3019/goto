package com.Hotel.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.Hotel.dto.HistoryDTO;
import com.Hotel.dto.PageDTO;
import com.Hotel.dto.ReviewDTO;
import com.Hotel.mapper.HotelMapper;
import com.Hotel.mapper.ReviewMapper;

@Service
public class ReviewService {

	@Autowired
	private ReviewMapper reviewMapper;

	@Autowired
	private HotelMapper hotelMapper;

	@Autowired
	private HttpSession session;

	private ModelAndView mav;

	// 리뷰 작성
	public String writeReview(ReviewDTO reviewDTO, String hocode, String v_bcode) {

		// vcode 만들기
		String getVcode = reviewMapper.getvcode(); // 가장 큰 vcode 가져오기
		String vcode;
		System.out.println(hocode);
		if (getVcode == null)
			getVcode = "RV000";
		int vcodeNum = Integer.parseInt(getVcode.substring(2, 5)) + 1; // vcode에서 숫자부분만 따로 뽑아서 1을 더해준다.
		if (vcodeNum < 10) {
			vcode = "RV" + "00" + vcodeNum; // 더한 vcodeNum이 한자리 숫자면
		} else if (vcodeNum < 100) { // 더한 vcodeNum이 두자리 숫자면
			vcode = "RV" + "0" + vcodeNum;
		} else { // 더한 vcodeNum이 세자리 숫자면
			vcode = "RV" + vcodeNum;
		}
		System.out.println(v_bcode);
		reviewDTO.setV_bcode(v_bcode);
		reviewDTO.setVcode(vcode);
		reviewDTO.setV_hocode(hocode);

		String data = "NO";

		// 리뷰 등록
		int insertResult = reviewMapper.insertReview(reviewDTO);
		// hotel 별점 update
		if (insertResult > 0) {
			int updateResult = hotelMapper.updateScore(hocode);
			data = "OK";
		}
		return data;
	}

	// 리뷰 삭제
	public Map<String, Object> deleteReview(String vcode, String hocode) {

		// 리뷰 삭제
		int deleteResult = reviewMapper.deleteReview(vcode);
		// hotel 별점 update
		if (deleteResult > 0) {
			int updateResult = hotelMapper.updateScore(hocode);
		}

		// 리뷰 리스트 select
		ArrayList<ReviewDTO> reviewList = reviewMapper.getReviewList(hocode);
		int reviewCnt = reviewMapper.getReviewCnt(hocode);

		// hotel 별점 가져오기
		float hoscore = hotelMapper.getHoscroe(hocode);

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("reviewList", reviewList);
		data.put("reviewCnt", reviewCnt);
		data.put("hoscore", hoscore);
		return data;
	}

	// 리뷰 수정
	public Map<String, Object> modifyReview(ReviewDTO reviewDTO, String hocode) {
		// 리뷰 수정
		int updateRVResult = reviewMapper.modifyReview(reviewDTO);
		// hotel 별점 update
		if (updateRVResult > 0) {
			int updateHOResult = hotelMapper.updateScore(hocode);
		}

		// 리뷰리스트 select
		ArrayList<ReviewDTO> reviewList = reviewMapper.getReviewList(hocode);
		int reviewCnt = reviewMapper.getReviewCnt(hocode);

		// hotel 별점 가져오기
		float hoscore = hotelMapper.getHoscroe(hocode);
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("reviewList", reviewList);
		data.put("reviewCnt", reviewCnt);
		data.put("hoscore", hoscore);
		return data;
	}

	// 리뷰 좋아요
	public String likeProcess(String vcode, String loginId, String hocode) {
		HistoryDTO history = new HistoryDTO();
		history.setHi_vcode(vcode);
		history.setHiid(loginId);

		// 좋아요 등록
		int insertResult = reviewMapper.likeProcess(history);
		String data = "NO";
		if (insertResult > 0) {
			data = "OK";
		}
		return data;
	}

	// 리뷰 좋아요 취소
	public String unlikeProcess(String vcode, String loginId, String hocode) {
		HistoryDTO history = new HistoryDTO();
		history.setHi_vcode(vcode);
		history.setHiid(loginId);

		// 좋아요 삭제
		int deleteResult = reviewMapper.unlikeProcess(history);
		String data = "NO";
		if (deleteResult > 0) {
			data = "OK";
		}
		return data;
	}

	// 나의 리뷰 삭제
	public ModelAndView reviewDelete(String vcode) {
		mav = new ModelAndView();

		// 좋아요 history 삭제
		int historyDelete = reviewMapper.historyDelete(vcode);

		// 리뷰 삭제
		int reviewDelete = reviewMapper.deleteReview(vcode);
		mav.setViewName("redirect: /reviewPage");
		return mav;
	}

	// 나의 후기
	public ModelAndView reviewPage(int page) {
		mav = new ModelAndView();
		String MloginId = (String) session.getAttribute("MLoginId");

		// 페이징 처리
		int pageLimit = 5;
		int pageNumLimit = 3;

		int startRow = (page - 1) * pageLimit + 1;
		int endRow = page * pageLimit;

		PageDTO pageDTO = new PageDTO();
		pageDTO.setStartrow(startRow);
		pageDTO.setEndrow(endRow);

		// 후기 리스트 select
		ArrayList<ReviewDTO> reviewList = reviewMapper.reviewPage(startRow, endRow, MloginId);
		System.out.println(page);

		// 페이징 처리
		int reviewListCnt = reviewMapper.getReviewListCnt();
		int maxPage = (int) (Math.ceil((double) reviewListCnt / pageLimit));
		int startPage = ((int) (Math.ceil((double) page / pageNumLimit)) - 1) * pageNumLimit + 1;
		int endPage = startPage + pageNumLimit - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}
		pageDTO.setPage(page);
		pageDTO.setStartpage(startPage);
		pageDTO.setEndpage(endPage);
		pageDTO.setMaxpage(maxPage);

		mav.addObject("reviewList", reviewList);
		mav.addObject("pageDTO", pageDTO);
		mav.setViewName("member/reviewPage");
		return mav;
	}

	// 관리자 후기리스트
	public ModelAndView a_selectReviewList() {
		mav = new ModelAndView();

		// 리뷰 리스트 select
		List<Map<String, Object>> reviewList = reviewMapper.selectReviewList();
		mav.addObject("reviewList", reviewList);
		mav.setViewName("admin/a_reviewList");
		return mav;
	}

	// 관리자 후기 리스트 삭제
	@Transactional(rollbackFor = Exception.class)
	public ModelAndView reviewListDel(String vcode) {
		mav = new ModelAndView();

		// 후기 history 삭제
		int HistoryDel = reviewMapper.historyDelete(vcode);

		// 후기 삭제
		int ReviewDel = reviewMapper.deleteReview(vcode);
		System.out.println("HistoryDel::" + HistoryDel);
		System.out.println("ReviewDel::" + ReviewDel);
		mav.setViewName("redirect:/a_reviewList");
		return mav;
	}

	// 리뷰 내용 가져오기
	public String getVcontent(String vcode) {
		String vcontent = reviewMapper.getVcontent(vcode);
		System.out.println(vcontent);
		return vcontent;
	}

}
