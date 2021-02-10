<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>

<style>
.accordion_one .panel-group {
	margin-bottom: 0;
	border: 1px solid #f1f1f1;
	margin-left: 1px
}

.accordion_one .panel {
	background-color: transparent;
	box-shadow: none;
	border-bottom: 0px solid transparent;
	border-radius: 0;
	margin: 0
}

.accordion_one .panel-default {
	border: 0
}

.accordion_one .panel-default>.panel-heading {
	border-radius: 0px
}

.panel-title {
	margin-top: 0;
	margin-bottom: 0;
	font-size: 16px;
	color: inherit
}

h4 {
	font-size: 18px;
	line-height: 24px
}

.accordion_one .panel .panel-heading a.collapsed {
	color: #999999;
	display: block;
	padding: 12px 30px;
	border-top: 0px
}

.accordion_one .panel .panel-heading a {
	display: block;
	padding: 12px 30px;
	background: #fff;
	color: #313131;
	border-bottom: 1px solid #f1f1f1
}

.accordion-wrap .panel .panel-heading a {
	font-size: 14px
}

.accordion_one .panel-group .panel-heading+.panel-collapse>.panel-body {
	border-top: 0;
	padding-top: 0;
	padding: 25px 30px 30px 35px;
	background: #fff;
	color: #999999
}

.img-accordion {
	width: 81px;
	float: left;
	margin-right: 15px;
	display: block
}

.accordion_one .panel .panel-heading a:after {
	content: "\2212"
}

.accordion_one .panel .panel-heading a:after, .accordion_one .panel .panel-heading a.collapsed:after
	{
	font-family: 'FontAwesome';
	font-size: 15px;
	width: 36px;
	height: 48px;
	line-height: 48px;
	text-align: center;
	background: #F1F1F1;
	float: left;
	margin-left: -31px;
	margin-top: -12px;
	margin-right: 15px
}

a:link {
	text-decoration: none
}
</style>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section contact-page">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>Help</h2>
					<div class="breadcrumb-option">
						<a href="index"><i class="fa fa-home"></i> Home</a> <a
							href="c_questionList">Help</a> <span>자주 묻는 질문</span>
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
						<a href="questionList" class="ba-item">
							<div class="ba-text">
								<h5>1대1 문의 목록</h5>
								<span>Q&A</span>
							</div>
						</a> <a href="#" class="ba-item">
							<div class="ba-text">
								<h5>1대1 문의 작성</h5>
								<span>1:1 Write</span>
							</div>
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
					<div class="single-property-item">
						<div class="row">
							<div class="col-lg-10 accordion_one">
								<div class="panel-group" id="accordion_oneRight">
									<c:forEach var="fList" items="${FaqList }">
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title">
													<a class="collapsed" data-toggle="collapse"
														data-parent="#accordion_oneRight"
														href="#collapseFiveRightone${fList.qccode }"
														aria-expanded="false" style="font-weight: bold;">
														${fList.faqtitle } </a>
												</h4>
											</div>
											<div id="#collapseFiveRightone${fList.qccode }"
												class="panel-collapse collapse" aria-expanded="false"
												role="tablist">
												<div class="panel-body">
													<div class="text-accordion">
														<p>${fList.faqcontent }</p>
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
</section>
<!-- Property Section End -->




<%@ include file="../includes/footer.jsp"%>