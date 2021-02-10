<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/a_sidebar.jsp"%>
<div class="main">
	<section class="breadcrumb-section">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>1대1 문의 관리</h2>
					<div class="breadcrumb-option">
						<span>QuestionList</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- main top 끝 -->

	<!-- main container 시작 -->
	<section class="property-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="property-list">
						<c:choose>
							<c:when test="${sessionScope.ALoginId=='ADMIN' }">
								<div class="card shadow">
									<div class="card-body">
										<div class="table-responsive">
											<table class="table table-bordered" cellspacing="0">
												<thead>
													<tr>
														<th>작성자</th>
														<th>제목</th>
														<th>작성날짜</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="qList" items="${questionList}">

														<tr>
															<td>${qList.he_mid }</td>
															<td><a
																style="color: black; text-decoration: underline;"
																href="a_helpAnswer?hecode=${qList.hecode }">${qList.hetitle }</a></td>
															<td>${qList.hedate }</td>
														</tr>
													</c:forEach>
													<tr>
														<td colspan="3" style="text-align: center;">
															<div class="col-lg-12">
																<div class="loadmore">
																	<a href="companyMain" class="site-btn btn">메인으로</a>
																</div>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- main container 끝 -->
</div>
</div>
<!-- main 끝 -->

</body>


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