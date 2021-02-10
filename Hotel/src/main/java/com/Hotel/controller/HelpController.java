package com.Hotel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Hotel.dto.FaqDTO;
import com.Hotel.dto.HelpDTO;
import com.Hotel.service.HelpService;

@Controller
public class HelpController {

	@Autowired
	private HelpService helpService;

	@Autowired
	private HttpSession session;

	private ModelAndView mav;

	// 1대1문의 작성폼
	@RequestMapping(value = "/HelpWriteForm")
	public ModelAndView HelpWriteForm() {
		System.out.println("1대1문의 작성폼!!");
		mav = helpService.helpWriteForm();
		return mav;

	}

	// 1대1문의 작성부분
	@RequestMapping(value = "/HelpWrite")
	public @ResponseBody String HelpWrite(HelpDTO helpDTO) {
		System.out.println("/HelpWrite");
		System.out.println("1대1문의 작성 폼");

		System.out.println(helpDTO);
		String result = helpService.HelpWrite(helpDTO);

		return result;
	}

	// 자주묻는리스트 부분
	@RequestMapping(value = "/FaqList")
	public ModelAndView FaqList(FaqDTO faqDTO) {
		System.out.println("/FaqList");
		System.out.println("자주묻는리스트 부분");

		System.out.println(faqDTO);
		mav = helpService.FaqList(faqDTO);

		return mav;
	}

	// 자주묻는리스트 삭제
	@RequestMapping(value = "/FaqListDel")
	public ModelAndView FaqListDel(String faqcode) {
		System.out.println("/FaqListDel");
		System.out.println("자주묻는리스트 삭제 부분");

		System.out.println(faqcode);
		mav = helpService.FaqListDel(faqcode);

		return mav;
	}

//	FAQ 리스트
	@RequestMapping(value = "/c_FAQList")
	public ModelAndView selectFaq() {
		System.out.println("/c_FAQList");
		System.out.println("리스트 가져오는 중");
		mav = helpService.selectFaq();
		return mav;
	}

//	1:1답변
	@RequestMapping(value = "/a_helpAnswer")
	public ModelAndView helpAnswer(String hecode) {
		System.out.println("/a_helpAnswer");
		System.out.println("답변을 위해 리스트 가져오는 중");
		mav = helpService.helpAnswer(hecode);
		return mav;
	}

//	답변 등록
	@RequestMapping(value = "/answerUpdate")
	public @ResponseBody String answerUpdate(String hecode, String heanswer) {
		System.out.println("/answerUpdate");
		System.out.println("답변 등록하는 중");
		String result = helpService.answerUpdate(hecode, heanswer);
		return result;
	}

	// 1대1질문 목록 페이지 이동
	@RequestMapping(value = "/c_questionList")
	public String c_questionList() {
		return "member/c_questionList";
	}

	// 1대1질문 목록
	@RequestMapping(value = "/questionList")
	public ModelAndView questionList() {
		System.out.println("/questionList");
		mav = helpService.questionList();
		return mav;
	}

//	1대1문의 목록 카테고리
	@RequestMapping(value = "/questionSelect")
	public ModelAndView questionSelect(String he_qccode) {
		System.out.println("/questionSelect");
		System.out.println("1대1문의 목록 카테고리 ");
		System.out.println("he_qccode::" + he_qccode);
		mav = helpService.questionSelect(he_qccode);

		return mav;
	}

	// 자묻질 작성 페이지 이동
	@RequestMapping(value = "/a_faqWriteForm")
	public String a_faqWriteForm() {
		return "admin/a_faqWriteForm";
	}

	// 자묻질 작성
	@RequestMapping(value = "/faqWriteForm")
	public ModelAndView faqWriteForm(FaqDTO faqDTO) {
		System.out.println("/faqWriteForm");
		System.out.println(faqDTO);

		mav = helpService.faqWriteForm(faqDTO);
		return mav;
	}

	// FAQ 카테고리 선택 리스트
	@RequestMapping(value = "/searchingFAQList")
	public ModelAndView searchingFAQList(String faq_qccode) {
		// searchingFAQList
		mav = helpService.searchingFAQList(faq_qccode);

		return mav;
	}

}
