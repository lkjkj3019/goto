<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/a_sidebar.jsp"%>


<div class="main">
	<section class="breadcrumb-section">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>자주 묻는 질문 작성</h2>
					<div class="breadcrumb-option">
						<span>FaqWriteForm</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- main top 끝 -->

	<!-- Contact Section Begin -->
	<section class="contact-section">
        <div class="single-property-item" style="background-color: white;">
            <div class="row">
				<div class="col-lg-7" style="margin-left: auto; margin-right: auto;">
					<div class="col-lg-10 offset-lg-1">
						<div class="contact-text">
								<form action="faqWriteForm" class="contact-form" method="post" id="insertForm">

									<!-- 고객센터 코드 선택 -->
									<div class="row">
										<div class="col-lg-4">
											<div class="section-title">
												<select name="faq_qccode">
													<option value="카테고리 선택">카테고리 선택</option>
													<option value="QC001">예약관련</option>
													<option value="QC002">취소관련</option>
													<option value="QC003">할인관련</option>
													<option value="QC004">회원관련</option>
													<option value="QC005">기타</option>
												</select>
											</div>
										</div>
									</div>
									<hr>

									<!-- 질문제목 -->
									<div class="ba-text">
										<input type="text" id="faqtitle" name="faqtitle" placeholder="문의 제목">
									</div>
									<br>

									<!-- 질문내용 답변 -->
									<div class="ba-text">
										<textarea rows="8" 
											id="faqcontent" name="faqcontent" placeholder="문의 답변"></textarea>
									</div>

									<!-- 등록 버튼 -->
									<hr>
									<div class="col-lg-12">
										<div class="loadmore">
											<button type="button" onclick="insertFormBtn()" class="btn site-btn">등록하기</button>
										</div>
									</div>
								</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
	<!-- Contact Section End -->
	</body>
	<script>
		function insertFormBtn(){
			alert('등록되었습니다.');
			insertForm.submit();
			}
	</script>
	<!-- Js Plugins -->
	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/js/jquery.nice-select.min.js"></script>
	<script src="resources/js/jquery.slicknav.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/main.js"></script>

	</html>