<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<style>
#help {
	color: #2CBDB8;
}
</style>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>Help</h2>
					<div class="breadcrumb-option">
						<a href="/"><i class="fa fa-home"></i> Home</a> <a
							href="c_FAQList">Help</a> <span>자주 묻는 질문</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section Begin -->

<!-- Property Section Begin -->
<section class="property-section spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="property-sidebar">
					<div class="best-agents">
						<h4>Help</h4>
						<c:if test="${sessionScope.MLoginId != null }">
							<a href="questionList" class="ba-item">
								<div class="ba-text">
									<h5>1대1 문의 목록</h5>
									<span>Q&A</span>
								</div>
							</a>
							<a href="HelpWriteForm" class="ba-item">
								<div class="ba-text">
									<h5>1대1 문의 작성</h5>
									<span>1:1 Write</span>
								</div>
						</c:if>
						</a> <a href="/c_FAQList" class="ba-item">
							<div class="ba-text">
								<h5>자주 묻는 질문</h5>
								<span>FAQ</span>
							</div>
						</a>

					</div>
				</div>
			</div>
			<!-- 사이드 메뉴 끝 -->

			<div class="col-lg-9">
				<h4 class="property-title">자주 묻는 질문</h4>
				<div class="property-list">
					<form action="searchingFAQList" class="sidebar-search">
						<select name="faq_qccode">
							<option value="#">직접입력</option>
							<option value="QC001">예약관련</option>
							<option value="QC002">취소관련</option>
							<option value="QC003">할인관련</option>
							<option value="QC004">회원관련</option>
							<option value="QC005">기타</option>
						</select>
						<button type="submit" class="btn">검색</button>
					</form><br><br>
					<div class="single-property-item">
						<div class="row">
							<div class="col-lg-12 accordion_one">
								<div class="panel-group" id="accordion_oneRight">
									<c:forEach var="fList" items="${FaqList }" varStatus="num">
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title">
													<a class="collapsed" data-toggle="collapse"
														data-parent="#accordion_oneRight"
														href="#collapseFiveRightone${fList.qccode }${num.index }"
														aria-expanded="false" style="font-weight: bold;"> Q.
														${fList.faqtitle } </a>
												</h4>
											</div>
											<div id="collapseFiveRightone${fList.qccode }${num.index }"
												class="panel-collapse collapse" aria-expanded="false"
												role="tablist">
												<div class="panel-body">
													<div class="text-accordion">
														<p>A. ${fList.faqcontent }</p>
													</div>
												</div>
												<!-- end of panel-body -->
											</div>
										</div>
										<!-- /.panel-default -->
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
</section>
<!-- Property Section End -->




<%@ include file="../includes/footer.jsp"%>