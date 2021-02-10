package com.Hotel.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.Hotel.dto.HistoryDTO;
import com.Hotel.dto.ReviewDTO;

public interface ReviewMapper {

	// 리뷰 등록
	int insertReview(ReviewDTO reviewDTO);

	// MAX RV코드 select
	String getvcode();

	// 리뷰 리스트 select
	ArrayList<ReviewDTO> getReviewList(String hocode);

	// 리뷰 개수 select
	int getReviewCnt(String hocode);

	// 리뷰 삭제
	int deleteReview(String vcode);

	// 리뷰 수정
	int modifyReview(ReviewDTO reviewDTO);

	// 좋아요 리스트 select
	ArrayList<HistoryDTO> getlikeList(String loginId);

	// 리뷰 좋아요
	int likeProcess(HistoryDTO history);

	// 리뷰 좋아요 취소
	int unlikeProcess(HistoryDTO history);

	// 리뷰 리스트 select
	public ArrayList<ReviewDTO> reviewList(String MloginId);

	// 리뷰 history 삭제
	public int historyDelete(String vcode);

	// 리뷰 리스트 select
	public ArrayList<ReviewDTO> reviewPage(@Param("startRow") int startRow, @Param("endRow") int endRow,
			@Param("MloginId") String MloginId);

	// 리뷰 개수 select
	public int getReviewListCnt();

	// 리뷰 리스트 select
	List<Map<String, Object>> selectReviewList();

	// 리뷰 내용 가져오기
	String getVcontent(String vcode);

}