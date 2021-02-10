package com.Hotel.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Hotel.dto.ReviewDTO;
import com.Hotel.service.ReviewService;

@Controller
public class ReviewController {

	private ModelAndView mav;

	@Autowired
	private ReviewService reviewService;

	// 리뷰 등록
	@RequestMapping(value = "writeReview")
	public @ResponseBody String writeReview(ReviewDTO reviewDTO, String hocode, String v_bcode) {
		System.out.println("writeReview");
		String data = reviewService.writeReview(reviewDTO, hocode, v_bcode);
		return data;
	}

	// 리뷰 삭제
	@RequestMapping(value = "deleteReview")
	public @ResponseBody Map<String, Object> deleteReview(String vcode, String hocode) {
		System.out.println("deleteReview");
		Map<String, Object> data = reviewService.deleteReview(vcode, hocode);
		return data;
	}

	// 리뷰 수정
	@RequestMapping(value = "modifyReview")
	public @ResponseBody Map<String, Object> modifyReview(ReviewDTO reviewDTO, String hocode) {
		System.out.println("modifyReview");
		Map<String, Object> data = reviewService.modifyReview(reviewDTO, hocode);
		return data;
	}

	// 리뷰 좋아요
	@RequestMapping(value = "likeProcess")
	public @ResponseBody String likeProcess(String vcode, String loginId, String hocode) {
		System.out.println("likeProcess");
		String data = reviewService.likeProcess(vcode, loginId, hocode);
		return data;
	}

	// 리뷰 좋아요 취소
	@RequestMapping(value = "unlikeProcess")
	public @ResponseBody String unlikeProcess(String vcode, String loginId, String hocode) {
		System.out.println("likeProcess");
		String data = reviewService.unlikeProcess(vcode, loginId, hocode);
		return data;
	}

	// 나의 후기 리스트 페이지로 넘어가는것
	@RequestMapping(value = "/reviewListForm")
	public String reviewListForm() {
		return "member/reviewList";
	}

	// 나의 후기 삭제
	@RequestMapping(value = "/reviewDelete")
	public ModelAndView reviewDelete(String vcode) {
		System.out.println("/reviewDelete");
		System.out.println("vcode:" + vcode);
		mav = reviewService.reviewDelete(vcode);
		return mav;
	}

	// 리뷰 페이징
	@RequestMapping(value = "/reviewPage")
	public ModelAndView reviewPage(@RequestParam(value = "page", defaultValue = "1") int page) {
		System.out.println("/reviewPage");
		System.out.println("page::" + page);
		mav = reviewService.reviewPage(page);

		return mav;
	}

//		관리자 후기 리스트
	@RequestMapping(value = "/a_reviewList")
	public ModelAndView a_reviewList() {
		System.out.println("/a_reviewList");
		System.out.println("리뷰 리스트 가져오는 중");
		mav = reviewService.a_selectReviewList();
		return mav;
	}

//		관리자 후기 삭제
	@RequestMapping(value = "/reviewDel")
	public ModelAndView reviewListDel(String vcode) {
		System.out.println("/reviewDel");
		System.out.println("리뷰 삭제하는 중");
		mav = reviewService.reviewListDel(vcode);
		return mav;
	}

	// 리뷰 내용 가져오기
	@RequestMapping(value = "getVcontent", produces = "application/text; charset=utf-8")
	public @ResponseBody String getVcontent(String vcode) {
		System.out.println("getVcontent");
		String data = reviewService.getVcontent(vcode);
		return data;
	}

}
